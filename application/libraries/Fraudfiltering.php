<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

require_once APPPATH."third_party/predis/autoload.php";

class Fraudfiltering	{

	private $client;
	private $ipaddress;
	private $io;
	private $counter;

	public function __construct()	{
	}

	public function getIP()	{
		$this->client = new Predis\Client();

		return $this->client->get($this->ipaddress . $this->io);
	}

	public function checkFraud()	{
		$this->client = new Predis\Client();

		$this->counter = 0;

		if ($this->client->exists($this->ipaddress . "-" . $this->counter . "-" . $this->io))	{
			$value = $this->client->get($this->ipaddress . "-" . $this->counter . "-" . $this->io);
			$this->client->incrby($this->ipaddress . "-" . $this->counter . "-" . $this->io, 1);

			if ($value > 1)	{
				//this is fraud!!
				return true;
			} else {
				return false;
			}
		} else {
			$this->client->set($this->ipaddress . "-" . $this->counter . "-" . $this->io, 1);
			$this->client->expire($this->ipaddress . "-" . $this->counter . "-" . $this->io, 86400);
			return false;
		}
	}

	public function __get($name)	{
		return $this->$name;
	}

	public function __set($name, $value)	{
		$this->$name = $value;
	} 
}

?>
