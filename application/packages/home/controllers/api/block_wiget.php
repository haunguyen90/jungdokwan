<?php

class Block_wiget extends MY_Controller {
  
    public function __construct() {
        parent::__construct();
        $this->load->model('block_wiget_model','block');
    }
    public function index() {
    if ($this->input->is_post()) {
      $this->index_post();
    } else {
      $this->index_get();
    }
  }
  public function index_get(){
    $list = $this->block->getArray();
    return $this->return_json($list);
  }
  public function saveBlock(){
      $data = $_POST;
      $data['url'] = 'post-detail/'.$data['url'];
      $this->block->update($data['id'],$data);
      echo json_encode($data);
  }
}