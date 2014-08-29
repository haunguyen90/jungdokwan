<?php

require 'AWSSDKforPHP/aws.phar';
use Aws\S3\S3Client;

class Aws {
    private $auth_key;
    private $auth_secret;

    public function __construct($config = array())
    {
        foreach ($config AS $key => $value)
        {
            $this->{$key} = $value;            
        }
    }

    public function get_s3_client()
    {
        return S3Client::factory(array(
            "key"       => $this->auth_key,
            "secret"    => $this->auth_secret,
        ));
    }
}
