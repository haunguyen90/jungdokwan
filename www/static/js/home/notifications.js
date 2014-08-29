"use strict";
(function() {
    function getNotificationGroup(appId) {
        var group = $('.notification-group[data-notification-app-id="' + appId + '"]');
        if (group.length == 0) {
            group = $('<div />')
              .addClass('accordion-group')
              .addClass('notification-group')
              .attr('data-notification-app-id', appId);
            $('<h6></h6>')
              .addClass('accordion-heading')
              .attr({'data-toggle': 'collapse', 'data-target': '#statusApp' + appId})
              .append('<span class="badge">0</span>')
              .append(' <span class="notification-group-title">..</span>')
              .appendTo(group);
            $('<div><ul></ul></div>')
              .addClass('accordion-body')
              .addClass('collapse')
              .attr({'id': 'statusApp' + appId})
              .appendTo(group);
            group.prependTo('#appNotifications');

            $.get('/home/app_info/' + appId)
              .success(function(appInfo) {
                $('.notification-group-title', group)
                  .text(appInfo.name);
            });
        }
        return group;
    }

    var purgeOldItems = true;
    function addNotification(notification) {
        var group = getNotificationGroup(notification.app_id),
          list = $('ul', group);
        if (purgeOldItems) {
            list.empty();
        }

        $.each(notification.items, function(index, item) {
            console.log('Item: ', this, arguments);
            var link = $('<a />')
              .addClass('app-notification')
              .attr({"data-notification-id": notification.id,
                "data-app-id": notification.app_id,
                "data-item-id": item.id,
                "data-extra": item.extra, })
              .text(item.link_text);
            $('<li />')
              .append(link)
              .appendTo(list);
        });

        var numLabel = $('span.badge', group);
        if ('num' in notification) {
            numLabel.text(notification.num);
        }
        else {
            numLabel.text(notification.items.length);
        }
    }

    if (!('af' in window)) {
        window.af = {};
    }
    af.notification = {
        add: addNotification
    };
})();
