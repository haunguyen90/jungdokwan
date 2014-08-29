/* 
 * This is backbone model for general modal
 * See ../demo_data/*.json for demo data
 */

var ModalModel = Backbone.Model.extend({
    demoDataFile: "/static/modal/demo-data/has-frame.json",
//    demoDataFile: "/static/modal/demo-data/no-frame.json",
    initialize: function(data) {
        if (!data)
            this.fetchDemoData();
    },
    fetchDemoData: function() {
        return this.fetch({ url: this.demoDataFile });
    }
});

