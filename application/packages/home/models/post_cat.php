<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

Class Post_cat extends MY_Model {

  protected $table_name = 'post_categories';

  public function getPostCat($array = FALSE) {

    $row = $this->db
            ->get($this->table_name);

    if ($array)
      return $row->result_array();
    else
      return $row->result();
  }

  public function update($id, $data) {
    $this->db->where('id', $id)
            ->update($this->table_name, $data);
  }

  public function insert($data) {
    $this->db->insert($this->table_name, $data);
    return $this->db->insert_id();
  }

  public function delete($id){
    return $this->db->where('id',$id)
                ->delete($this->table_name);
  }

}
