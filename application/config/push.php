<?php

switch (ENV_CONF) {
    case 'local':
        $config['shared_secret'] = "somekey";
        $config['socket_url'] = "http://localhost:8080/";
        $config['enabled'] = TRUE;
        $config['node_addr'] = "localhost";
        $config['node_port'] = "8080";
        $config['node_proto'] = "http";
        break;

    default:
        $config['shared_secret'] = "somekey";
        $config['socket_url'] = "http://65.60.43.102:8080/";
        $config['enabled'] = TRUE;
        $config['node_addr'] = "65.60.43.102";
        $config['node_port'] = "8080";
        $config['node_proto'] = "http";
        break;
}

