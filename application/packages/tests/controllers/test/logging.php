<?php
class Logging extends CI_Controller {
    public function test_mc_logging()
    {
        $this->load->model("message_center_message_model", "messages");
        $this->messages->log(33, "test_mc_logging() This is just a test");
    }

    public function basic_test()
    {
        log_message("INFO", "basic_test()");
    }
}
