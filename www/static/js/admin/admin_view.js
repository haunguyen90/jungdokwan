(function() {
  _.each(jung, function(collection) {
    if (collection.fetch)
      collection.fetch();
  })
  

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
  
  var blockWigetView = Backbone.View.extend({
    templateString: "",
    initialize: function() {
      this.data = {};
      this._views = {};
      this.getTemplate();
      this.listenTo(this.collection, "change sync", this.render);
    },
    template: "template-blockWiget-admin",
    getTemplate: function() {
      this.templateString = $("#" + this.template).text().trim();
    },
    events: {
      'click .edit-block-wiget': "onEditBlock",
      'click .cancel-block': "onCancelBlock"
    },
    onEditBlock: function(ev){
      var $el = $(ev.currentTarget),
              id = $el.data('id');
      this.changeBlockView(id,'edit');
    },
    onCancelBlock: function(ev){
      var $el = $(ev.currentTarget),
              id = $el.parent().data('id');
      this.changeBlockView(id,'cancel');
    },
    changeBlockView: function(id,type){
      if(type == 'edit'){
        $('.block_name_' + id).hide();
        $('#input_name_' + id).show();
        $('.block_description_' + id).hide();
        $('#input_description_' + id).show();
        $('.edit-block-wiget[data-id="' + id + '"]').hide();
        $('.edit_button_' + id).show();
        $('#url_block_' + id).hide();
        $('#select_url_block_' + id).show();
      }else{
        $('.block_name_' + id).show();
        $('#input_name_' + id).hide();
        $('.block_description_' + id).show();
        $('#input_description_' + id).hide();
        $('.edit-block-wiget[data-id="' + id + '"]').show();
        $('.edit_button_' + id).hide();
        $('#url_block_' + id).show();
        $('#select_url_block_' + id).hide();
      }
    },
    renderListPost: function(){
      var list = {};
      if(jung.posts.length > 0){
        for(var x in jung.posts.models){
          if(list[jung.posts.models[x].attributes.post_type_id])
            list[jung.posts.models[x].attributes.post_type_id].push(jung.posts.models[x].attributes)
          else
            list[jung.posts.models[x].attributes.post_type_id] = new Array(jung.posts.models[x].attributes)
        }
      }
      return list;
    },
    render: function() {
//==============================================================================
      this.data.Blocks = this.collection.models;
      
      this.$el.html(Mustache.render(this.templateString, this.data));
      var list = this.renderListPost();
      var html = '';
      for(var x in list){
        html += '<optgroup label="' + jung.post_type.get(x).get('name_vi') + '">';
        for(var y in list[x]){
          html += '<option style="width: 50px" value="' + list[x][y].id + '">' + list[x][y].post_title_vi + '</option>';
        }
        html += '</optgroup>';
      }
      $('.selectUrlBlock').html(html)
       var $selectBlock = $('.selectUrlBlock').selectpicker({
        liveSearch: true,
        maxOptions: 1
      });

      //========================================================================

    }
  });

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
    events: {
      'click [data-action="delete"]': "onDeletePost"
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
    },
    onDeletePost: function(ev){
      var $el = $(ev.currentTarget),
              id = $el.data('id');
      var r = confirm ("Are you sure?");
      if(r)
        jung.posts.get(id).destroy();
      else 
        return false;
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
    events: {
      'click [data-action="delete"]': "onDeletePost"
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
    },
    onDeletePost: function(ev){
      var $el = $(ev.currentTarget),
              id = $el.data('id');
      var r = confirm ("Are you sure?");
      if(r)
        jung.posts.get(id).destroy();
      else 
        return false;
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
      "click [name=save_post]": "onSavePost",
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
  });
  
  var galleryDetail = Backbone.View.extend({
    templateString: "",
    initialize: function() {
      this.views = {};
      this.data = {};
      this.uploader = new jung.util.AfUploader();
//      this.listenTo(this.model, "change add remove sync", this.render);
      this.listenToOnce(this.model, "change", this.render);
//      this.listenTo(this.collection, 'add remove', this.render)
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
//      this.data.postDetail = this.collection.models;
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
    },
    onSavePost: function(ev) {
      var onSaveSuccess = function() {
        jung.nav.router.navigate("gallery", {trigger: true});
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
              cidDetail = $el.data('iddetail');
      if(cidDetail){
        var image = this.collection.get(cidDetail);
        image.set(name, value);
      }
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
      var detailEL = $("#gallery_image", this.$el),
              detailView = new imageDetailView({
                el: detailEL,
                collection: this.model.get("postDetails")
              });
              detailView.render();
      this.views['detailView'] = detailView;      
    }
  });
  
  var imageDetailView = Backbone.View.extend({
    templateString: "",
    initialize: function() {
      this.data = {};
      this.listenTo(this.collection, "sync sort add remove", this.render);
      this.getTemplate();
    },
    template: "template-galleryImageDetail-admin",
    getTemplate: function() {
      this.templateString = $("#" + this.template).text().trim();
    },
    render: function(){
      this.data.images = this.collection.models
      this.$el.html(Mustache.render(this.templateString, this.data));
    },
    events: {
      "click .add-image": "addImage"
    },
    addImage: function(ev){
      var gallery_details = new (this.collection.model)({
        url: 'http://',
        file_name: null,
        description_vi: 'Enter Description',
        description_en: 'Enter Description'
      }),
        cid = gallery_details.cid;
//      var html = '<div class="image-detail">' +
//                    '<label>Url </label>' +
//                    '<input class="form-control" vaue="" name="" placeholder="http://">' +
//                    '<label>Mô Tả</label>' + 
//                    '<textarea name="" class="form-control" rows="3"></textarea>' + 
//                    '<hr>' +
//                    '</div>';
//       $('.image-sections', this.$el).append(html);
      this.collection.add(gallery_details);
    },
  })


  var JungRouter = Backbone.Router.extend({
    routes: {
      "": "dashboard",
      "posts": "posts",
      "posts/:value": "postDetail",
      "posts-create": "createPost",
      "gallery": "gallery",
      "gallery-create": "createGallery",
      "gallery/:value": "showGalleryDetail",
      "block-wiget": "blockWiget"
    },
    blockWiget: function(){
      var root = $("#admin-content").html(''),
              el = $("<div />").appendTo(root).get(0),
              view = new blockWigetView({
                el: el,
                collection: jung.block_wiget
              });
      jung.posts.fetch().done(function(){
        jung.block_wiget.fetch();
      });      
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
          model.fetch().done(function(){
            view.render();
          });
        });

      });
    },
    showGalleryDetail: function(id){
      var root = $("#admin-content").html(''),
              el = $("<div />").appendTo(root).get(0),
              model, view, collection;
      jung.posts.fetch().done(function() {
        model = jung.posts.get(id),
        collection = model.get('postDetails');
        var view = new galleryDetail({
                  el: el,
                  model: model,
                  collection: collection
                });
        jung.postCat.fetch().done(function() {
          model.fetch().done(function(){
            view.render();
          });
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
              model, view, collection;
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

