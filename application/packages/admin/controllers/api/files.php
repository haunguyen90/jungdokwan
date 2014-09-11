<?php

class Files extends MY_Controller {

//     protected $requires_login = TRUE;
  protected $_gallery_path = "";
  protected $_gallery_url = "";

  public function __construct() {
    parent::__construct();

    $this->_gallery_url = base_url() . "www/static/media/images";

    $this->_gallery_path = realpath(APPPATH . '../www/static/media/images');
  }

  public function index() {
    redirect(site_url("home"));
  }

  protected function get_media_path() {
    $this->load->config("paths", TRUE);
    return $this->config->item("media_dir", "paths");
  }

  public function test() {
    echo $this->_gallery_url;
    var_dump(is_writable($this->_gallery_path));
    echo $this->_gallery_path;
  }

  public function upload() {
    $alt_name = $this->input->post("file_name_input");
    $description = $this->input->post("description");
    
    $config['upload_path'] = $this->_gallery_path;
    $config['allowed_types'] = "*";
    $config['max_size'] = 1024 * 8000000;
    $config['file_name'] = $alt_name;

    $this->load->library('upload', $config);
    
    if (!$this->upload->do_upload('userfile')) {
      dump($this->upload->display_errors());
      show_error("upload failed");
    } else {
      
      $data = $this->upload->data();
      var_dump($data);
      
      echo "ok";
    }
  }

}
