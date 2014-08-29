<?php
  Class Page_setting extends MY_Model {
    protected $table_name = 'page_setting';
    public $settingData = NULL;
    public function __construct() {
      parent::__construct();
    }
    
    public function getSetting(){
      $this->settingData = array();
      $this->settingData['mainMenu'] = $this->getMainMenu();
      $this->settingData['header'] = $this->getHeaderSetting();
      return $this->settingData;
    }
    
    public function getMainMenu(){
      $menu = $this->db
          ->from('main_menu')
          ->get()->result();
      $i = 0;
      foreach($menu as $row){
        $menu[$i]->subMenu = $this->db
                                ->from('sub_main_menu')
                                ->where('main_menu_id', $row->id)
                                ->get()->result();
        $i++;
      }
      return $menu;
    }
    
    public function getHeaderSetting(){
      $header = $this->db
                  ->from('page_setting')
                  ->get()->row();
  
      return $header;
    }
  }
?>