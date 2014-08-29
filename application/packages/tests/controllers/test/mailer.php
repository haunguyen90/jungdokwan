<?php
class Mailer extends CI_Controller {
    public function index()
    {
        $this->test_send_mail();
    }

    private function test_send_mail()
    {
        $this->load->library("Phpmailer");
        $mail = $this->phpmailer->get_php_mailer();

        $mail->From = "alex@xeentech.com";
        $mail->FromName = "Alex Wright";
        $mail->addAddress("alexkwright@gmail.com", "Alex Wright");
        $mail->Subject = "This is a test! - 2";
        $mail->Body = "<strong>HTML Body.</strong>";
        $mail->AltBody = "Non-HTML body.";

        var_dump($mail->send());
    }
}
