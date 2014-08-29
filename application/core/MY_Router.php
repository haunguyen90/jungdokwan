<?php
define('DS', DIRECTORY_SEPARATOR);

class MY_Router extends CI_Router {
    public function _validate_request($segments)
    {        
        $controller_base_paths = $this->get_controller_paths();        
        if (($match = $this->find_best_match($controller_base_paths, $segments)))
        {            
            $this->directory = $match['dir'] . DS;
            $this->set_class($match['class']);
            $this->set_method(count($match['args']) > 0 ? $match['args'][0] : 'index');

            $r = array_merge(
                array($match['class']),
                $match['args']);
            
            return $r;
            //dump($r);
        }        
        header("HTTP/1.1 404 Not Found");
        echo "No route for /" . implode("/", $segments);
        exit;
    }

    private function find_best_match($search_paths, $segments)
    {
        $arguments = array();                
        while (count($segments) > 0)
        {
            foreach ($search_paths AS $base)
            {
                $test_path = $base . DS . implode(DS, $segments);
                if (file_exists($test_path . EXT))
                {
                    return array(
                        'dir'   => $base . DS . implode(DS, array_splice($segments, 0, count($segments) - 1)),
                        'class' => implode(array_splice($segments, count($segments) - 1)),
                        'file'  => $test_path . EXT,
                        'args'  => $arguments,
                    );
                }
                else if (is_dir($test_path) AND file_exists($test_path . DS . $this->default_controller . EXT))
                {
                    return array(
                        'dir'   => $test_path,
                        'class' => $this->default_controller,
                        'file'  => $test_path . DS . $this->default_controller . EXT,
                        'args'  => $arguments,
                    );
                }
            }            
            array_unshift($arguments, array_pop($segments));
        }
        return FALSE;
    }

    private function get_autoload()
    {
		if (defined('ENVIRONMENT') AND file_exists(APPPATH.'config/'.ENVIRONMENT.'/autoload.php'))
		{
			include(APPPATH.'config/'.ENVIRONMENT.'/autoload.php');
		}
		else
		{
			include(APPPATH.'config/autoload.php');
		}

		if ( ! isset($autoload))
		{
			return FALSE;
		}                
        return $autoload;
    }

    private function get_packages()
    {
        if ( ! ($autoload = $this->get_autoload()) )
        {
            return array();
        }

        if (empty($autoload['packages']))
        {
            return array();
        }

        $packages = array_filter($autoload['packages'], function ($path)
        {
            return is_dir($path);
        });

        return $packages;
    }

    private function get_package_controller_paths()
    {
        return array_map(function ($pack_path)
        {
            return $pack_path . DS . 'controllers';
        }, $this->get_packages());
    }

    private function get_controller_paths($include_packages = TRUE)
    {
        $controller_base_paths = array(
            APPPATH . 'controllers',
        );
        
        if ($include_packages)
        {
            $controller_base_paths = array_merge(
                    $controller_base_paths,
                    $this->get_package_controller_paths());
        }

        return array_filter($controller_base_paths, function ($path)
        {
            return is_dir($path);
        });
    }
}
