<?php
switch (ENV_CONF)
{
    case "local":
        $config['mongo_host'] = '127.0.0.1';
        $config['mongo_port'] = 27017;
        $config['mongo_db'] = '';
        $config['mongo_user'] = '';
        $config['mongo_pass'] = '';
        $config['mongo_persist'] = TRUE;
        $config['mongo_persist_key'] = 'ci_mongo_persist';
        break;
                
    default:
        $config['mongo_host'] = '';
        $config['mongo_port'] = 27017;
        $config['mongo_db'] = '';
        $config['mongo_user'] = '';
        $config['mongo_pass'] = '';
        $config['mongo_persist'] = TRUE;
        $config['mongo_persist_key'] = 'ci_mongo_persist';
        break;
}




?>
