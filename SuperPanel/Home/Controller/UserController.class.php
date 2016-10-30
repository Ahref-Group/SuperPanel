<?php
namespace Home\Controller;
use Think\Controller;
class UserController extends Controller {
    public function _initialize()
    {
        C(M('Config')->cache('config', 600)->getField('name,value'));
        
        $this->assign('site_name', C('SITE_NAME'));
        $this->userinfo = isLogined();
        if(count($this->userinfo)<2){
            if($this->userinfo == 0)
            {
                jump(U('Home/Auth/login'));
                exit;
            }
            else
            {
                jump(U('Home/Auth/relogin'));
                exit;
            }
                
        }
        $this->assign('userinfo', $this->userinfo);
        $this->assign('ip', get_client_ip());
        $this->assign('disqus_shortname', C('DISQUS_SHORTNAME'));
        $this->assign('announcement', M('announcement')->cache('announcement', 86400)->getField('item,text'));
        
        $this->assign('unread_message_amount', M('message')->cache('unread_message_amount', 86400)->where(['uid'=>$this->userinfo['uid'], 'unread'=>1])->count());
    }
    
    //用户中心SAP ProjectSAP Project
    public function index(){
        if(date('ymd', $this->userinfo['last_check_in_time']) == date('ymd')){
            $this->assign('checkined', true);
        }else{
            $this->assign('checkined', false);
        }
        $this->display();
    }
    
    public function me(){
        $user_group = explode(',', $this->userinfo['plan']);
        $node_availble = array();
        $node_list = M('node')->getField('nid',true);
        $Group = M('group');
        foreach($user_group as $group){
            $nodes = explode(',', $Group->where(['gid'=>$group])->getField('node'));
            foreach($nodes as $node){
                $node_availble[] = $node;
            }
        }
        $this->assign('node_amount', count(array_unique($node_availble)));
        
        $inviter = D('User')->getInviter($this->userinfo['invited_by']);
        $this->assign('inviter',$inviter);
        $this->display();
    }
    
    public function invite(){
        $invite_code = M('invite_code')->where(array('uid'=>$this->userinfo['uid']))->select();
        $this->assign('invite_code__list', $invite_code);
        $this->display();
    }
    
    public function record(){
        $this->assign('ip_list',M('ip')->where(['uid'=>$this->userinfo['uid']])->order('id desc')->select());
        $this->display();
    }
    
    public function economicRecord(){
        $this->assign('purchase_list', M('purchase_log')->where(['uid'=>$this->userinfo['uid']])->order('time desc')->select());
        $this->display();
    }
    
    
    public function tickets(){
        $ticket_list = M('ticket')->where(array('uid'=>$this->userinfo['uid']))->order('open_time desc')->select();
        $this->assign('ticket_list', $ticket_list);
        $this->display();
    }
    
    public function systemInformation(){
        $this->show('hey');
    }
    
    
    public function node(){
        $group_list = M('group')->select();
        $nodes = M('node')->select();
        $node_list = array();
        
        $user_group = explode(',', $this->userinfo['plan']);
        
        //根据node列表生成一个以nid为索引的关联数组
        foreach($nodes as $node){
            $node_list[$node['nid']] = $node;
        }
        
        foreach($group_list as &$group){
            $nodes = explode(',', $group['node']);
            $group['node'] = $nodes;
        }
        
        $this->assign('group_list', $group_list);
        $this->assign('node_list', $node_list);
        $this->assign('user_group', $user_group);
        $this->display();
    }
    
    public function charge(){
        $charge_status = 0;
        if(I('get.is_success') == 'T'){
            if(spay_alipay_return_verify(C('SPAY_CODE'))){
                $ts = $_GET['trade_status'];
                if ($ts == 'TRADE_FINISHED' || $ts == 'TRADE_SUCCESS'){
                    $charge_status = 1;
                }else{
                    $charge_status = 2;
                }
            }else{
                $charge_status = 2;
            }
        }
        $this->assign('charge_status',$charge_status);
        
        $this->assign('alipay_order_list', M('alipay')->order('out_trade_no desc')->where(['uid'=>$this->userinfo['uid']])->select());
        
        $exchange_list = M('exchange_code')->order('exchange_time desc')->where(['uid'=>$this->userinfo['uid']])->field('money, exchange_time')->select();
        foreach($exchange_list as &$exchange){
            $exchange['exchange_time'] = date('Y-m-d H:i:s', $exchange['exchange_time']);
        }
        $this->assign('exchange_list', $exchange_list);
        $this->display();
    }
    
    public function setting(){
        Vendor('GoogleAuth.GoogleAuthenticator');
        
        $Google2Factor = new \PHPGangsta_GoogleAuthenticator();
        $secret = M('salt')->where(['uid'=>$this->userinfo['uid']])->getField('google2factor');
        if(empty($secret)){
            //如果是从v2升级的用户，此字段为空，就必须立即生成一个
            $secret = $Google2Factor->createSecret();
            M('salt')->where(['uid'=>$this->userinfo['uid']])->setField('google2factor', $secret);
        }
        $this->assign('secret', $secret);
        $this->assign('url', $Google2Factor->getQRCodeGoogleUrl(C('SITE_NAME'), $secret));
        $this->display();
    }
    
    public function message(){
        $Message = M('message');
        $messages = $Message->where(['uid'=>$this->userinfo['uid']])->order('time desc')->cache('message')->select();
        
        $Message->where(['uid'=>$this->userinfo['uid'], 'unread'=>1])->setField('unread', 0);
        S('unread_message_amount',null);      //因为用户读了，所以要把未读数量设置为0并清除缓存
        
        $this->assign('messages', $messages);
        $this->display();
    }
    
    public function shop(){
        $this->assign('transfer_items', M('shop_item')->where(['type'=>'transfer'])->select());
        $this->assign('expiration_items', M('shop_item')->where(['type'=>'expiration'])->select());
        $this->assign('port_items', M('shop_item')->where(['type'=>'port'])->select());
        $this->display();
    }
}