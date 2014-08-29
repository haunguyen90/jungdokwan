<?php

require "PHPMailer/class.phpmailer.php";

class MY_Phpmailer {
    private $config = array();

    public function __construct($config = array())
    {
        $this->config = $config;
    }

    public function get_php_mailer()
    {
        $mail = new PhpMailer();
        $this->configure_mail($mail);
        return $mail;
    }

    private function configure_mail($mail, $config = NULL)
    {
        $config = $config ?: $this->config;

        // HTML by default
        $mail->isHTML(true);

        if (isset($config["mode"]))
        {
            if ($config["mode"] == "smtp")
            {
                $mail->IsSMTP();
                foreach ($config["smtp"] AS $k => $v)
                {
                    $mail->{$k} = $v;
                }
            }
            else
            {
                throw new Exception("Not Implemented");
            }
        }
    }
}
