<?php

Class Block_wiget_model extends MY_Model {
  protected $table_name = 'block_wiget';
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
  public function update($id, $data){
    $this->db->where('id', $id)
             ->update($this->table_name,$data);
  }
}