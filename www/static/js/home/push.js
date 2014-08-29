"use strict";
(function () {
    if (!('io' in window) || !('pushConfig' in af)) {
        return;
    }

    var sio = io.connect(af.pushConfig.socket_url, { query: af.pushConfig.config });

    function appMessage (appId, message) {
        var widgetDom = $('.widget.app-' + appId);
        if (widgetDom.length == 0) {
            // no one to deliver the message to
            return;
        }

        var iframe = $('iframe', widgetDom)[0]
        ,   json = JSON.stringify({
            'type':     'app_push',
            'message':  message
        });
        $.postMessage(json, "*", iframe.contentWindow);
    }
    sio.on('appPush', function (message) {
        appMessage(message.appId, message.message);
    });

    sio.on('chat', function (message) {
        if ('chat' in af) {
            af.chat.receive(message);
        }
    });
    sio.on('presence', function (presence) {
        if ('chat' in af) {
            af.chat.presence(presence);
        }
    });
    sio.on('notification', function (notification_update) {
        $(window).trigger($.Event("notification", notification_update));
    });

    window.sio = sio;
    window.appMessage = appMessage;
    
})();

