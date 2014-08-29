<?php

Class Post extends MY_Model {

  protected $table_name = 'posts';
  public $id;
  public $post_author;
  public $post_date;
  public $post_content_en;
  public $post_content_vi;
  public $post_title_en;
  public $post_title_vi;
  public $post_modified;
  public $description_en;
  public $description_vi;
  public $highlight;
  public $image;
  public $post_categories;
  public $post_type_id;
  public $tag;
  
  private $keys = array('id', 'post_author', 'post_date', 'post_content_en', 
                        'post_content_vi', 'post_title_en', 'post_title_vi',
                        'post_modified', 'description_en', 'description_vi',
                        'highlight', 'image', 'post_categories', 'post_type_id', 'tag');

  public function __construct() {
    parent::__construct();
  }

  public function getHighlightNews() {
    return $this->db
                    ->from($this->table_name)
                    ->where('highlight', 1)
                    ->order_by('updated_date')
                    ->limit(3)->get()->result();
  }

  public function getAllNews() {
    return $this->db
                    ->from('news_event')
                    ->get()->result();
  }

  public function getCategories() {
    return $this->db
                    ->from('news_event_categories')
                    ->get()->result();
  }

  public function reset_fields() {
    foreach ($this->keys AS $k) {
      unset($this->{$k});
    }
  }
  
  public function getArray($array = FALSE) {
    $row = $this->db
            ->get($this->table_name);
    
    if($array)
      return $row->result_array();
    else
      return $row->result();
  }
  
  public function get_by_id($id = NULL, $populate_related = FALSE) {
    $row = $this->db
            ->where("id", $id ? : $this->id)
            ->get("posts")
            ->row();

    if (empty($row)) {
      return FALSE;
    }

    if ($populate_related) {
      $row->postDetails = $this->get_details($row->id);
    }

    return $row;
  }
  
  public function get_details($id = NULL) {
    return $this->db
                    ->from("gallery")
                    ->where("id_post", $id ? : $this->id)
                    ->get()
                    ->result();
  }
  
  public function save() {
    $row = self::get_row($this, $this->keys);

    if ($this->id) {
      $this->db
              ->where("id", $this->id)
              ->set($row)
              ->update("posts");
      {
        //$this->push_opp_by_id($this->id);
        return TRUE;
      }
      return FALSE;
    } else {
      $this->db->set('user_id', $this->user_id);
      $this->db->set('account_id', $this->account_id);
      $save = $this->db->insert("posts", $row);
      if (!$save) {
        show_error("unable to create posts");
      }
      $this->id = $this->db->insert_id();
      return $this->id;
    }
  }
  
  public static function get_row($object, $keys) {
    $out = array();
    foreach ($keys AS $i => $k) {
      if (empty($object->{$k})) {
        continue;
      }
      $out[$k] = self::get_str($object->{$k});
    }
    return $out;
  }
  
  public static function get_str($object) {
    if ($object instanceof Datetime) {
      return $object->format(DateTime::ISO8601);
    } else {
      return (string) $object;
    }
  }

}

?>