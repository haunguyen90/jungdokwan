<?php

Class Post_type_model extends MY_Model {
  protected $table_name = 'post_type';
  protected $id;
  protected $name;
  protected $description;
  protected $url;

  public function getArray($array = FALSE) {
    $row = $this->db
            ->get($this->table_name);
    
    if($array)
      return $row->result_array();
    else
      return $row->result();
  }
}