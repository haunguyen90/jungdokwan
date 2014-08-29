(function() {
  function FilterAndSortManager() {
  }
  _.extend(FilterAndSortManager.prototype, {
    defaultSortField: "id",
    defaultSortOrder: "d",
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
    getComparator: function() {
      var key = this.getSortField(),
              o = this.getSortOrder() == "d" ? -1 : 1;
      if(key == 'owned_by')
        return this.sortOwned(key, o);
      else if(key == 'est_close_value')
        return this.sortNumeric(key, o);
      else 
        return this.sortAlpha(key, o);
    },
    sortNumeric: function(key, o) {
      return function(a,b){
        var valueA = a.get(key),
          valueB = b.get(key),
          aa,bb;
      
      if(valueA)
        aa = parseFloat(a.get(key).replace(/[^0-9.-]/g, ''));
      else
        aa = parseFloat('');
      if (isNaN(aa))
        aa = 0;
      if(valueB)
        bb = parseFloat(b.get(key).replace(/[^0-9.-]/g, ''));
      else
        bb = parseFloat('');
      if (isNaN(bb))
        bb = 0;
      if(aa == bb)
        return 0;
      else
        return (aa > bb) ? o : 0-o;
      }
          
    },
    sortAlpha: function(key, o){
      return function(a,b){
        if (a.get(key).toLowerCase().trim() > b.get(key).toLowerCase().trim()) {
          return o;
        }
        else if (a.get(key).toLowerCase().trim() < b.get(key).toLowerCase().trim()) {
          return 0 - o;
        }
        else {
          return 0;
        }
        return 0 - a.get("id");
      }
    },
    sortOwned: function(key, o) {
      return function(a, b){
        var valueA = '',
                valueB = '';
        var userA = af.accountUsers.get(a.get(key));
        if (userA) {
          var contactA = af.contacts.get(userA.get('contact_id'));
          valueA = contactA.get('first_name') + ' ' + contactA.get('last_name');
        }
        var userB = af.accountUsers.get(b.get(key));
        if (userB) {
          var contactB = af.contacts.get(userB.get('contact_id'));
          valueB = contactB.get('first_name') + ' ' + contactB.get('last_name');
        }
        if (valueA.toLowerCase().trim() > valueB.toLowerCase().trim()) {
          return o;
        }
        else if (valueA.toLowerCase().trim() < valueB.toLowerCase().trim()) {
          return 0 - o;
        }
        else {
          return 0;
        }
      }
    },
    flipOrder: function() {
      this.sortOrder = this.getSortOrder() == "a" ? "d" : "a";
    }
  });

  $.extend(true, window.af, {
    resolvePath: function(path) {
      return path.split('.').reduce(function(o, i) {
        return o[i];
      }, window);
    },
    util: {
      FilterAndSortManager: FilterAndSortManager
    }
  });
})();
