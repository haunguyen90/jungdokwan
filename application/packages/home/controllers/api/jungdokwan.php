<?php

class Jungdokwan extends MY_Controller {

//    protected $requires_login = TRUE;

  public function __construct() {
    parent::__construct();

    $this->load->model('coach');
    $this->load->model('gallery_model', 'gallery');
  }

  public function pageSetting() {
    $this->load->model('post');
    $data['pageSetting'] = $this->pageSetting;
//    $data['newsEventCategories'] = $this->post->getCategories();
//    $data['highlightNews'] = $this->post->getHighlightNews();
    $data['coachs'] = $this->coach->getAllCoach();
    $data['lang'] = $this->getLang();
    return $this->return_json($data);
  }

  public function postCat() {
    if ($this->input->is_post())
      $this->postCat();
    else
      $this->getPostCat();
  }

  private function getPostCat() {
    $this->load->model('post_cat');
    $postCat = $this->post_cat->getPostCat();
    return $this->return_json($postCat);
  }

  public function index() {
    if ($this->input->is_post()) {
      $this->index_post();
    } else {
      $this->index_get();
    }
  }

  public function coach() {
    if ($this->input->is_post()) {
      $this->postCoach();
    } else {
      $this->getCoach();
    }
  }

  private function getCoach() {
    $this->load->model('coach');
    $coach = $this->coach->getAllCoach();
    return $this->return_json($coach);
  }

  private function index_get() {
    $this->load->model('post');
    $this->post->reset_fields();
    $list = $this->post->getArray();
    return $this->return_json($list);
  }

  private function index_post() {
    $object = $this->input->json();
    $this->populate_model($object);
    $this->report->user_id = $this->user->id;
    $this->report->account_id = $this->user->account_id;

    if (!($id = $this->report->create())) {
      show_error("unable to create report");
    }

    return $this->get($id);
  }
  
  public function get($id) {
        $this->load->model('post');
        if (!($post = $this->post->get_by_id($id, TRUE))) {
            show_error("not found", 404);
        }


        if ($this->input->is_put()) {
            // Populate the model with the current data first
            $this->populate_model($post);

            // ID won't be populated automatically
            $this->post->id = $post->id;

            // Then overlay the new data
            $this->populate_model($this->input->json(), $post);

            // And save
            if (!($this->post->save())) {
                show_error("unable to save model changes");
            }
            
            // Get a fresh copy
            $post = $this->post->get_by_id($report->id, TRUE);
        } else if ($this->input->is_delete()) {
            if (!($this->post->destroy($post->id))) {
                show_error("unable to destroy model");
            }

            return $this->return_json("ok");
        }

        return $this->return_json($post);
    }

}
