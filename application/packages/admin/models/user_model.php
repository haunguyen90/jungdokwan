<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
class User_model extends MY_Model{
  
  public function check_login($username, $password){
    return $this->db->from('user')
             ->where('username', $username)
            ->where('password', $password)
            ->get()->result();
  }
}
