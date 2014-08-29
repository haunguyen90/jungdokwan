<?php
class Test_Controller extends CI_Controller {
    private $rc;

    public function index()
    {
        $this->run_tests();
    }

    public function run_tests($tests = NULL)
    {
        $this->rc = new ReflectionClass($this);
        $this->load->library('unit_test');

        $this->run_setup();

        foreach ($this->get_test_methods($tests) AS $method)
        {
            $this->{$method->name}();
        }

        $this->run_teardown();

        $this->output_report();
    }

    private function get_test_methods($tests_filter)
    {
        if ($tests_filter !== NULL)
        {
            $tests_filter = explode(',', $tests_filter);
        }
        
        $r = new ReflectionClass($this);
        return array_filter($r->getMethods(), function ($method) use ($tests_filter)
        {
            if (
                $tests_filter !== NULL
                AND 
                ! in_array($method->name, $tests_filter)
            )
            {
                return FALSE;
            }
            return substr($method->name, 0, 5) === 'test_';
        });
    }

    private function run_setup()
    {
        if ($this->rc->hasMethod('setup'))
        {
            $this->setup();
        }
    }

    private function run_teardown()
    {
        if ($this->rc->hasMethod('teardown'))
        {
            $this->teardown();
        }
    }

    private function output_report()
    {
        echo $this->unit->report();
    }
}
