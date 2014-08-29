var ModalView = Backbone.View.extend({
    templateFile: "/static/modal/html/template.html",
    templateString: "",
    
    initialize: function() {
        this.listenTo(this.model, "change", this.render);
        $.get(this.templateFile, this.setTemplateString.bind(this));
        window.$('body').append(this.el);
    },
    setTemplateString: function(data) {
        this.templateString = data;
        this.render();
    },
    render: function() {
        this.$el.html(Mustache.render(this.templateString, this.model.attributes));        
        var that = this;
        this.$('iframe').load(function(){
            that.$el.fadeIn();
            that.trigger('rendered');            
        });
    },
    events: {
        // click on close button only hide the modal, not actually remove it form DOM
        "click .close-modal": "hideModal"
    },
    hideModal: function() {
        this.$el.remove();
        top.modalList.splice(modalList.indexOf(this), 1);
    }
});

