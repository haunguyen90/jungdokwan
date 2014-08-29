// List of all currently Modal_123 objects
if (typeof top.modalList === 'undefined')
    top.modalList = new Array();

function Modal_123(data, callback) {
    this.model = new ModalModel(data);
    this.view = new ModalView({model: this.model});
    _.extend(this, Backbone.Events);
    this.listenTo(this.view, 'rendered', callback);
    this.data;
    this.hide = hide;
    this.close = close;
    this.show = show;
    this.postMessage = postMessage;     // send a message or data to modal iframe
    this.setCallbackOnClose = setCallbackOnClose;

    // Add this modal to the modal list
    if (typeof top.modalList === 'undefined')
        top.modalList = new Array();
    top.modalList.push(this);

    function hide() {
        this.view.$el.hide();
    }

    function close(confirm) {
        // remove the view from DOM
        // and remove this from modalList
        this.view.remove();
        top.modalList.splice(modalList.indexOf(this), 1);
        console.log(confirm);
        if (confirm == true) {
            if (typeof this.callbackOnClose === 'function') {

                this.callbackOnClose(this.data);
            }
        }

    }

    function show() {
        this.view.$el.show();
        this.view.$('#' + this.model.get('wrapper_id')).show();

    }

    function postMessage(msg) {
        $.postMessage(msg,
                this.model.get('src'),
                this.view.$('iframe').get(0).contentWindow);
    }

    function setCallbackOnClose(fn) {
        if (typeof fn === 'function') {
            this.callbackOnClose = fn;
            return true;
        } else
            return false;
    }

}

// Sample usages

/* Create modal without popup frame. 
 * This is used in case the popup frame is already rendered in src url.
 *
 modal1 = new Modal_123({
 "frame": null,
 "src": "http://localhost:8081/index.php/apps/contacts/add_contact/single_form",
 "wrapper_id": "div_app_ifr_modal",
 "iframe_id": "ifr_app_modal"
 });
 */

/* Create modal with popup frame. 
 * This can be used in case you want to put an app inside a frame to fake a popup
 *
 modal2 = new Modal_123({
 "frame": [
 {
 "width": "1100",
 "height": "400",
 "title": "List opportunity",
 "title-style": "green-medium"
 }
 ],
 "src": "http://localhost:8081/index.php/apps/opportunities#vertOpportunity"
 });
 */

/* Notes: Modal_123 and modalList are in top window. Therefore, to create new modal from inside an app, we simply use:
 * modal = new top.Modal_123(data)
 */
