<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
class Admin extends MY_Controller{
  protected $requires_login = TRUE;
  public function __construct() {
    parent::__construct();
  }
  
  public function index(){
    $this->render('admin/index.html');
  }
  
}
