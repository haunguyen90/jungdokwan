<?php
class Notification_model extends MY_Model {
    protected $table_name = 'notification';

    public function get_by_id ($notification_id)
    {
        $row = $this->db
            ->where('id', $notification_id)
            ->get($this->table_name)
            ->row();
        $row->items = $this->get_items($row->id);
        return $row;
    }

    public function dismiss ($notification_id)
    {
        return $this->db
            ->where('id', $notification_id)
            ->set('dismiss_at', date('c', strtotime('-1 second')))
            ->update($this->table_name);
    }

    public function get_notifications ($user_id)
    {
        $notifications = $this->db
            ->where('user_id', $user_id)
            ->where('publish_at <=', date('c'))
            ->where('dismiss_at >', date('c'))
            ->get($this->table_name)
            ->result();
        foreach ($notifications AS $row)
        {
            $row->items = $this->get_items($row->id);
        }
        return $notifications;
    }

    public function add_notification ($user_id, $app_id, $publish, $dismiss, $items = array())
    {
        $row = array(
            'user_id'       => $user_id,
            'app_id'        => $app_id,
            'created'       => date('c'),
            'publish_at'    => $publish->format('c'),
            'dismiss_at'    => $dismiss->format('c'),
        );
        if ($this->db->insert($this->table_name, $row))
        {
            $id = $this->db->insert_id();
            foreach ($items AS $item)
            {
                $this->add_item($id,
                                $item->link_text,
                                $item->detail_text,
                                $item->extra);
            }
            $this->push_notification($id);
            return $id;
        }
        return FALSE;
    }

    public function add_item($notification_id, $link_text, $desc, $extra = NULL)
    {
        $row = array(
            'notification_id'   => $notification_id,
            'link_text'         => $link_text,
            'detail_text'       => $desc,
            'extra'             => $extra,
        );
        return $this->db->insert('notification_item', $row);
    }

    public function get_items($row_id)
    {
        return $this->db
            ->where('notification_id', $row_id)
            ->get('notification_item')
            ->result();
    }

    public function push_notification($notification_id)
    {
        $notification = $this->get_by_id($notification_id);
        if ($notification)
        {
            $channel = 'user_' . $notification->user_id;
            $ci = get_instance();
            $ci->load->library('push');
            $ci->push->send('notification', $channel, $notification);
        }
    }
}
