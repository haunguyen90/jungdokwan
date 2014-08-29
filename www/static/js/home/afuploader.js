(function () {
    function AfUploader() {
        this._files = [];
        this._fields = [];
    }
    $.extend(AfUploader.prototype, {
        getXhrGenerator: function (progressCallback) {
            var xhr = $.ajaxSettings.xhr();
            if (progressCallback && "upload" in xhr) {
                xhr.upload.addEventListener('progress', progressCallback);
            }
            return xhr;
        },
        setUrl: function (url) {
            this.url = url;
        },
        addFile: function (name, file, attrs) {
            if (file instanceof HTMLInputElement || file instanceof File) {
                // If we can get html5 style File objects we'll use those.
                if ("files" in file) {
                    for (var i=0, c=file.files.length; i<c; i++) {
                        var f = file.files[i];
                        this.addFile(name, f);
                    }
                    
                }
                // If not we'll keep the input itself.
                else {
                    this._files.push({
                        "name": name,
                        "value": file,
                        "attrs": attrs
                    });
                    
                }
            }
            else {
                throw "Not a file: " + file.toString();
            }
        },
        deleteByFilename: function (filename) {
            var keep = [];
            for (var i=0, c=this._files.length; i<c; i++) {
                if (this._files[i].value instanceof File) {
                    if (filename != this._files[i].value.name) {
                        keep.push(this._files[i]);
                    }
                }
                else {
                    if (filename != this._files[i].attrs.filename) {
                        keep.push(this._files[i]);
                    }
                }
            }
            this._files = keep;
        },
        getFilesMeta: function () {
            var list = [];
            for (var i in this._files) {
                var v = this._files[i].value;
                if (v instanceof File) {
                    list.push({
                        "filename": v.name,
                        "size": v.size,
                    });
                }
            }
            return list;
        },
        getFileCount: function () {
            return this._files.length;
        },
        addField: function (name, value) {
            this._fields.push({
                "name": name,
                "value": value
            });
        },
        send: function () {
            var workFn = this._selectWorkerFn(),
                deferred = $.Deferred(workFn.bind(this));
            return deferred.promise();
        },
        reset: function () {
            this._files = [];
            this._fields = [];
        },

        _selectWorkerFn: function () {
            if ("FormData" in window) {
                return this._ajaxSend;
            }
            else {
                return this._fallbackSend;
            }
        },
        _ajaxSend: function (deferred) {
            if (!this.url) {
                throw "no url set";
            }

            var forms = _.map(this._files, function (entry) {
                var data = new FormData();
                if (entry.value instanceof HTMLInputElement) {
                    entry.value = entry.value.files[0];
                }
                data.append("userfile", entry.value);

                if (entry.attrs) {
                    _.each(entry.attrs, function (value, key) {
                        data.append(key, value);
                    });
                }
                _.each(this._fields, function (field) {
                    data.append(field.name, field.value);
                });

                return data;
            }, this);

            var uploadUrl = af.getUrl(this.url);
            function sendForm() {
                if (forms.length > 0) {
                    var data = forms.pop(),
                        req = $.ajax({
                            url: uploadUrl,
                            type: "POST",
                            contentType: false,
                            processData: false,
                            data: data
                        });
                    req.then(sendForm);
                }
                else {
                    deferred.resolve(true);
                }
            }
            sendForm();
        },
        _ajaxSendSingleUpload: function (deferred) {
            var data = new FormData();
            $.each(this._files, function (index, file) {
                if (file.value instanceof HTMLInputElement) {
                    file.value = file.value.files[0];
                }
                data.append(file.name, file.value);
            });
            $.each(this._fields, function (index, field) {
                data.append(field.name, field.value);
            });
            if (!this.url) {
                throw "no url set";
            }

            var req = $.ajax({
                xhr: getXhrGenerator(updateProgressBar),
                url: af.getUrl(this.url),
                type: "POST",
                contentType: false,
                processData: false,
                data: data
            })
                .done(deferred.resolve);
        },
        _fallbackSend: function () {
            alert("Not Implemented");
        }
    });

    function getXhrGenerator(progressCallback) {
        return function () {
            var xhr = $.ajaxSettings.xhr();
            if ("upload" in xhr) {
                xhr.upload.addEventListener('progress', progressCallback);
            }
            return xhr;
        }
    }
    function updateProgressBar(ev) {
        var done = ev.loaded / ev.total,
            donePercent = done * 100;
        $(".progress .bar").css("width", donePercent + "%");
        console.log("updateProgressBar(): ", donePercent, ev);
    }
    function doUpload() {
        var form = $("form"),
            data = new FormData(form.get(0));
        var promise = $.ajax({
            xhr: getXhrGenerator(updateProgressBar),
            url: af.getUrl("/apps/opportunities/files/upload"),
            type: "POST",
            contentType: false,
            processData: false,
            data: data
        });
        promise.done(function () { console.log("Upload complete"); });
    }
    function init() {
        $("#btnUpload").click(doUpload);
    }
    //$(init);

    $.extend(true, af, {
        util: {
            AfUploader: AfUploader
        }
    });
})();

if ("define" in window) {
    // We're being loaded under require.js
    define([], function () {
        return af.util.AfUploader;
    });
}
