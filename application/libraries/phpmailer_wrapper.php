<?php

require "PHPMailer/class.phpmailer.php";

class Phpmailer_Wrapper {

  private $config = array();
  public $mail;

  public function __construct($config = array()) {
    $mail = new PHPMailer();

    $mail->SMTPDebug = 0;                     // enables SMTP debug information (for testing)
    // 1 = errors and messages
    // 2 = messages only
    if (ENV_CONF == 'dsv_local') {
      $mail->SMTPAuth = true;                  // enable SMTP authentication
      $mail->SMTPSecure = "tls";                 // sets the prefix to the servier
      $mail->Host = "smtp.gmail.com";      // sets GMAIL as the SMTP server
      $mail->Port = 587;                   // set the SMTP port for the GMAIL server
      $mail->Username = "thecompanies123@gmail.com";  // GMAIL username
      $mail->Password = "thangteo";            // GMAIL password
      $mail->IsSMTP();
    }
    $mail->isHTML(true);
    $mail->SetFrom('noreply@the123companies.com', 'The123companies Inc');
    $this->mail = $mail;
  }

  public function send($args) {
    extract($args);
    $this->mail->ClearAllRecipients();
    if (isset($to)) {
      if (is_array($to)) {
        foreach ($to as $recipient) {
          $this->mail->addAddress($recipient);
        }
      } else {
        $this->mail->addAddress($to);
      }
      }  
        if(isset($cc)){
            if(is_array($cc)){
                foreach ($cc as $recipient) {
                    $this->mail->addCC($recipient);
                }
            }else{
                $this->mail->addCC($cc);
            }
    }
    if (isset($cc)) {
      if (is_array($cc)) {
        foreach ($cc as $recipient) {
          $this->mail->addCC($recipient);
        }
      } else {
        $this->mail->addCC($cc);
      }
    }
    if (isset($body))
      $this->mail->MsgHTML($body);
    if (isset($subject))
      $this->mail->Subject = $subject;
    if ($this->mail->send())
      return true;
    else
      return FALSE;
  }

  public function setFrom($address, $name) {
    $this->mail->SetFrom($address, $name);
  }

}
