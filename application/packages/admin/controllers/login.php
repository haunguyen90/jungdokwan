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
      if (count($user_data) == 0) {
        return $this->error_bad_login();
      }
      
      $this->session->set_userdata(array(
          'user_id' => $user_data->id,
          'username' => $user_data->username,
          'type' => $user_data->type
      ));
      redirect(site_url('admin'));
    } else {
      $this->render('admin/login/login.html');
    }
  }

  private function error_bad_login($username = '') {
    return $this->render('admin/login/login.html', array(
                'username' => $username,
                'error' => "Username, Password or Access Code didn't match our records."
    ));
  }

}
