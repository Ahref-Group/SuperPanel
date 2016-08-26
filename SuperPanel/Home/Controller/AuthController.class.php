<?php

namespace Home\Controller;
use Think\Controller;

class AuthController extends Controller
{
    public function _initialize(){
        C(M('Config')->getField('name,value'));
        $this->assign('public_key', C('PUBLIC_KEY'));
        $this->assign('site_name', C('SITE_NAME'));
        $this->assign('site_url', C('SITE_URL'));
        $this->assign('ip', get_client_ip());
    }
    
    //登录页
    public function login()
    {
        if(count(isLogined())>2){
            jump(U('Home/User/index'));
        }else{
            $this->display();
        }
    }
    
    public function relogin(){
        $this->assign('email', cookie('email'));
        $this->display();
    }
    
    
    
    //注册页面
    public function register($code=''){
        if(count(isLogined())>2){
            //如果已登录，是不允许注册的
            jump(U('Home/User/index'));
        }
        else{
            $this->assign('require_invite_code', C('REQUIRE_INVITE_CODE'));
            $this->assign('invite_code', $code);
            $this->display();
        }
    }
    
    
    //验证邮箱操作
    public function verifyEmail(){
        $verify = verify_url();
        if($verify['operation'] == 'verify_email'){
            $this->display('verifySuccess');
            M('User')->where(['uid' => $verify['uid']])->setField('verified',1);
        }
        else
            $this->display('verifyError');
    }
    
    
    public function forgetPassword(){
        $this->display();
    }
    
    public function resetPassword(){
        $verify = verify_url();
        if ($verify['operation'] != 'reset_password'){
            $this->display('verifyError');
            exit;
        }
        else{
            $this->assign('url', generate_verify_url($verify['uid'], 'Home/AuthAction/resetPassword', 300, 'reset_password_action'));
            $this->display();
        }
    }

}