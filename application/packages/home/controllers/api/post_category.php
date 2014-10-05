<?php

class Post_category extends MY_Controller {
  
    public function __construct() {
        parent::__construct();
        $this->load->model('post_cat');
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
  public function savePostCat(){
      $data = $_POST;
//      var_dump($data);die;
      $data['url'] = 'post-detail/'.$data['url'];
      $this->post_cat->update($data['id'],$data);
      echo json_encode($data);
  }
  public function createPostCat(){
      $data = $_POST;
      $data['url'] = "post-detail/".$data['url'];
      $id = $this->post_cat->insert($data);
      echo json_encode($id);
  }
}