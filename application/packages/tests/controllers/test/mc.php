<?php
class Mc extends CI_Controller {
    public function test_get_scheduled()
    {
        $this->load->model("message_center_message_model", "messages");
        var_dump($this->messages->get_scheduled());
    }

    public function test_contacts()
    {
        $this->load->model("message_center_message_model", "messages");
        $messages = $this->db->get("messagecenter_message")->result();
        foreach ($messages AS $row)
        {
            $message = $this->messages->get_by_id($row->id);
            $contacts = $this->messages->find_related_contacts($message);
            foreach ($contacts AS $c) {
                $this->messages->add_contact_relation($message->id, $c->id);
            }
        }
        return;
        /*
        $this->load->model("contact_model");
        $this->contact_model->id = 17;
        $c = $this->contact_model->get_by_id();
        dump($c);
        //$this->messages->get_by_id(456, TRUE);
        //$this->messages->get_by_id(430, TRUE);
        //$this->messages->get_by_id(428, TRUE);
        $this->messages->get_by_id(2137);
        dump($this->messages->find_related_contacts());
        */
    }
}
