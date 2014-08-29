<?php

class MY_Model extends CI_Model {
    protected $CI;
    protected $table_name;
    protected $primary_key = 'id';

    public function __construct ()
    {
    	parent::__construct();
    	$this->CI =& get_instance();
    }
    
    public function insert ($row_data)
    {
        $r = $this->db->insert($this->table_name, $row_data);
        return $this->db->insert_id();
    }

    public function update ($new_data, $where)
    {
        return $this->db->update($this->table_name, $new_data, $where);
    }
    
    public function delete($where) {        
        return $this->db->delete($this->table_name, $where);
    }

    protected function row_or_null ($query)
    {
        $query = $this->db->get_where($this->table_name, $query);
        if ($query->num_rows() == 0)
        {
            return NULL;
        }
        return $query->row();
    }
		
    public function __set ($name, $value)
    {
        $this->$name = $value;
    }

    public function __get ($name)
    {
        switch ($name)
        {
            case 'ci':
                return $this->CI;
            case 'db':
                return $this->CI->db;
            case 'load':
                return $this->CI->load;
            default:
                if (isset($this->CI->{$name})) {
                    return $this->CI->{$name};
                }
                return $this->{$name};
        }
    }

    protected function get_table_meta_info ()
    {
        $sql = "desc {$this->table_name}";
        $query = $this->db->query($sql);

        $required = array();
        $optional = array();
        foreach ($query->result() AS $column)
        {
            if ($column->Field === $this->primary_key)
                continue;

            if ($column->Null === 'NO' && $column->Default === NULL)
                array_push($required, $column->Field);
            else
                array_push($optional, $column->Field);
        }

        return array($required, $optional);
    }

    protected function check_for_insert ($object)
    {
        list($required, $optional) = $this->get_table_meta_info();

        $row_data = array();
        foreach ($required AS $k)
        {
            if (empty($object->{$k}))
                throw new Exception("{$k} is required.");
            $row_data[$k] = $object->{$k};
        }
        foreach ($optional AS $k)
        {
            if (empty($object->{$k}))
                continue;
            $row_data[$k] = $object->{$k};
        }
        return $row_data;
    }

    protected function check_for ($members)
    {
        foreach ($members AS $k)
        {
            if (empty($this->{$k}))
                throw new Exception("{$k} is required.");
        }
    }
    
    protected function build_update ($object)
    {
        list($required, $optional) = $this->get_table_meta_info();

        $row_data = array();
        foreach (array_merge($required, $optional) AS $k)
        {
            if ($k == $this->primary_key)
                continue;

            if (empty($object->{$k}))
                continue;

            $row_data[$k] = $object->{$k};
        }

        return $row_data;
    }
}

