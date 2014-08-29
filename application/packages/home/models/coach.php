<?php
  Class Coach extends MY_Model {
    protected $table_name = 'coach';
    
    public function __construct() {
      parent::__construct();
    }
    
    public function getAllCoach($array = FALSE){
      $result =  $this->db
              ->from($this->table_name)
              ->get();
      if($array)
        return $result->result_array();
      else
        return $result->result();
    }
  }
?>