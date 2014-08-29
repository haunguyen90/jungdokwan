<?php
class Pct_api extends CI_Controller {
    private $account_id = 4;
    public function query_numbers()
    {
        $this->load->library("procalltrack_api");
        $r = $this->procalltrack_api->query_numbers("us", "tx", "austin");
        var_dump($r);
    }

    public function assign_number()
    {
        $number = "5124288444";
        $rep_id = "33";

        $this->load->library("procalltrack_api");
        $this->procalltrack_api->set_account_id($this->account_id);

        $r = $this->procalltrack_api->assign_number($rep_id, $number);
        dump($r);
    }

    public function create_account()
    {
        $this->load->library("procalltrack_api");
        $this->procalltrack_api->set_account_id(4);

        $user_id = $this->procalltrack_api->create_account(
            "Alex",
            "Wright",
            "alex@xeentech.com");
        echo "PCT User: {$user_id}\n";
    }

    public function acquire_number()
    {
        $number = "5124288444";
        $this->load->library("procalltrack_api");
        $this->procalltrack_api->set_account_id($this->account_id);

        $r = $this->procalltrack_api->acquire_number($number);
        dump($r);
    }

    public function create_representative()
    {
        $number = "5124288444";
        $this->load->library("procalltrack_api");
        $this->procalltrack_api->set_account_id(4);

        $r = $this->procalltrack_api->create_representative(
            "Alex Wright",
            $number,
            "alex@xeentech.com",
            "272f1cbc");
        var_dump($r);
    }

    public function send_sms()
    {
        $to = "6034967969"; // Jason
        $from = "5124288444";
        $message = "This is a test";
        $rep_id = 33;
        
        $this->load->library("procalltrack_api");
        $this->procalltrack_api->set_account_id(4);

        $r = $this->procalltrack_api->send_sms($rep_id, $to, $from, $message);
        var_dump($r);
    }
}
