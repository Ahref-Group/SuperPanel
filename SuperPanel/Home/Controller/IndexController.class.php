<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function _initialize(){
        C(M('Config')->getField('name,value'));
        $this->assign('announcement', M('announcement')->getField('item,text'));
        $this->assign('site_name', C('SITE_NAME'));
        $this->assign('site_url', C('SITE_URL'));
    }
    
    
    public function index(){
        $this->display();
    }
    
    public function email(){
        $ip = get_client_ip();
        $this->assign('site_name', C('SITE_NAME'));
        $this->assign('username', 'yangwang');
        $this->assign('ip', $ip.' | '.resolve_ip($ip));
        $this->display('Email/reset_password');
    }
    
    public function invite_code(){
        if(C('REQUIRE_INVITE_CODE') == 0){
            jump(U('Home/Auth/register'));
            exit;
        }
        $invite_code_list = M("invite_code")->where(array('uid' => 0))->select();
        $this->assign("invite_code_list", $invite_code_list);
        $this->display();
    }
}