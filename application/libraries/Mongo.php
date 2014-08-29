<?php

class CI_Mongo extends MongoClient {
    function __construct($config = array())
    {
        if (isset($config["server"]))
        {
            parent::__construct($config["server"]);
        }
        else
        {
            parent::__construct();
        }
    }
}
