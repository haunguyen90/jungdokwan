<?php
class List_model extends CI_Model
{
    function __construct() {
        parent::__construct();
        $this->load->database();
    }
    public function getdata()
    {
        $query =$this->db->get('contacts');
        $result = $query->result_array();
        return $result;
                
    }
        
    
    
}
?>
