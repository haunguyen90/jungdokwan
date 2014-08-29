<?php 
require_once 'HTTP/Request2.php';

class Procalltrack {    
    private $api_url = "https://portal.procalltrack.com/api/";    
    
    public function __call($name, $arguments) {   
        $words = preg_split('/(?=[A-Z])/u', $name);        
        foreach ($words as $index => $word)
            $words[$index] = lcfirst ($word);
        $url = implode('/',array_reverse($words));    
        $request = new HTTP_Request2($this->api_url . $url, HTTP_Request2::METHOD_POST);
        $request->setHeader("X-API-KEY",'99f28e209debefbc1aa272f1cbc63dac');
        $request->setConfig("ssl_verify_peer", false);

        foreach($arguments as $index => $value){
            if (is_array($value))
                $request->addPostParameter($value);
            else
                $request->setUrl($request->getUrl() . "/$value");
        }
        try {
            
            $response = $request->send();
            if (200 == $response->getStatus()) {
                $result = json_decode($response->getBody(),true);
                if (isset($result)) return $result;
                throw new Exception('Invalid JSON format in Procalltrack response: ' . $response->getBody());
            } else {
                throw new Exception('Unexpected HTTP status: ' . $response->getStatus() . ' ' .$response->getReasonPhrase());
            }
        } catch (HTTP_Request2_Exception $e) {
            throw new Exception('Error: ' . $e->getMessage());
        }
    }
}