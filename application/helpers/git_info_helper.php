<?php

function get_git_hash()
{
    $out = array();
    $ret = NULL;
    $cmd = "git rev-parse --short HEAD";
    exec($cmd, $out, $ret);
    if ($ret == 0 AND count($out) == 1)
    {
        return $out[0];
    }
    return "n/a";
}
