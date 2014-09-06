<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Login extends MY_Controller {

  public function __construct() {
    parent::__construct();
    $this->load->model('user_model');
  }

  public function index() {
    if ($this->input->is_post()) {
      $username = $this->input->post('username');
      $password = $this->input->post('password');
      $user_data = $this->user_model->check_login($username, $password);
      if(count($user_data)>0)
        redirect(site_url('admin'));
      else
        redirect(site_url('login'));
    }else{
      $this->render('admin/login/login.html');
    }
  }
}
