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
    $this->post->post_author = $this->session->userdata('user_id');

    if (!($id = $this->post->create())) {
      show_error("unable to create post");
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
      $post = $this->post->get_by_id($post->id, TRUE);
    } else if ($this->input->is_delete()) {
      if (!($this->post->destroy($post->id))) {
        show_error("unable to destroy model");
      }

      return $this->return_json("ok");
    }

    return $this->return_json($post);
  }

  private function populate_model($object, $old_object = NULL) {
    $this->load->model('post');

    foreach ($object AS $key => $value) {
      switch ($key) {
        case "post_content_en":
        case "post_content_vi":
        case "post_title_en":
        case "post_title_vi":
        case "description_en":
        case "description_vi":
        case "highlight":
        case "image":
        case "post_categories":
        case "post_type_id":
        case "tag":
          $this->post->set_field($key, $value);
          break;


        case "postDetails":
          if ($old_object) {
            list($new, $destroyed, $changed) = self::find_new_and_destroyed(
                            $value, $old_object->postDetails, TRUE);

            foreach ($new AS $detail) {
              $this->post->add_details($old_object->id, $detail);
            }

            foreach ($changed as $update) {
              $this->post->update_details($update);
            }

            foreach ($destroyed AS $detail_id) {
              $this->post->destroy_details($old_object->id, $detail_id);
            }
          }else{
            $this->post->set_field('details', $value);
          }
          break;

      }
    }
  }

  private static function find_new_and_destroyed($in, $current, $check_for_changes = FALSE) {
    $get_id = function ($item) {
              return $item->id;
            };
    $has_id = function ($item) {
              return isset($item->id);
            };
    $has_no_id = function ($item) {
              return !isset($item->id);
            };

    $current_ids = array_map($get_id, $current);
    $keep_ids = array_map($get_id, array_filter($in, $has_id));
    $destroy_ids = array_diff($current_ids, $keep_ids);

    $new = array_filter($in, $has_no_id);

    if ($check_for_changes) {
      $index = function ($result, $item) {
                if (isset($item->id)) {
                  $result[$item->id] = $item;
                }
                return $result;
              };
      $in_index = array_reduce($in, $index, array());
      $current_index = array_reduce($current, $index, array());

      $changed_test = function ($item) use ($current_index) {
                if (empty($item->id)) {
                  return FALSE;
                }

                foreach ($item AS $k => $v) {
                  if ($v != $current_index[$item->id]->{$k}) {
                    return TRUE;
                  }
                }
                return FALSE;
              };
      $changed = array_filter($in, $changed_test);
      return array($new, $destroy_ids, $changed);
    }

    return array($new, $destroy_ids);
  }

}
