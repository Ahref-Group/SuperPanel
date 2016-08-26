<?php
    namespace Home\Model;
    use Think\Model;
    class UserModel extends Model {
        public function login($email, $password){
            $result = $this->where(array('email' => $email))->find();
            if($result == NULL){
                return false;
            }
            $salt = M('salt')->where(array('uid'=>$result['uid']))->find()['salt'];
            if(password($password, $salt) == $result['password']){
                D('Ip')->saveIp($result['uid'], _('登录'));
                return $result['password'];
            }
            return false;
        }
        
        
        public function getUserAmount(){
            return $this->count();
        }
        
        public function getCheckedUserAmount(){
            //获取当日签到的用户数
            return $this->where(['last_check_in_time'=>['gt', strtotime(date('Y-m-d', time()))]])->count();
        }
        
        public function getInviter($uid){
            if($uid == 0){
                return _('系统');
            }else{
                return $this->where(['uid'=>$uid])->getField('username');
            }
        }
        
        public function redistributePort($uid){
            $used_port = $this->getField('port',true);
            
            $reserved_port = explode(',', C('PORT_RESERVE'));
            $port = C('PORT_BEGIN');
            $max_port = C('POET_END');
            while($port <= $max_port){
                if(!in_array($port,$reserved_port)){
                    if(!in_array($port,$used_port)){
                        $this->where(['uid'=>$uid])->setField('port', $port);
                        return $port;
                    }
                }
                $port++;
            }
        }
    }
?>