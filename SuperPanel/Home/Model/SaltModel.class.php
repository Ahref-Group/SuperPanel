<?php
    namespace Home\Model;
    use Think\Model;
    class SaltModel extends Model {
        public function verifyGoogle2FactorCode($uid, $code){
            Vendor('GoogleAuth.GoogleAuthenticator');
            $Google2Factor = new \PHPGangsta_GoogleAuthenticator();
            
            $secret = $this->where(['uid'=>$uid])->getField('google2factor');
            return $Google2Factor->verifyCode($secret, $code, 2);
        }
        
        public function getSecret($uid){
            //获取用户的二步验证密匙
            Vendor('GoogleAuth.GoogleAuthenticator');
            $Google2Factor = new \PHPGangsta_GoogleAuthenticator();
            
            $secret = $this->where(['uid'=>$uid])->getField('google2factor');
            if(empty($secret)){
                //如果是从v2升级的用户，此字段为空，就必须立即生成一个
                $secret = $Google2Factor->createSecret();
                $this->where(['uid'=>$uid])->setField('google2factor', $secret);
            }
            
            return $secret;
        }
    }
?>