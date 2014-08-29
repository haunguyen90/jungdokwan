<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
Class Post_cat extends MY_Model {
  protected $table_name = 'post_categories';
  
  public function getPostCat($array = FALSE){
    
    $row = $this->db
            ->get($this->table_name);
    
    if($array)
      return $row->result_array();
    else
      return $row->result();
  }
  
}
