<?php
include_once dirname(__FILE__) . DS . '../../libs/Test_controller.php';
class User extends Test_Controller {
    protected function setup()
    {
        $this->load->model('user_model');
    }

    protected function test_create_user_no_args()
    {
        try
        {
            $this->user_model->create();
            $this->unit->run(FALSE, TRUE, "Should have failed");
        }
        catch (Exception $e)
        {
            $this->unit->run($e instanceof Exception, TRUE, 'Exception type thrown');
            $this->unit->run($e->getMessage(), 'create(): account_id is required', 'Exception message');
        }
    }

    protected function test_create_user()
    {
    }
}
