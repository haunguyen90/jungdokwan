<?php
class MY_Controller extends CI_Controller {
    protected $admins = array(
        1, // alexw
        4, // jason
    );
    protected $user;
    protected $account;
    protected $plan;
    protected $iframe_title = '';
    protected $pageSetting;
    public $lang;

    private $auth_debug = TRUE;

    public function __construct ()
    {
        parent::__construct();
        $session = $this->session->all_userdata();
        if (isset($session['user_id']))
        {
            $this->load->model('user_model');
            $this->user = $this->user_model->get_by_id($session['user_id']);
        }
        $this->load->model('page_setting', 'setting');
        
        $this->pageSetting = $this->setting->getSetting();

        $this->load->library('smarty');
        $this->setLang($session);
    }
    
    public function setLang($session){
      if(!isset($session['lang'])){
        $this->session->set_userdata(array(
                'lang'      => 'vi'
        ));
      }
      $this->getLang();
    }
    
    public function getLang(){
      return $this->lang = $this->session->userdata('lang');
    }

    protected function mock_login()
    {
        $this->session->set_userdata(array(
            'user_id'       => 1,
            'account_id'    => 4,
        ));
    }

    protected function meta ()
    {
        if (empty($this->user))
        {
            return FALSE;
        }
        
        $this->load->model('meta_data_model');
        $this->meta_data_model->user_id = $this->user->id;

        if (func_num_args() == 2)
        {
            list($name, $value) = func_get_args();
            return $this->meta_data_model->set($name, $value);
        }
        else if (func_num_args() == 1)
        {
            list($name) = func_get_args();
            return $this->meta_data_model->get($name);
        }

        throw new Exception('Unknown call signature');
    }

    protected function account_settings ($settings = NULL)
    {
        if ( ! isset($this->app_id) )
        {
            // Can't be called outside of app context
            return FALSE;
        }

        $this->load->model('app_settings_model');
        if ($settings === NULL)
        {
            // Read
            return $this->app_settings_model->get($this->account['id'], $this->app_id);
        }
        else
        {
            return $this->app_settings_model->set($this->account['id'], $this->app_id, $settings);
        }
    }

    private function setup_timezone ()
    {
     
        $default = "Etc/UTC";
        if (isset($this->user))
        {
            $zone_str = $this->meta('timezone');
            if (empty($zone_str))
            {
                $zone_str = $default;
            }
        }
        else
        {
            $zone_str = $default;
        }

        $this->timezone = new DateTimeZone($zone_str);
    }

    protected function render ($template_name, $view_data = array(),$fetch = false)
    {
        $view_data = array_merge($view_data, array(
            'user'      => $this->user,
//            'user_quota'=> $this->get_user_quota_info(),
            'account'   => $this->account,
            'action_prompts'    => $this->get_action_prompts(5),
            'updated_opportunities'    => $this->get_updated_opportunities(5),
//            'grouped_notifications' => $this->get_notifications(),
            'push_config'           => $this->get_push_config(),
            'STATIC_URI'            => '/static',
            'iframe_title'          => $this->iframe_title,
            'git_info'              => $this->get_git_info(),
            'production'            => ENVIRONMENT == "production",
        ));

        
        if ($fetch) return $this->smarty->view($template_name, $view_data,true);
        $this->smarty->view($template_name, $view_data);
        
    }
    
    protected function fetch ($template_name, $view_data = array())
    {
        $view_data = array_merge($view_data, array(
            'user'      => $this->user,
//            'user_quota'=> $this->get_user_quota_info(),
            'account'   => $this->account,
            'action_prompts'    => $this->get_action_prompts(5),
            'updated_opportunities'    => $this->get_updated_opportunities(5),
//            'grouped_notifications' => $this->get_notifications(),
            'push_config'           => $this->get_push_config(),
            'STATIC_URI'            => '/static',
        ));

       
        return $this->smarty->fetch($template_name, $view_data);
    }

    protected function get_notifications ()
    {
        if (empty($this->user))
        {
            return array();
        }

    //    $this->load->model('notification_model');
        $notifications = $this->notification_model->get_notifications($this->user->id);
        $app_ids = array_unique(array_map(function ($n) { return $n->app_id; }, $notifications));
        $reduce = function (&$r, $n)
        {
            $r[$n->app_id]['notifications'][] = $n;
            return $r;
        };
        $grouped_notifications = array_reduce($notifications, $reduce); 

        if (count($grouped_notifications) == 0)
        {
            return array();
        }

        $this->load->model('marketplace_app_model', 'apps');
        foreach (array_keys($grouped_notifications) AS $app_id)
        {
            $grouped_notifications[$app_id]['app'] = $this->apps->get_by_id($app_id);
        }

        return $grouped_notifications;
    }

    protected function get_push_config ()
    {
        $this->load->config("push", TRUE);
        if ( ! $this->config->item("enabled", "push") )
        {
            return FALSE;
        }

        $shared_secret = $this->config->item("shared_secret", "push");
        $socket_url = $this->config->item("socket_url", "push");

        $config = array(
            "account_id"    => $this->account?$this->account['id']:'',
            "user_id"       => $this->user?$this->user->id:'',
            "signed"        => floor(time() / 30),
        );
        $config_str = json_encode($config);
        $sig = hash_hmac('sha1', $config_str, $shared_secret);

        $signed_config = http_build_query(array(
            "config"        => $config_str,
            "sig"           => $sig,
        ));

        return array(
            "socket_url"    => $socket_url,
            "config"        => $signed_config,
        );
    }

    protected function get_user_quota_info ()
    {
        if ( ! $this->user)
        {
            return FALSE;
        }

        $quota = unserialize($this->meta('quota_info'));
        if ( ! $quota)
        {
            return FALSE;
        }

        $quota['me_percent'] =
            sprintf('%0.2f', ($quota['me'] / $quota['quota']) * 100);
        $quota['champion_percent'] =
            sprintf('%0.2f', ($quota['champion'] / $quota['quota']) * 100);

        return $quota;
    }

    public function get_app_info ()
    {
        if (empty($this->app_id))
        {
            return FALSE;
        }

        return (object)array(
            'app_id'    => $this->app_id,
        );
    }

    protected function return_json ($object)
    {
        $this->output->set_content_type('application/json');
        if ($this->config->item("pretty_json") AND version_compare(phpversion(), '5.4', '>='))
        {
            $this->output->set_output(json_encode($object, JSON_PRETTY_PRINT));
        }
        else
        {
            $this->output->set_output(json_encode($object));
        }

        return TRUE;
    }

    protected function json_error ($message, $code = NULL)
    {
        $res = array(
            'status'        => 'error',
            'error'         => $message,
        );
        if ($code)
        {
            $res['errno'] = $code;
        }

        return $this->return_json($res);
    }

    public function _remap ($method, $params = array())
    {
      
        if (isset($this->requires_login) && !isset($this->user))
        {
            if (get_class($this)!='login') { 
                $url = $_SERVER['REQUEST_URI'];
                if (strpos($url, 'index.php/'))
                    $url = substr($url,10);                
                $this->session->set_userdata('returnUrl', $url);
            }
            redirect(site_url('login'));
            return FALSE;
        }

        if (isset($this->requires_admin))
        {
            if ( ! isset($this->user) )
            {
                redirect(site_url('login'));
                return FALSE;
            }

            if ( ! in_array($this->user->id, $this->admins) )
            {
                show_error('Not admin');
            }
        }

        if (is_numeric($method))
        {
            if (method_exists($this, 'get'))
            {
                array_unshift($params, $method);
                $method = 'get';
            }
        }

        $r = new ReflectionMethod($this, $method);
        if ($r->isPublic() && !$r->isStatic())
        {
            try
            {
                return call_user_func_array(array($this, $method), $params);
            }
            catch (Exception $e)
            {
                $code = $e->getCode();
                if ($code >= 400 && $code < 600)
                {
                    $this->output->set_status_header($code);
                }

                echo (string)$e;
                return;

                return $this->return_json(array(
                    'error'     => 'exception',
                    'exception' => $e->getMessage(),
                    'trace'     => $e->getTrace(),
                ));
            }
        }

        show_404();
        return FALSE;
    }

    protected function calling_app ()
    {
        $app_id = $this->input->server('HTTP_X_123API_APPID');
        $sig = $this->input->server('HTTP_X_123API_SIG');

        if ($sig === FALSE OR $app_id === FALSE)
        {
            // No headers at all. Not a valid API request
            return FALSE;
        }

        $this->load->model('marketplace_app_model');
        $app = $this->marketplace_app_model->get_by_id($app_id);
        if ($app == NULL OR $app->is_active != 'Y')
        {
            // Not a valid app
            return FALSE;
        }

        $base = $this->build_base_string();
        $our_sig = hash_hmac('sha256', $base, $app->secret, TRUE);
        $this->load->helper('base64_urlsafe');
        $our_sig = base64_url_encode($our_sig);
        if ($our_sig !== $sig && $this->auth_debug !== TRUE)
        {
            // bad sig
            return FALSE;
        }
        
        return $app;
    }

    protected function calling_user ()
    {
        if (isset($this->user))
        {
            return $this->user;
        }

        $user_id = $this->input->server('HTTP_X_123API_USERID');
        $sig = $this->input->server('HTTP_X_123API_SIG');

        if ($sig === FALSE OR $user_id === FALSE)
        {
            return FALSE;
        }

        $this->load->model('user_model');
        $user = $this->user_model->get_by_id($user_id);
        if ( ! $user )
        {
            return FALSE;
        }

        $base = $this->build_base_string();
        //$our_sig = hash_hmac('sha256', $base, $user->secret, TRUE);

        $secret = 'a-dummy-secret';
        $our_sig = hash_hmac('sha256', $base, $secret, TRUE);
        $this->load->helper('base64_urlsafe');
        $our_sig = base64_url_encode($our_sig);
        if ($our_sig !== $sig && $this->auth_debug !== TRUE)
        {
            return FALSE;
        }

        return $user;
    }

    private function build_base_string ()
    {
        $base_a = array(
            'uri'       => '/' . $this->uri->uri_string,
            'method'    => $this->input->server('REQUEST_METHOD'),
        );
        $get = $this->input->get();
        if ($get)
        {
            $base_a = array_merge($base_a, $get);
        }
        $post = $this->input->post();
        if ($post)
        {
            $base_a = array_merge($base_a, $post);
        }
        ksort($base_a);

        $base_s = http_build_query($base_a);
        return $base_s;
    }

    protected function form_rules_assoc ($rules)
    {
        $assoc = array();
        foreach ($rules AS $rule)
        {
            $assoc[$rule['field']] = $rule;
        }
        return $assoc;
    }

    protected function get_available_contacts ()
    {
        $this->load->model('contact_model');
        $contacts = $this->contact_model->get_by_user_id($this->user->id);
        $keys = array('email_business1', 'email_business2', 'email_home1', 'email_home2');
        foreach ($contacts AS &$contact)
        {
            foreach ($keys AS $k)
            {
                if ( ! empty($contact->{$k}) )
                {
                    $contact->email = $contact->{$k};
                    break;
                }
            }
        }

        return $contacts;

        return $this->contact_model->query_contacts(
            $populate = FALSE,
            $fields = array("*"),
            $where = array('account_id'=> $this->user->id)
        );
    }

    protected function get_action_prompts ($limit = 10, $offset = 0)
    {
        return array();
    }

    protected function get_updated_opportunities ($limit = 10, $offset = 0)
    {
        return array();
    }

    protected function get_user_profile()
    {
        $this->load->model("account_user_profile_model", "user_profile");
        return $this->user_profile->get_by_id($this->user->id)->array;
    }

    protected function get_account_profile()
    {
        $this->load->model("account_account_profile_model", "account_profile");
        return $this->account_profile->get_by_id($this->user->account_id)->array;
    }

    public function get_timezone()
    {
        $user_profile = $this->get_user_profile();
        if (isset($user_profile["locale_timezone"]))
        {
            return $user_profile["locale_timezone"];
        }
        $account_profile = $this->get_account_profile();
        if (isset($account_profile["locale_timezone"]))
        {
            return $account_profile["locale_timezone"];
        }
        if (isset($this->timezone))
        {
            return $this->timezone->getName();
        }
        return "Etc/UTC";
    }

    protected function get_git_info()
    {
        $this->load->helper("git_info_helper");
        return array(
            "hash"      => get_git_hash(),
        );
    }
}
