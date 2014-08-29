<?php

class Home extends MY_Controller {

//    protected $requires_login = TRUE;
  
  public function __construct() {
    parent::__construct();
    $this->load->model('post');
    $this->load->model('coach');
    $this->load->model('gallery_model', 'gallery');
  }
  
  public function index() {
    $data['pageSetting'] = $this->pageSetting;
    
    $data['coachs'] = $this->coach->getAllCoach();
    $data['slide_show'] = $this->fetch('home/slide_show.html');
    $data['lang'] = $this->session->userdata('lang');
    
    $this->render('index.html', $data);
  }
  
  public function changeLang($lang){
    if($lang == 'vi')
      $lang = 'en';
    else
      $lang = 'vi';
    $this->session->set_userdata(array(
                'lang'      => $lang
        ));
    echo $this->session->userdata('lang');
  }
  

    public function openPage(){
    $hashName = $this->input->post('hashName');
    $data['pageSetting'] = $this->setting->getSetting();
    $data['lang'] = $this->session->userdata('lang');
    $data['slide_show'] = '';
    switch ($hashName[0]) {
      case 'home':
      default:
        $data['newsEventCategories'] = $this->news_event->getCategories();
        $data['highlightNews'] = $this->news_event->getHighlightNews();
        $data['coachs'] = $this->coach->getAllCoach();
        $data['slide_show'] = $this->fetch('home/slide_show.html');
        break;
      case 'about':
        
        break;
      case 'gallery':
        $data['albums'] = $this->gallery->getAlbum();
        break;
      
    }
    $content = $this->fetch($hashName[0].'/'.$hashName[0].'.html', $data);
    echo json_encode(array('content' => $content, 'slide_show' => $data['slide_show']));
  }

  
}
