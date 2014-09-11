(function(jung) {
  function parseDates(data) {
    _(["created", "created_datetime"]).map(function(key) {
      if (data[key]) {
        data[key] = new Date(data[key]);
      }
    }, data);
  }
  var DatedAttrModel = Backbone.Model.extend({
    parse: function(data, req) {
      if (data.created) {
        data.created = new Date(data.created);
      }
      return data;
    }
  }),
          attrParseHelper = function(rows) {
            return _.map(rows || [], DatedAttrModel.prototype.parse);
          };

  var filesCollection = Backbone.Collection.extend({
  });

  var pageSettingModel = Backbone.Model.extend({
    initialize: function() {
      this.fetch();
    },
    urlRoot: jung.getUrl("/api/jungdokwan/pageSetting")
  });
  
  var postDetailsModel = Backbone.Model.extend({});
    var postDetailsCollection = Backbone.Collection.extend({
        model: postDetailsModel
    });

  var postModel = Backbone.Model.extend({
    initialize: function() {
      this.set("postDetails", new postDetailsCollection());
    },
    urlRoot: jung.getUrl("/api/jungdokwan"),
    set: function(key, val, opts) {
      if (typeof key == "object") {
        var attrs = key,
                _opts = val;
        var collectionNames = ["postDetails"];
        _.each(collectionNames, function(name) {
          if (name in attrs && this.has(name)) {
            var current = this.get(name);
            if (current instanceof Backbone.Collection) {
              current.reset();
              current.add(attrs[name], _opts);
              delete attrs[name];
            }
          }
        }, this);
      }
      return postModel.__super__.set.apply(this, arguments);
    }
  });

  var postCatModel = Backbone.Model.extend({
//    urlRoot: jung.getUrl("/api/jungdokwan/posts")
  });

  var postCollection = Backbone.Collection.extend({
    model: postModel,
    url: jung.getUrl("/api/jungdokwan"),
    perPage: 5,
    defaultSortField: "id",
    defaultSortOrder: "a",
    getSortField: function() {
      return this.sortField || this.defaultSortField;
    },
    setSortField: function(key) {
      this.sortField = key;
    },
    getSortOrder: function() {
      return this.sortOrder || this.defaultSortOrder;
    },
    setSortOrder: function(order) {
      this.sortOrder = order;
    },
    getPage: function(start, end, type) {
      if (start != 0)
        start = start - 1;
      if (typeof (start) == 'undefined')
        return this.models.slice(0, this.perPage);
      else if (typeof (end) == 'undefined')
        return this.models.slice(start, this.perPage);
      else
        return this.models.slice(start, end);
    },
    getRecentPosts: function(limit) {
      if (!limit)
        limit = 5;
      var recentPosts = this.sortBy(function(model) {
        return model.get('view_no');
      });
      recentPosts.reverse();
      return recentPosts.slice(0, limit);

    },
    getTag: function() {
      var tags = this.map(function(model) {
        return model.get('tag')
      })
      var _tag = new Array();
      _.each(tags, function(tag) {
        if (tag) {
          _tag.push(tag.split(','))
        }
      })
      return _tag;
    },
    getComparator: function() {
      var key = this.getSortField(),
              o = this.getSortOrder() == "d" ? -1 : 1;

      return this.sortNumeric(key, o);
    },
    sortNumeric: function(key, o) {
      return function(a, b) {
        var valueA = a.get(key),
                valueB = b.get(key),
                aa, bb;

        if (valueA)
          aa = parseFloat(a.get(key).replace(/[^0-9.-]/g, ''));
        else
          aa = parseFloat('');
        if (isNaN(aa))
          aa = 0;
        if (valueB)
          bb = parseFloat(b.get(key).replace(/[^0-9.-]/g, ''));
        else
          bb = parseFloat('');
        if (isNaN(bb))
          bb = 0;
        if (aa == bb)
          return 0;
        else
          return (aa > bb) ? o : 0 - o;
      }
    },
  });



  var postCatCollection = Backbone.Collection.extend({
    model: postCatModel,
    url: jung.getUrl("/api/jungdokwan/postCat"),
  });

  var coachModel = Backbone.Model.extend();

  var coachCollection = Backbone.Collection.extend({
    model: coachModel,
    url: jung.getUrl('/api/jungdokwan/coach')
  })

  $.extend(jung, {
    models: {
      pageSetting: new pageSettingModel(),
      post: postModel,
      postCat: postCatModel,
      coach: coachModel
    },
    filesCollection: filesCollection,
    posts: new postCollection(),
    postCat: new postCatCollection(),
    coachs: new coachCollection()
  });

})(window.jung);