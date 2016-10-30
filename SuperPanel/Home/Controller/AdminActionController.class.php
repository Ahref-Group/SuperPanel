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
        S('announcement', null);    //先清理缓存
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
    
    public function editNode(){
        $nid = I('post.nid');
        $data['node_name'] = I('post.node_name');
        $data['node_info'] = I('post.node_info');
        $data['status'] = intval(I('post.status'));
        $data['visible'] = I('post.visible') == 'true'?1:0;
        $data['address'] = I('post.address');
        
        if(empty($nid)){
            M('node')->add($data);
            $this->ajaxReturn(['status'=>'success']);
        }else{
            M('node')->where(['nid'=>$nid])->save($data);
            $this->ajaxReturn(['status'=>'success']);
        }
    }
    
    
    public function editGroup(){
    }
    
    public function closeTicket(){
        $tid = I('post.tid');
        if(M('ticket')->where(['tid'=>$tid, 'status'=>['neq', 'closed']])->count()==1){
            M('ticket')->where(['tid'=>$tid])->setField('status', 'closed');
            $this->ajaxReturn(['status'=>'success', 'info'=>_('该工单已被关闭')]);
        }else{
            $this->ajaxReturn(['status'=>'error', 'info'=>_('该工单不存在或已被关闭')]);
        }
    }
    
    public function editGroupNode(){
        $gid = I('post.gid');
        $nid = explode(',', I('post.nid'));
        
        $node_list = M('node')->getField('nid',true);
        
        foreach($nid as $single_nid){
            if(!empty($single_nid)){
                if(in_array($single_nid, $node_list)){
                    $valid_nid[] = $single_nid;
                }
            }
        }
        
        $nid = implode(',', $valid_nid);
        M('group')->where(['gid'=>$gid])->setField('node', $nid);
        
        $this->ajaxReturn(['status'=>'success']);
    }
    
    
    public function getTicketContent(){
        $tid = I('post.tid');
        
        $ticket = M('ticket')->where(['tid'=>$tid])->find();
        
        if(empty($ticket)){
            $this->ajaxReturn(['status'=>'error', '无效的tid']);
        }
        $userinfo = M('user')->where(['uid'=>$ticket['uid']])->find();
        $ticket_reply = M('ticket_reply')->where(['tid'=>$tid])->select();
        
        $data['data'][0] = array('tid'=>$tid, 'uid'=>$ticket['uid'], 'message'=>$ticket['message'], 'reply_time'=>$ticket['open_time']);
        $data['data'] = array_merge($data['data'], $ticket_reply);
        
        
        $data['userinfo'] = $userinfo;
        $data['userinfo']['gravatar_url'] = get_gravatar_url($userinfo['email'], 50);
        $this->ajaxReturn(['status'=>'success', 'info'=>$data]);
    }
    
    public function deleteNode(){
        $nid = I('post.nid');
        
        if(M('node')->where(['nid'=>$nid])->delete()){
            $this->ajaxReturn(['status'=>'success']);
        }else{
            $this->ajaxReturn(['status'=>'error', 'info'=>'删除失败，可能是节点不存在']);
        }
    }
    
    public function getUserInfo(){
        $uid = I('get.uid');
        $user = M('user')->where(['uid'=>$uid])->find();
        
        if (empty($user)){
            $this->ajaxreturn(['status' => 'error', 'info' => '用户信息不存在！']);
        }else{
            $this->ajaxreturn(['status' => 'true', 'info' => $user]);
        }
    }
    
    public function editItem(){
        $iid = I('post.iid');
        $data['title'] = urlsafe_b64decode(I('post.title'));
        $data['prices'] = urlsafe_b64decode(I('post.prices'));
        $data['amount'] = I('post.amount');
        $data['introduction'] = urlsafe_b64decode(I('post.introduction'));
        $data['commands'] = urlsafe_b64decode(I('post.command'));
        
        if('' == $data['amount']){
            $data['amount'] = 'INF';
        }
        
        if(empty($iid)){
            M('shop_item')->add($data);
            $this->ajaxreturn(['status'=>'success']);
        }else{
            M('shop_item')->where(['iid'=>$iid])->save($data);
            $this->ajaxreturn(['status'=>'success']);
        }
    }
    
    public function deleteItem(){
        $iid = I('post.iid');
        $ShopItem = M('shop_item');
        if($ShopItem->where(['iid'=>$iid]) -> count() == 0){
            $this->ajaxreturn(['status'=>'error', 'info'=>'商品不存在']);
        }else{
            $ShopItem->where(['iid'=>$iid])->delete();
            $this->ajaxreturn(['stauts'=>'success']);
        }
    }
    
    public function deleteAllItem(){
        if(I('post.confirm') == 'confirm'){
            M('shop_item')->where(1)->delete();
            $this->ajaxreturn(['stauts'=>'success']);
        }else{
            $this->ajaxreturn(['status'=>'error', 'info'=>'需要确认']);
        }
    }
    
    
    public function replyTicket(){
        $data['tid'] = I('post.tid');
        $data['message'] = I('post.message');
        $data['uid'] = 0;
        M('ticket_reply')->add($data);
        $this->ajaxreturn(['status' =>'success']);
    }
}