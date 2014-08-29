<?php
include_once dirname(__FILE__) . '/../src/libs/Smarty.class.php';

class CI_Smarty extends Smarty {
    protected $default_extension = 'html';

    public function __construct($params = array())
    {
        parent::__construct();

        foreach ($params AS $name => $value)
        {
            if ($name == 'template_dir' AND isset($params['use_package_dirs']) AND $params['use_package_dirs'])
            {
                $this->find_template_dirs($value);
            }
            else if ($name == 'use_package_dirs')
            {
                continue;
            }
            else
            {
                $this->{$name} = $value;
            }
        }

        log_message('debug', "Smarty Class Initialized");

        $this->registerPlugin('modifier', 're_date', array($this, 'reformat_date'));
    }

    private function find_template_dirs($path_suffix)
    {
        $template_dir_map = function ($package_path) use ($path_suffix)
        {
            return $package_path . $path_suffix;
        };

        $package_paths = get_instance()->load->get_package_paths();
        $template_dirs = array_filter(array_map($template_dir_map, $package_paths), 'is_dir');
        $this->setTemplateDir($template_dirs);
    }

    /**
     * Takes a date/time string parses and then reformats with the given format
     * @param $in_str String - For example: '2012-07-27 16:45:23' - Anything strtotime can parse
     * @param $format String - The format to return the date in. 'user' 'iso' or a value to be passed directly to PHP's date()
     * @return String Formatted date/time string
     */
    public function reformat_date ($in_str, $format)
    {
        $unix = strtotime($in_str);
        switch ($format)
        {
            case 'user':
                // We'll lookup the user's prefered date format here
                $out_str = date('Y-m-d', $unix);
                break;
            case 'iso':
                $out_str = date('c', $unix);
                break;
            default:
                $out_str = date($format, $unix);
                break;
        }

        return $out_str;
    }

    /**
     * @param   string  $tempalte   Tempalte path to use, with or without extention
     * @param   array   $view_data  Assoc PHP array of data to pass to the template
     * @param   bool    $return     TRUE to return the rendered tempalte, FALSE will output to the http request.
     * @return  string  The rendered tempalte, or NULL.
     */
    public function view($template, $view_data = array(), $return = FALSE)
    {
        $CI =& get_instance();
        if (strpos($template, '.') === FALSE)
        {
            $template .= '.' . $this->default_extension;
        }

        foreach ($view_data as $key => $val)
        {
            $this->assign($key, $val);
        }

        $userdata = $CI->session->all_userdata();
        $this->assign('session', $userdata);
        $this->assign('flash_extra', $CI->session->flashdata('extra'));
        $this->assign('flash_confirm', $CI->session->flashdata('confirm_msg'));
        $this->assign('flash_error', $CI->session->flashdata('flash_error'));
        $this->assign('input', $CI->input);

        if ($return == FALSE)
        {
            $CI->output->set_output( $this->fetch($template) );
            return NULL;
        }
        else
        {
            return $this->fetch($template);
        }
    }
}
