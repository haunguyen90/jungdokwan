<?php
class MY_Exceptions extends CI_Exceptions {
	function show_error($heading, $message, $template = 'error_general', $status_code = 500)
    {
        if (get_instance()->input->is_ajax_request())
        {
            set_status_header($status_code);
            header('Contact-Type: application/json');

            return json_encode(array(
                'status'    => 'error',
                'message'   => $message,
            ));
        }
        return parent::show_error($heading, $message, $template, $status_code);
    }
}
