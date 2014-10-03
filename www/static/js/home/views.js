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
  var homeView = Backbone.View.extend({
    templateString: "",
    initialize: function() {
      this._views = {};
      this.data = {};
      this.listenTo(this.collection, "change sync add destroy", this.render);
      this.setLang();
      this.getTemplate();
    },
    template: "template-home-mainview",
    getTemplate: function() {
      this.templateString = $("#" + this.template).text().trim();
    },
    setLang: function() {

    },
    render: function() {
//==============================================================================

      this.data.highlightNews = this.collection.filter(this.getFilter(this.getHighlightNews));
      this.data.newestNews = this.collection.filter(this.getFilter(this.getHighlightNews))[0].attributes;
      this.data.newsCat = jung.postCat.models;
      this.data.block_wiget = jung.block_wiget.models;
      this.data.coachs = [];
      for (var x = 0; x <= jung.coachs.length; x += 2) {
        if (!(x >= jung.coachs.length)) {
          this.data.coachs.push({
            active: x == 0 ? 'active' : null,
            coach_1: jung.coachs.models[x],
            coach_2: (x + 1) >= jung.coachs.length ? null : jung.coachs.models[x + 1],
          })
        }
      }
      this.$el.html(Mustache.render(this.templateString, this.data));


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
        this.page = opts.page;
      else
        this.page = 0;
      
      if('type' in opts)
        this.type = opts.type;
      else
        this.type = 2;
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
      var type = this.type;
      var totalPost = this.collection.filter(function(m){
        return m.get('post_type_id') == type;
      })
      this.paging.total = totalPost.length;
      this.paging.numberPage = Math.ceil(this.paging.total / this.paging.perPage);

      this.paging.page = new Array();
      if (this.paging.numberPage > 1) {
        for (var i = 1; i <= this.paging.numberPage; i++) {
          this.paging.page.push({
            page: i,
            active: (i == this.page) ? 'active' : null,
            href: (i == this.page) ? null : 'href=#posts/type/'+this.type+'/page/' + i
          });
        }
        if (this.paging.currentPage == this.paging.numberPage) {
          this.paging.page.push({
            prev: {
              page: this.paging.currentPage - 1,
              href: 'href=#posts/type/'+this.type+'/page/' + (this.paging.currentPage - 1)
            }
          });
        } else if (this.paging.currentPage == 1 || this.paging.numberPage == 0) {
          this.paging.page.push({
            next: {
              page: this.paging.currentPage + 1,
              href: 'href=#posts/type/'+this.type+'/page/' + (this.paging.currentPage + 1)
            }
          });
        } else {
          this.paging.page.push({
            prev: {
              page: this.paging.currentPage - 1,
              href: 'href=#posts/type/'+this.type+'/page/' + (this.paging.currentPage - 1)
            },
            next: {
              page: this.paging.currentPage + 1,
              href: 'href=#posts/type/'+this.type+'/page/' + (this.paging.currentPage + 1)
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
      this.data={};
      this.getTemplate();
    },
    template: "template-contact-mainview",
    getTemplate: function() {
      this.templateString = $("#" + this.template).text().trim();
    },
    render: function() {

      this.$el.html(Mustache.render(this.templateString, this.data));

    }
  })

  var galleryView = Backbone.View.extend({
    templateString: "",
    initialize: function(opts) {
//      if ('page' in opts)
//        this.page = opts.page
//      else
//        this.page = 0;
//      this._views = {};
      this.data = {};
//      this.paging = {
//        perPage: 5,
//        total: 0,
//        numberPage: 0,
//        from: 0,
//        to: 0,
//        page: new Array()
//      };
      this.listenTo(this.collection, "change sync", this.render);

      this.getTemplate();
    },
    template: "template-galley-mainview",
    getTemplate: function() {
      this.templateString = $("#" + this.template).text().trim();
    },
    render: function() {
//      this.data.newsEvent = this.collection.getPage(this.paging.start, this.paging.perPage);
//      this.data.paging = this.paging.page;
      this.data.album = jung.posts.filter(function(m) {
        return m.get('post_type_id') == 3
      });
      this.data.video = jung.posts.filter(function(m) {
        return m.get('post_type_id') == 4
      });
//      this.data.recentPosts = this.collection.getRecentPosts();
//      this.data.tags = this.collection.getTag();
      this.$el.html(Mustache.render(this.templateString, this.data));
//      var el = $('#news-righ-aside', this.el).html('');
//      var RightView = new newsRightAside({
//        el: el,
//        parentView: this,
//        collection: jung.postCat
//      })
//      RightView.render();
    }
  })

  var galleryViewDetail = Backbone.View.extend({
    templateString: "",
    initialize: function() {

      this.data = {};

      this.listenToOnce(this.model, "change add remove sync", this.render);

      this.getTemplate();
    },
    template: "template-galleyDetail-mainview",
    getTemplate: function() {
      this.templateString = $("#" + this.template).text().trim();
    },
    render: function() {
      this.data.details = this.model.get('postDetails').models
      this.$el.html(Mustache.render(this.templateString, this.data));
      this.initPage();
    },
    initPage: function(){
      $(document).ready(function() {
          $(".fancybox").fancybox({
            openEffect	: 'elastic',
            closeEffect	: 'elastic',
            nextEffect 	: 'fade',
            prevEffect	: 'fade'
          });
      });
    }
  })
  
  var videoViewDetail = Backbone.View.extend({
    templateString: "",
    initialize: function() {

      this.data = {};

      this.listenToOnce(this.model, "change add remove sync", this.render);

      this.getTemplate();
    },
    template: "template-videoDetail-mainview",
    getTemplate: function() {
      this.templateString = $("#" + this.template).text().trim();
    },
    
    render: function() {
      this.data.details = this.model.get('postDetails').models;
      this.$el.html(Mustache.render(this.templateString, this.data));
    
    },
    
  })


  var JungRouter = Backbone.Router.extend({
    routes: {
      "": "home",
      "home": "home",
      "about": "about",
      "posts/type/:value/page/:page": "news_event",
//      "news_event/page/:value": "news_event",
//      "course": "news_event",
//      "news_event/page/:value": "news_event",
      "post-detail/:value": "news_event_detail",
      "gallery": "gallery",
      "gallery/:value": "gallery_detail",
      "video/:value": "video_detail",
      "contact": "contact"
    },
    home: function() {
      var root = $("body #body_content").html(''),
              el = $("<div />").appendTo(root).get(0),
              model = jung.models.pageSetting,
              view = new homeView({
                el: el,
                model: model,
                collection: jung.posts
              });

      jung.postCat.fetch().done(function() {
        jung.coachs.fetch().done(function() {
          jung.posts.fetch();
        })
      });
    },
    about: function() {
      var root = $("body #body_content").html(''),
              el = $("<div />").appendTo(root).get(0),
              view = new aboutView({
                el: el
              })
      view.render();
    },
    news_event: function(value, page) {
      if (isNaN(page))
        page = 1;
      var root = $("body #body_content").html(''),
              el = $("<div />").appendTo(root).get(0),
              view = new newsEventView({
                el: el,
                collection: jung.posts,
                page: page,
                type: value
              });
      jung.posts.fetch();
    },
    gallery: function() {
      var root = $("body #body_content").html(''),
              el = $("<div />").appendTo(root).get(0),
              view = new galleryView({
                el: el,
                collection: jung.posts,
              });
      jung.posts.fetch();
    },
    gallery_detail: function(id) {
      var root = $("body #body_content").html(''),
              el = $("<div />").appendTo(root).get(0),
              model, view;
      jung.posts.fetch().done(function() {
        model = jung.posts.get(id),
                view = new galleryViewDetail({
                  el: el,
                  model: model
                });
        model.fetch();
        view.render();
      })
    },
    video_detail: function(id) {
      var root = $("body #body_content").html(''),
              el = $("<div />").appendTo(root).get(0),
              model, view;
      jung.posts.fetch().done(function() {
        model = jung.posts.get(id),
                view = new videoViewDetail({
                  el: el,
                  model: model
                });
        model.fetch();
        view.render();
      })
    },
    contact: function(){
      var root = $("body #body_content").html(''),
              el = $("<div />").appendTo(root).get(0),
              view = new contactView({
                el: el
              });
              view.render();
    },
    news_event_detail: function(postId) {
      var root = $("body #body_content").html(''),
              el = $("<div />").appendTo(root).get(0),
              model,
              view;
      jung.posts.fetch().done(function() {
        model = jung.posts.get(postId),
                view = new newsEventDetailView({
                  el: el,
                  collection: jung.posts,
                  model: model
                });
        view.render();
      })


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
    }
  });

})();

