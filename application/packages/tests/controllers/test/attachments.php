<?php
class Attachments extends CI_Controller {
    public function __construct()
    {
        parent::__construct();
        $this->load->library("unit_test");
    }

    public function upload_from_template()
    {
        $this->load->model("message_center_message_model", "messages");
        $this->messages->get_by_id(396, TRUE);
        dump($this->messages->add_attachment_from_template(14));
    }

    public function s3_model($id)
    {
        $this->load->model("uploaded_file_model", "files");
        //dump($this->files->upload_to_s3($id));
        $url = $this->files->get_s3_url($id);
        dump($url);
    }

    public function get_file_url($filename, $mongo_id)
    {
        $this->load->model("message_center_message_model", "messages");
        $message = $this->messages->get_by_id("191", TRUE);

        $url = $this->messages->get_attachment_url("IMG_22082013_11415810.png");
        $this->unit->run(substr($url, 0, 4), "http", "Should be a URL");

        echo $this->unit->report();
    }

    public function list_attachments_on_s3($mongo_id = "")
    {
        $this->load->library("aws");
        $s3 = $this->aws->get_s3_client();

        $at_bucket_name = "123companies_com_attachments";
        $r = $s3->listObjects(array(
            "Bucket"        => $at_bucket_name,
            "Prefix"        => $mongo_id,
        ));
        dump($r);
    }

    public function transfer_vm()
    {
        $doc_id = "52b33822ad0f3f7e68da374e";
        $url = "http://65.60.43.99/asterisk/_voicemail.wav";
        $filename = "voicemail.wav";

        $this->load->library("procalltrack_api");
        $fd = $this->procalltrack_api->download_voicemail($url);

        $this->load->library("aws");
        $s3 = $this->aws->get_s3_client();
        $at_bucket_name = "123companies_com_attachments";
        $r = $s3->putObject(array(
            "Bucket"    => $at_bucket_name,
            "Key"       => $doc_id . "/" . $filename,
            "Body"      => $fd,
        ));
        fclose($fd);
        dump($r);
    }
}
