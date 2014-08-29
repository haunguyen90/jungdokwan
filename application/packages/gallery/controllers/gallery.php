<?php
class Gallery extends MY_Controller {



  public function __construct() {
    parent::__construct();
    $this->load->model('gallery_model', 'gallery');
  }
  
  public function index(){
    $data['pageSetting'] = $this->pageSetting;
    $data['albums'] = $this->gallery->getAlbum();
    $data['lang'] = $this->session->userdata('lang');
    $this->render('gallery/gallery', $data);
  }
  
  public function details($id = null){
    if(!$id || $id == '')
      show_404 ();
    else{
      $data['gallery'] = $this->gallery->getGalleryById($id);
      $data['lang'] = $this->session->userdata('lang');
      $this->render('gallery/details/item', $data);
    }
     
  }
  
}

?>