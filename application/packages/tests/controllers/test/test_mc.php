<?php
class Test_mc extends MY_Controller {
    public function test_html2text()
    {
        $html = file_get_contents("/home/alex/new/123followup-v2/www/3632.html");
        $this->load->library("Html2text");
        $this->html2text->set_html($html);
        dump(trim($this->html2text->get_text()));
    }

    private $from = array(
        "mailbox"   => "noreply",
        "host"      => "the123companies.com",
        "personal"  => "123 Report Mailer",
    );
    public function create_sent()
    {
        $this->load->model('account_user_model', 'aum');
        $user = $this->aum->get_by_id($this->user->id)->array;
        $to = $this->build_address($user["contact"]);

        $reportId_encode = "13";
        $url = base_url() . "index.php/api/v2/reports/generateReport/" . urlencode($reportId_encode);
        $message = "Here is a link to download your report";
        $subject = "Testing";
        $text_message = $message . $url;
        $html_message = "<p>{$message} <a href='{$url}'>{$url}</a></p>";
        
        $rowMC = array(
            "user_id"       => $this->user->id,
            "type"          => "sent_email",
            "direction"     => "sent",
            "folder_id"     => null,
            "mongo_id"      => null,
            "subject"       => $subject,
            "text_message"  => $text_message,
            "html_message"  => $html_message,
            "to"            => array(
                $to,
            ),
            "from"          => array(
                $this->from,
            ),
        );
        $this->load->model('message_center_message_model', 'mcmm');
        try
        {
            $r = $this->mcmm->save((object)$rowMC);
            dump($r);
        }
        catch (Exception $e)
        {
            dump($e);
        }
    }

    private function build_address($contact)
    {
        foreach ($contact["emails"] as $row)
        {
            if ($row["primary"] == "Y")
            {
                $primary_email = $row["value"];
            }
        }
        list($mailbox, $host) = explode("@", $primary_email);
        $address = array(
            "mailbox"   => $mailbox,
            "host"      => $host,
        );
        if (isset($contact["first_name"]) AND isset($contact["last_name"])) {
            $address["personal"] =
                $contact["first_name"] . " " . $contact["last_name"];
        }
        else if (isset($contact["first_name"]))
        {
            $address["personal"] = $contact["first_name"];
        }
        return $address;
    }
}
