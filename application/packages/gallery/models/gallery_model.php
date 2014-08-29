<?php

Class Gallery_model extends MY_Model {
  protected $table_name = 'gallery';
  
  public function __construct() {
    parent::__construct();
  }
  
  public function getAlbum(){
    return $this->db->from('album_gallery')
            ->get()->result();
  }
  
  public function getGalleryById($id){
    return $this->db->from($this->table_name)
            ->where('id_album', $id)
            ->get()->result();
  }
  
}