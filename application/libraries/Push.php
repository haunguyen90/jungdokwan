<?php
class Push {
    private $shared_secret;
    private $node_proto = 'http';
    private $node_addr;
    private $node_port;

    public function __construct ($params = array())
    {
        foreach ($params AS $n => $v)
        {
            $this->{$n} = $v;
        }
    }

    public function send ($type, $to, $message)
    {
        $json = json_encode($message);
        $base = implode(',', array($to, $type, $json));
        $sig = hash_hmac('sha1', $base, $this->shared_secret);

        $post_data = http_build_query(array(
            'to'        => $to,
            'type'      => $type,
            'message'   => $json,
            'sig'       => $sig,
        ));
        return $this->post($post_data);
    }

    private function post ($post_data)
    {
        $url = $this->node_proto . '://' . $this->node_addr . ':' . $this->node_port . '/push';
        $c = curl_init();
        curl_setopt($c, CURLOPT_URL, $url);
        curl_setopt($c, CURLOPT_RETURNTRANSFER, TRUE);
        curl_setopt($c, CURLOPT_POSTFIELDS, $post_data);

        $res = curl_exec($c);
        return $res == "ok";
    }

    public function get_root_url ()
    {
        return sprintf("%s://%s:%s/",
                $this->node_proto, $this->node_addr, $this->node_port);
    }

    private function sign ($str)
    {
        return hash_hmac('sha1', $str, $this->shared_secret);
    }

    public function client_config ($user_id, $announce, $channels = array())
    {
        $config = json_encode(array(
            'rooms'     => $channels,
            'announce'  => $announce,
            'user_id'   => $user_id,
        ));
        $sig = $this->sign($config);
        $auth = sprintf("config=%s&sig=%s", $config, $sig);

        return array(
            'auth_str'  => $auth,
            'node_url'  => $this->get_root_url(),
        );
    }

    public function get_join_auth ($user_id, $channels = array(), $extra = NULL)
    {
        $config = array(
            'rooms'     => $channels,
            'user_id'   => $user_id,
        );

        if ($extra)
        {
            $config['extra'] = $extra;
        }

        $config = json_encode($config);
        return array(
            'config'    => $config,
            'sig'       => $this->sign($config),
        );
    }
}
