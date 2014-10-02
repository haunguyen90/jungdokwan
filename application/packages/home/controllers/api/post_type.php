<?php

class Post_type extends MY_Controller {
  
  public function index() {
    if ($this->input->is_post()) {
      $this->index_post();
    } else {
      $this->index_get();
    }
  }
  public function index_get(){
    $this->load->model('post_type_model','block');
    $list = $this->block->getArray();
    return $this->return_json($list);
  }
}