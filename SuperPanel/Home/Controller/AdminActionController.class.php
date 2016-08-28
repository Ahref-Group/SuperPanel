<?php
namespace Home\Controller;
use Think\Controller;
class AdminActionController extends Controller {
    public function _initialize()
    {
        C(M('Config')->cache('config', 600)->getField('name,value'));
        
        $this->userinfo = isAdmin();
    }

    
    
    public function announcement(){
        $data['item']= I('post.item');
        $data['introduction'] = I('post.introduction');
        $data['text'] = base64_decode(I('post.text'));
        
        if(M('announcement')->add($data,$options=array(),$replace=true)){
            $this->ajaxReturn(array('status'=>"success"));
        }else{
            $this->ajaxReturn(array('status'=>"error", "info"=>_('未知原因')));
        }
    }
    
    public function userList(){
        $draw = I('get.draw');
        $page = I('get.page');
        $length = I('get.length');
        $order = I('get.order');
        $sort = I('get.sort');
        $start =($page - 1)*$length;
        
        
        $User = D('User');
        $user_amount = $User->getUserAmount();
        
        //$restrict['status'] = array('gt', 'deleted');
        
        if(I('get.miao_not_none') == "true"){
            $restrict['money'] = array('gt', 0);
        }
        if(I('get.email_not_verify') == "true"){
            $restrict['verified'] = array('eq', 0);
        }
        if(I('get.user_disabled') == "true"){
            $restrict['enable'] = array('eq', 0);
        }
        if(I('get.transfer_eq_zero') == "true"){
            $restrict['real_transfer'] = array('eq', 0);
        }
        
        $user_list = $User->order($order.' '.$sort)->limit($start, $length)->where($restrict)->select();
        
        //获取邀请人
        foreach($user_list as &$user){
            $user['invited_by'] = $User->getInviter($user['invited_by']);
        }
        $data['draw'] = $draw;
        $data['total']=$user_amount;
        $data['length']=count($user_list);
        $data['available'] = $User->where($restrict)->count();
        $data['data']=$user_list;
        $this->ajaxReturn($data);
    }
    
    public function generateInviteCode(){
        $group = empty(I('post.group'))?C('DEFAULT_GROUP'):I('post.group');
        $money = empty(I('post.money'))?C('DEFAULT_MONEY'):I('post.money');
        $expiration = empty(I('post.expiration'))?C('DEFAULT_EXPIRATION'):I('post.expiration');
        $transfer = empty(I('post.transfer'))?C('DEFAULT_TRANSFER'):I('post.transfer');
        $prefix = empty(I('post.prefix'))?'':I('post.prefix');
        $amount = empty(I('post.amount'))?1:I('post.amount');
        $data['uid'] = 0;
        $data['group'] = $group;
        $data['money'] = $money;
        $data['expiration'] = $expiration;
        $data['transfer'] = $transfer;
        
        $n = 0;
        while($n < $amount){
            $data['code'] = $prefix.hash('md5', rand());
            M('invite_code')->add($data);
            $n++;
        }
    }
    
    public function generateExchangeCode(){
        $amount = I('post.amount');
        $expiration = I('post.expiration');
        $prefix = I('post.prefix');
        $money = floatval(I('post.money'));
        $expiration = strtotime($expiration) + 86399;   //从字符串转得的时间戳是当日0点的，需要将其转换至当日23点59分59秒
        
        if(strlen($prefix)>32 || $money <= 0){
            $this->ajaxReturn(['status'=>'error', 'info'=>_('无效的参数')]);
        }
        
        while($amount-- > 0){
            $exchange_code_list[] = array('code'=>$prefix.hash('crc32', uniqid(mt_rand(), false)),
                'expiration'=>$expiration, 'money'=>$money);
        }
        M('exchange_code')->addAll($exchange_code_list);
        $token = mt_rand();
        F('exchange_code_'.$token, $exchange_code_list);
        
        $this->ajaxReturn(['status'=>'success', 'info'=>$token]);
    }
    
    public function getExchangeCodeByToken(){
        $token=I('get.token');
        $exchange_code_list = F('exchange_code_'.$token);
        
        if(empty($exchange_code_list)){
            $this->ajaxReturn(['status'=>'error', 'info'=>'invalid token']);
        }
        
        header('Content-type: text/plain');
        header('Content-Disposition: attachment; filename="'.C('SITE_NAME').$token.'.txt"');
        echo "-------------------------------------------------------------------\r\n";
        echo "|   _____                            ____                       __|\r\n";
        echo "|  / ___/ __  __ ____   ___   _____ / __ \ ____ _ ____   ___   / /|\r\n";
        echo "|  \__ \ / / / // __ \ / _ \ / ___// /_/ // __ `// __ \ / _ \ / / |\r\n";
        echo "| ___/ // /_/ // /_/ //  __// /   / ____// /_/ // / / //  __// /  |\r\n";
        echo "|/____/ \__,_// .___/ \___//_/   /_/     \__,_//_/ /_/ \___//_/   |\r\n";
        echo "|            /_/                                                  |\r\n";
        echo "-------------------------------------------------------------------\r\n";
        echo "\r\n";
        
        echo C('SITE_NAME')."兑换码\r\n";
        echo '过期时间：'.date('Y/m/d H:i:s', $exchange_code_list[0]['expiration'])."\r\n";
        echo '每个兑换码包含：'.$exchange_code_list[0]['money']."喵币\r\n";
        echo '共计'.count($exchange_code_list)."个\r\n";
        echo "-----------------------\r\n\r\n";
        
        foreach($exchange_code_list as $exchange_code){
            echo $exchange_code['code']."\r\n";
        }
        
        F('exchange_code_'.$token, NULL);
        
        exit;
    }
    
    public function deleteExchangeCode(){
        $code = I("post.code");
        M('exchange_code')->where(['code'=>$code])->delete();
        $this->ajaxReturn(['status'=>'success']);
    }
}