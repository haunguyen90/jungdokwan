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
    $this->load->model('post_type_model','post_type');
    $list = $this->post_type->getArray();
    return $this->return_json($list);
  }
}