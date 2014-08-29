<?php
$config["mode"] = "smtp";
$use = "jasons";
switch(ENV_CONF)
{
    default:
        $config["smtp"] = array(
            "Host"      => "mail.safedatatech.com",
            "Port"      => "25",
            "SMTPAuth"  => TRUE,
            "Username"  => "jkorkin-jkorkin",
            "Password"  => "mypass",
        );
}

