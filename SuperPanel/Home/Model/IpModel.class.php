<?php
    namespace Home\Model;
    use Think\Model;
    class IpModel extends Model {
        public function saveIp($uid, $operation){
            $data['ip'] = get_client_ip();
            $data['location'] = resolve_ip($data['ip']);
            $data['uid'] = $uid;
            $data['operation'] = $operation;
            $this->add($data);
        }
    }
?>