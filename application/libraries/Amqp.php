<?php
class Amqp {
    private $connection;
    private $channel;

    public function __construct($params = array())
    {
        $this->targets = $params['targets'] ?: array();

        if (empty($params['host']))
        {
            throw new Exception("amqp server host not defined");
        }

        $this->connection = new AMQPConnection($params);
        $this->connection->setHost($params['host']);

        if ( ! $this->connection->connect() )
        {
            throw new Exception("amqp server connection failed");
        }

        $this->channel = new AMQPChannel($this->connection);
    }

    private $exchanges = array();
    private function get_exchange($ex_name = '', $ex_type = AMQP_EX_TYPE_TOPIC)
    {
        if (empty($exchanges[$ex_name]))
        {
            $ex = new AMQPExchange($this->channel);
            $ex->setName($ex_name);
            $ex->setType($ex_type);
            $ex->declare();

            $this->exchanges[$ex_name] = $ex;
        }

        return $this->exchanges[$ex_name];
    }

    private $queues = array();
    private function get_queue($queue_name)
    {
        if (empty($this->queues[$queue_name]))
        {
            $q = new AMQPQueue($this->channel);
            $q->setName($queue_name);
            $q->declare();

            $this->queues[$queue_name] = $q;
        }

        return $this->queues[$queue_name];
    }

    private function bind_queue($queue, $exchange_name, $key)
    {
        if (is_array($key))
        {
            foreach ($key AS $k)
            {
                $this->bind_queue($queue, $exchange_name, $k);
            }
        }
        else
        {
            return $queue->bind($exchange_name, $key);
        }
    }

    public function send($ex_name, $ex_type, $routing_key, $message)
    {
        $data = is_string($message) ? $message : json_encode($message);

        $ex = $this->get_exchange($ex_name, $ex_type);
        $ex->publish($data, $routing_key);
    }

    private $targets = array();
    private function get_target($target_name)
    {
        if (empty($this->targets[$target_name]))
        {
            throw new Exception("unknow target");
        }
        return $this->targets[$target_name];
    }

    public function send_to_target($target_name, $message)
    {
        $target = $this->get_target($target_name);
        return $this->send(
                $target['exchange'],
                $target['type'],
                $target['routing_key'],
                $message);
    }

    public function consume_target($target_name, $callback)
    {
        $target = $this->get_target($target_name);
        $ex = $this->get_exchange($target['exchange'], $target['type']);
        $q = $this->get_queue($target['exchange'] . "_" . $target['routing_key']);
        $this->bind_queue($q, $target['exchange'], $target['routing_key']);

        $q->consume($callback);
    }
}
