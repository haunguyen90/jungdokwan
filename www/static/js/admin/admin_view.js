(function() {
  _.each(jung, function(collection) {
    if (collection.fetch)
      collection.fetch();
  })
  function fakeModal(el) {
    var overlay = $("<div />")
            .css({
            })

            .hide()
            .appendTo("body");
    var modal = $(el)
            .css({
            })
            .hide()
            .appendTo("body");
    var close = function() {
      overlay.remove();
      modal.remove();
      ClientApi.fakeModalCancel();
    },
            show = function() {
              overlay.show();
              modal.show();
//            ClientApi.fakeModal();
            };
    overlay.on("click", close);
    return {
      show: show,
      close: close
    };
  }

  function formatField(value, formatArgs) {
    var args = formatArgs.split(":"),
            type = args.shift();
    switch (type) {
      case "date":
        return moment(value).format(args[0]);
      case "number":
        return numeral(value).format('0,0');
      default:
        return "Unknown formatter";
    }
  }
  var dashboardView = Backbone.View.extend({
    templateString: "",
    initialize: function() {
      this._views = {};
      this.getTemplate();
    },
    template: "template-dashborad-admin",
    getTemplate: function() {
      this.templateString = $("#" + this.template).text().trim();
    },
    render: function() {
//==============================================================================

      this.$el.html(Mustache.render(this.templateString));


      //========================================================================

    },
    getFilter: function(fn) {
      return fn;
    },
    getHighlightNews: function(model) {
      return model.get('post_type_id') == 2 && model.get('highlight') == 1;
    }
  });

  var aboutView = Backbone.View.extend({
    templateString: "",
    initialize: function() {
      this._views = {};
      this.data = {};

      this.getTemplate();
    },
    template: "template-about-mainview",
    getTemplate: function() {
      this.templateString = $("#" + this.template).text().trim();
    },
    render: function() {
      this.$el.html(this.templateString);
    }
  })

  var newsRightAside = Backbone.View.extend({
    initialize: function(opts) {
      if (opts.parentView) {
        this.parentView = opts.parentView;
      }
      this.getTemplate();
      this.listenTo(this.collection, 'change sync', this.render);
      this.data = {};
    },
    render: function() {
      this.data.postCat = this.collection.models;
      this.data.recentPosts = this.parentView.collection.getRecentPosts();
      this.data.tags = this.parentView.collection.getTag();
      this.$el.html(Mustache.render(this.templateString, this.data));
    },
    template: 'template-newsRightAside',
    getTemplate: function() {
      this.templateString = $("#" + this.template).text().trim();
    },
  })

  var newsEventView = Backbone.View.extend({
    templateString: "",
    initialize: function(opts) {
      if ('page' in opts)
        this.page = opts.page
      else
        this.page = 0;

      if ('type' in opts)
        this.type = opts.page
      else
        this.page = 'news'
      this._views = {};
      this.data = {};
      this.paging = {
        perPage: 5,
        total: 0,
        numberPage: 0,
        from: 0,
        to: 0,
        page: new Array()
      };
      this.listenTo(this.collection, "change sync", this.render);

      this.getTemplate();
    },
    template: "template-newsEvent-mainview",
    getTemplate: function() {
      this.templateString = $("#" + this.template).text().trim();
    },
    render: function() {
      this.setPagination(this.page);
      this.data.newsEvent = this.collection.getPage(this.paging.start, this.paging.perPage, this.type);
      this.data.paging = this.paging.page;
      this.data.postCat = jung.postCat.models;
      this.data.recentPosts = this.collection.getRecentPosts();
      this.data.tags = this.collection.getTag();
      this.$el.html(Mustache.render(this.templateString, this.data));
      var el = $('#news-righ-aside', this.el).html('');
      var RightView = new newsRightAside({
        el: el,
        parentView: this,
        collection: jung.postCat
      })
      RightView.render();
    },
    events: {
      'click [data-action="detail"]': "showPostDetail"
    },
    showPostDetail: function(ev) {
      var current = $(ev.currentTarget),
              idPost = current.data('post');
      jung.nav.router.navigate("news_event/" + idPost, {trigger: true});
    },
    setPagination: function(page) {
      this.paging.currentPage = page;
      if (page != 0) {
        this.paging.start = this.paging.perPage * (page - 1);
      }
      if (page == 0) {
        this.paging.start = 0;
        this.paging.currentPage = page + 1;
      }
      this.paging.currentPage = parseInt(this.paging.currentPage);
      this.paging.total = this.collection.length;
      this.paging.numberPage = Math.ceil(this.paging.total / this.paging.perPage);

      this.paging.page = new Array();
      if (this.paging.numberPage > 1) {
        for (var i = 1; i <= this.paging.numberPage; i++) {
          this.paging.page.push({
            page: i,
            active: (i == this.page) ? 'active' : null,
            href: (i == this.page) ? null : 'href=#news_event/page/' + i
          });
        }
        if (this.paging.currentPage == this.paging.numberPage) {
          this.paging.page.push({
            prev: {
              page: this.paging.currentPage - 1,
              href: 'href=#news_event/page/' + (this.paging.currentPage - 1)
            }
          });
        } else if (this.paging.currentPage == 1 || this.paging.numberPage == 0) {
          this.paging.page.push({
            next: {
              page: this.paging.currentPage + 1,
              href: 'href=#news_event/page/' + (this.paging.currentPage + 1)
            }
          });
        } else {
          this.paging.page.push({
            prev: {
              page: this.paging.currentPage - 1,
              href: 'href=#news_event/page/' + (this.paging.currentPage - 1)
            },
            next: {
              page: this.paging.currentPage + 1,
              href: 'href=#news_event/page/' + (this.paging.currentPage + 1)
            }
          });
        }
      }

    }
  })

  var newsEventDetailView = Backbone.View.extend({
    templateString: "",
    initialize: function(opts) {
      this.listenTo(this.model, "change", this.render);
      this.getTemplate();
      this.data = {};
    },
    template: "template-newsEventDetail-mainview",
    getTemplate: function() {
      this.templateString = $("#" + this.template).text().trim();
    },
    render: function() {
      this.data.news = this.model.attributes;
      this.data.tags = jung.posts.getTag();
      this.$el.html(Mustache.render(this.templateString, this.data));
      var el = $('#news-righ-aside', this.el).html('');
      var RightView = new newsRightAside({
        el: el,
        parentView: this,
        collection: jung.postCat
      })
      RightView.render();
      this.initView();
    },
    initView: function() {
      $('.carousel').carousel({
        interval: 2000
      })
    }
  })

  var contactView = Backbone.View.extend({
    templateString: "",
    initialize: function(opts) {
      this.data = {};
      this.getTemplate();
    },
    template: "template-contact-mainview",
    getTemplate: function() {
      this.templateString = $("#" + this.template).text().trim();
    },
    render: function() {

      this.$el.html(Mustache.render(this.templateString, this.data));
      $('h1.page-header').html('Dashboard')
    }
  })

  var postsView = Backbone.View.extend({
    templateString: "",
    initialize: function(opts) {

      this.data = {};

      this.listenTo(this.collection, "change sync add destroy", this.render);

      this.getTemplate();
    },
    template: "template-posts-admin",
    getTemplate: function() {
      this.templateString = $("#" + this.template).text().trim();
    },
    render: function() {
      this.data.posts = this.collection.filter(function(m) {
        return m.get('post_type_id') == 1 || m.get('post_type_id') == 2;
      });
      this.data.postFunction = {
        renderType: function() {
          return function(text, render) {
            if (render(text).trim() == '1')
              return render('Course')
            else if (render(text).trim() == '2')
              return render('News & Event')
            else if (render(text).trim() == '3')
              return render('Images')
            else if (render(text).trim() == '4')
              return render('Video')
            else
              return render('undefined')
          }
        },
        renderContent: function() {
          return function(text, render) {
            var content = render(text).substring(0, 250);
            return content + '...'
          }
        }
      }

      this.$el.html(Mustache.render(this.templateString, this.data));
      $('#dataTables-example').dataTable();
      $('h1.page-header').html('Quản Lý Bài Viết');
    }
  })

  var galleryView = Backbone.View.extend({
    templateString: "",
    initialize: function(opts) {

      this.data = {};

      this.listenTo(this.collection, "change sync add destroy", this.render);

      this.getTemplate();
    },
    template: "template-gallery-admin",
    getTemplate: function() {
      this.templateString = $("#" + this.template).text().trim();
    },
    render: function() {
      this.data.posts = this.collection.filter(function(m) {
        return m.get('post_type_id') == 3
      });
      this.data.postFunction = {
        renderType: function() {
          return function(text, render) {
            if (render(text).trim() == '1')
              return render('Course')
            else if (render(text).trim() == '2')
              return render('News & Event')
            else if (render(text).trim() == '3')
              return render('Images')
            else if (render(text).trim() == '4')
              return render('Video')
            else
              return render('undefined')
          }
        },
        renderContent: function() {
          return function(text, render) {
            var content = render(text).substring(0, 250);
            return content + '...'
          }
        }
      }

      this.$el.html(Mustache.render(this.templateString, this.data));
      $('#dataTables-example').dataTable();
      $('h1.page-header').html('Quản Lý Gallery');
    }
  })

  var postViewDetail = Backbone.View.extend({
    templateString: "",
    initialize: function() {

      this.data = {};
      this.uploader = new jung.util.AfUploader();
//      this.listenTo(this.model, "change add remove sync", this.render);
      this.listenToOnce(this.model, "change", this.render);
      this.getTemplate();
    },
    template: "template-postsDetail-admin",
    getTemplate: function() {
      this.templateString = $("#" + this.template).text().trim();
    },
    render: function() {
      this.data.posts = this.model.attributes;
      var post_type = this.model.get('post_type_id');
      var post_cat = this.model.get('post_categories');
      this.data.postFunction = {
        "postType": [
          {value: 1, name: "Chương Trình"},
          {value: 2, name: "Tin Tức & Sự Kiện"},
          {value: 3, name: "Hình Ảnh"},
          {value: 4, name: "Video"}
        ],
        renderPostType: function() {
          return function(text, render) {
            if (render(text).trim() == post_type)
              return "selected='selected'"
            else
              return ''
          }
        },
        renderPostCat: function() {
          return function(text, render) {
            if (render(text).trim() == post_cat)
              return "selected='selected'"
            else
              return ''
          }
        }
      }

      this.data.postCats = jung.postCat.filter(function(m) {
        return m.get('post_type_id') == post_type;
      });
      this.$el.html(Mustache.render(this.templateString, this.data));
      this.initPage();
    },
    events: {
      "change [data-dom='input-text']": "inputChange",
      "blur textarea": "inputChange",
      "change [name='image']": "onUpload",
      "change [name='post_type_id']": "onPostTypeChange",
      "change [name='highlight']": "inputChange",
      "click [name=save_post]": "onSavePost"
    },
    onSavePost: function(ev) {
      var onSaveSuccess = function() {
        jung.nav.router.navigate("posts", {trigger: true});
      };
      this.model.save(null, {success: _.bind(onSaveSuccess, this)});
    },
    onUpload: function(ev) {
      var $file = $("[name='image']", this.el),
              file = $file.get(0),
              file_name = file.files[0].name;

      if (this.uploader && $file.val() != "") {
        this.uploader.addFile("image", file, {
          alt_file_name: file_name,
          description: 'upload image'
        });
        this.uploader.addField('file_name_input', file_name);
      }

      if (!this.uploader || this.uploader.getFileCount() == 0) {
// Nothing to Upload
        return;
      }

// 1 or more files selected, we need to upload.

      var uploader = this.uploader,
              thisView = this;
      uploader.setUrl("/api/files/upload");
      uploader.send()
              .done(function() {
// Refetch the model after the files are added
                uploader.reset();
                thisView.model.set('image', file_name);
                $('#image_upload').html('Upload Success');
              });
      return false;
    },
    inputChange: function(ev) {
      var $el = $(ev.currentTarget),
              name = $el.attr("name"),
              value = $el.val();
      this.model.set(name, value);


    },
    onPostTypeChange: function(ev) {
      var $el = $(ev.currentTarget),
              name = $el.attr("name"),
              value = $el.val();
      this.model.set(name, value);
      this.render();
    },
    ckeditorChange: function(ev) {
      var name = ev.editor.name,
              value = $('#' + name).val();
      this.model.set(name, value);
    },
    initPage: function() {
      $('h1.page-header').html('Thêm/Sửa Bài Viết');
      $('#post_content_en').ckeditor({
        toolbar: 'HumanagerTextStyle'
      });
      $('#post_content_vi').ckeditor({
        toolbar: 'HumanagerTextStyle'
      });
      CKEDITOR.instances.post_content_en.on('blur', this.ckeditorChange.bind(this));
      CKEDITOR.instances.post_content_vi.on('blur', this.ckeditorChange.bind(this));
    }
  })
  var galleryDetail = Backbone.View.extend({
    templateString: "",
    initialize: function() {

      this.data = {};
      this.uploader = new jung.util.AfUploader();
//      this.listenTo(this.model, "change add remove sync", this.render);
      this.listenToOnce(this.model, "change", this.render);
      this.listenTo(this.collection, 'add remove', this.render)
      this.getTemplate();
    },
    template: "template-galleryDetail-admin",
    getTemplate: function() {
      this.templateString = $("#" + this.template).text().trim();
    },
    render: function() {
      this.data.posts = this.model.attributes;
      var post_type = this.model.get('post_type_id');
      var post_cat = this.model.get('post_categories');
      this.data.postFunction = {
        "postType": [
          {value: 1, name: "Chương Trình"},
          {value: 2, name: "Tin Tức & Sự Kiện"},
          {value: 3, name: "Hình Ảnh"},
          {value: 4, name: "Video"}
        ],
        renderPostType: function() {
          return function(text, render) {
            if (render(text).trim() == post_type)
              return "selected='selected'"
            else
              return ''
          }
        },
        renderPostCat: function() {
          return function(text, render) {
            if (render(text).trim() == post_cat)
              return "selected='selected'"
            else
              return ''
          }
        }
      }

      this.data.postCats = jung.postCat.filter(function(m) {
        return m.get('post_type_id') == post_type;
      });
      this.data.postDetail = this.collection.models;
      this.$el.html(Mustache.render(this.templateString, this.data));
      this.initPage();
    },
    events: {
      "change [data-dom='input-text']": "inputChange",
      "blur textarea": "inputChange",
      "change [name='image']": "onUpload",
      "change [name='post_type_id']": "onPostTypeChange",
      "change [name='highlight']": "inputChange",
      "click [name=save_post]": "onSavePost",
      "click .add-image": "addImage"
    },
    addImage: function(ev){
      var gallery_details = new (this.collection.model),
        cid = gallery_details.cid;
      var html = '<div>' +
                    '<label>Url </label>' +
                    '<input class="form-control" data-idDetail="'+cid+'" vaue="" name="" placeholder="http://">' +
                    '<label>Mô Tả</label>' + 
                    '<textarea name="" data-idDetail="'+cid+'" class="form-control" rows="3"></textarea>' + 
                    '<hr>' +
                    '</div>';
      // $('.image-sections', this.$el).append(html);
      this.collection.add(gallery_details);

    },
    onSavePost: function(ev) {
      var onSaveSuccess = function() {
        jung.nav.router.navigate("posts", {trigger: true});
      };
      this.model.save(null, {success: _.bind(onSaveSuccess, this)});
    },
    onUpload: function(ev) {
      var $file = $("[name='image']", this.el),
              file = $file.get(0),
              file_name = file.files[0].name;

      if (this.uploader && $file.val() != "") {
        this.uploader.addFile("image", file, {
          alt_file_name: file_name,
          description: 'upload image'
        });
        this.uploader.addField('file_name_input', file_name);
      }

      if (!this.uploader || this.uploader.getFileCount() == 0) {
// Nothing to Upload
        return;
      }

// 1 or more files selected, we need to upload.

      var uploader = this.uploader,
              thisView = this;
      uploader.setUrl("/api/files/upload");
      uploader.send()
              .done(function() {
// Refetch the model after the files are added
                uploader.reset();
                thisView.model.set('image', file_name);
                $('#image_upload').html('Upload Success');
              });
      return false;
    },
    inputChange: function(ev) {
      var $el = $(ev.currentTarget),
              name = $el.attr("name"),
              value = $el.val(),
              cidDetail = $el.data('idDetail');
      if(cidDetail)
        this.collection.get(cidDetail);
      else
        this.model.set(name, value);


    },
    onPostTypeChange: function(ev) {
      var $el = $(ev.currentTarget),
              name = $el.attr("name"),
              value = $el.val();
      this.model.set(name, value);
      this.render();
    },
    ckeditorChange: function(ev) {
      var name = ev.editor.name,
              value = $('#' + name).val();
      this.model.set(name, value);
    },
    initPage: function() {
      $('h1.page-header').html('Thêm/Sửa Hình Ảnh');
    }
  })


  var JungRouter = Backbone.Router.extend({
    routes: {
      "": "dashboard",
      "posts": "posts",
      "posts/:value": "postDetail",
      "posts-create": "createPost",
      "gallery": "gallery",
      "gallery-create": "createGallery"
    },
    dashboard: function() {
      var root = $("#admin-content").html(''),
              el = $("<div />").appendTo(root).get(0),
              view = new dashboardView({
                el: el
              });

      view.render();
    },
    gallery: function() {
      var root = $("#admin-content").html(''),
              el = $("<div />").appendTo(root).get(0),
              view = new galleryView({
                el: el,
                collection: jung.posts
              })
      jung.posts.fetch();
    },
    posts: function() {
      var root = $("#admin-content").html(''),
              el = $("<div />").appendTo(root).get(0),
              view = new postsView({
                el: el,
                collection: jung.posts
              })
      jung.posts.fetch();
    },
    postDetail: function(id) {
      var root = $("#admin-content").html(''),
              el = $("<div />").appendTo(root).get(0),
              model, view;
      jung.posts.fetch().done(function() {
        model = jung.posts.get(id),
                view = new postViewDetail({
                  el: el,
                  model: model
                });
        jung.postCat.fetch().done(function() {
          model.fetch();
        });

      });
    },
    createPost: function() {
      var root = $("#admin-content").html(''),
              el = $("<div />").appendTo(root).get(0),
              model, view;
      jung.posts.fetch().done(function() {
        model = new jung.models.post(),
                view = new postViewDetail({
                  el: el,
                  model: model
                });
        jung.postCat.fetch().done(function() {
          view.render();
        });

      });
    },
    createGallery: function() {
      var root = $("#admin-content").html(''),
              el = $("<div />").appendTo(root).get(0),
              model, view;
      jung.posts.fetch().done(function() {
        model = new jung.models.post(),
        collection = model.get('postDetails');
        model.set('post_type_id', 3);
        var view = new galleryDetail({
                  el: el,
                  model: model,
                  collection: collection
                });
        jung.postCat.fetch().done(function() {
          view.render();
        });

      });
    }
  });


  function routerInit() {
    var router = new JungRouter();

    Backbone.history.start({
      pushState: false
    });
    return router;
  }


  $.extend(jung, {
    nav: {
      "router": routerInit(),
      "back": function() {
        jung.nav.router.navigate("", {trigger: true});
      },
      "views": {
        "viewList": "",
        "viewDetail": ""
      }
//            "openContactCard": openContactCard(),
//            "closeContactCard": closeContactCard()
    },
  });

})();

