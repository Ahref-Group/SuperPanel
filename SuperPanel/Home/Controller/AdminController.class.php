<?php
namespace Home\Controller;
use Think\Controller;
class AdminController extends Controller {
    public function _initialize()
    {
        C(M('Config')->cache('config', 600)->getField('name,value'));
        
        $this->assign('site_name', C('SITE_NAME'));
        $this->userinfo = isAdmin();
        $this->assign('userinfo', $this->userinfo);
        $this->assign('ip', get_client_ip());
        $this->assign('disqus_shortname', C('DISQUS_SHORTNAME'));
        $this->assign('announcement_list', M('announcement')->field('item,introduction')->select());
    }
    
    
    public function index(){
        $User = D('User');
        $this->assign('user_amount', $User->getUserAmount());
        $this->assign('checked_user_amount', $User->getCheckedUserAmount());
        $this->assign('node_amount', M('node')->count());
        $this->assign('group_amount', M('group')->count());
        $this->display();
    }
    
    public function announcement(){
        $item=I('get.item');
        if(!empty($item))
            $single_announcement = M('announcement')->where(array('item'=>$item))->find();
        if(empty($single_announcement)){
            //结果为空
            $this->assign('is_edit', FALSE);
        }
        else
            $this->assign('is_edit', TRUE);
        //var_dump(M('announcement')->field('item,introduction,value')->select());
        //die();
        $this->assign('single_announcement', $single_announcement);
        $this->display();
    }
    
    
    public function invite(){
        //$invite_code = M('invite_code')->where(array('uid'=>$this->userinfo['uid']))->select();
        //$this->assign('invite_code__list', $invite_code);
        $public_invite_code_amount = M('invite_code')->where(['uid'=>'0'])->count();
        $this->assign('public_invite_code_amount', $public_invite_code_amount);
        $this->display();
    }
    
    public function exchangeCode(){
        $exchange_code_list = M('exchange_code')->where(['exchange_time'=>0])->select();
        // var_dump($exchange_code_list);
        // die();
        $this->assign('exchange_code_list', $exchange_code_list);
        $this->display();
    }
    
    
    public function editNode(){
        $nid = I('get.nid');
        
        $Node = M('node');
        $node_list = $Node->field('nid,node_name')->select();
        
        
        
        $this->assign('node_list', $node_list);
        if(empty($nid)){
            //没有参数就是添加节点
            $this->assign('edit', false);
            $this->display();
        }else{
            $node_info = $Node->where(['nid'=>$nid])->find();
            $this->assign('node_info', $node_info);
            $this->assign('edit', true);
            $this->display();
        }
    }
}