<?php
$config['host'] = '192.168.0.14';
$config['login'] = 'guest';
$config['password'] = 'afpass';
$config['targets'] = array(
    'imap_logout' => array(
        'type'          => AMQP_EX_TYPE_FANOUT,
        'exchange'      => 'imap-logout',
        'routing_key'   => 'imap.logout',
    ),
    'imap_login'  => array(
        'type'          => AMQP_EX_TYPE_TOPIC,
        'exchange'      => 'imap-topic',
        'routing_key'   => 'imap.login',
    ),
    'imap_newmail' => array(
        'type'          => AMQP_EX_TYPE_TOPIC,
        'exchange'      => 'imap-newmail',
        'routing_key'   => 'imap.newmail',
    ),
    'imap_ctrl' => array(
        'type'          => AMQP_EX_TYPE_TOPIC,
        'exchange'      => 'imap-newmail',
        'routing_key'   => array(
                'imap.newmail',
                'imap.error',
                'imap.checkin',
        ),
    ),
);

