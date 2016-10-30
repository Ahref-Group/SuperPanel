<?php

namespace Home\Controller;
use Think\Controller;

class AuthActionController extends Controller
{
    public function _initialize(){
        C(M('Config')->getField('name,value'));
        $this->assign('public_key', C('PUBLIC_KEY'));
        $this->assign('site_name', C('SITE_NAME'));
        $this->assign('site_url', C('SITE_URL'));
        
    }
    
    //退出
    public function logout(){
        cookie('code', null);
        cookie('expiration', null);
        $this->ajaxReturn(['status'=>'success', 'info'=>_('退出成功')]);
    }
    
    //登陆操作
    public function login(){
        if(!empty(I('post.email')) && !empty(I('post.password'))){
            $private_key = openssl_pkey_get_private('file://../private_key.pem');
            $ciphertext = I('post.password');
            $bin_ciphertext = base64_decode($ciphertext);
            if(!openssl_private_decrypt($bin_ciphertext, $password, $private_key, OPENSSL_PKCS1_PADDING)){
                $this->ajaxReturn(['status'=>'error', 'info'=>_('密码解码失败，请检查你的网络，并联系网站管理员')]);
            }
            elseif(login(I('post.email'), $password, I('post.remember'))){
                $this->ajaxReturn(['status'=>'success','info'=>_('本次登录IP: ')]);
            }
            else
                $this->ajaxReturn(['status'=>'error', 'info'=>_('错误的邮箱或密码')]);
        }
        else
            $this->ajaxReturn(array('status'=>'error', 'info'=>_('无效的邮箱或密码！')));
    }
    
    //注册操作
    public function register(){
        
        Vendor('GoogleAuth.GoogleAuthenticator');
        //导入google二步验证库
        $rules = array(
            array('email', 'require', _('邮箱必填'), 1),
            array('username', 'require', _('用户名必填'), 1),
            array('password', 'require', _('用户密码必填'), 1),
            array('repassword', 'require', _('重复密码必填'), 1),
            array('email','email',_('邮箱无效！'), 1),
            array('username','',_('帐号名称已经存在！'),1,'unique',1),
            array('email','',_('邮箱已存在！'),1,'unique',1),
            
        );
    $User = M("user"); // 实例化User对象
    
    if (!$User->validate($rules)->create()){
         // 如果创建失败 表示验证没有通过 输出错误提示信息
         $this->ajaxReturn(['status'=>'error', 'info'=>$User->getError()]);
         exit();
    }else{
        if(C('REQUIRE_INVITE_CODE')== '1'){
            //注册必须邀请码，就查找一下邀请码
            $InviteCode = M('invite_code');
            $invite_code = $InviteCode->where(['code'=>I('post.invite_code')])->find();
            
            if(empty($invite_code)){
                //为空自然就是没有找到啦
                $this->ajaxReturn(['status'=>'error', 'info'=>_('无效的邀请码')]);
                exit();
            }
        }
        else{
            $invite_code['uid'] = 0;    //如果不需要邀请码，则默认邀请人为系统
            $invite_code['group'] = C('DEFAULT_GROUP');
            $invite_code['money'] = C('DEFAULT_MONEY');
            $invite_code['expiration'] = C('DEFAULT_EXPIRATION');
            $invite_code['transfer'] = C('DEFAULT_TRANSFER');
        }
        
        //解码密码
        $private_key = openssl_pkey_get_private('file://../private_key.pem');
        $password = base64_decode(I('post.password'));
        $repassword = base64_decode(I('post.repassword'));
        //首先要把密码base64解码，然后再rsa解码
        if(!openssl_private_decrypt($password, $password_dec, $private_key, OPENSSL_PKCS1_PADDING)){
            $this->ajaxReturn(['status'=>'error', 'info'=>_('密码解码失败，请检查您的网络链接或与网站管理员联系')]);
            exit;
        }
        if(!openssl_private_decrypt($repassword, $repassword_dec, $private_key, OPENSSL_PKCS1_PADDING)){
            $this->ajaxReturn(['status'=>'error', 'info'=>_('重复密码解码失败，请检查您的网络链接')]);
            exit;
        }
        if($password_dec != $repassword_dec){
            //判断两次密码是否相同
            $this->ajaxReturn(['status'=>'error', 'info'=>_('密码和重复密码不相同')]);
            exit;
        }
        if(strlen($password_dec) < 6){
            $this->ajaxReturn(['status'=>'error', 'info'=>_('密码不能小于6位')]);
            exit;
        }
        $salt = bin2hex(openssl_random_pseudo_bytes(64));       //产生盐
        
        $User->password = password($password_dec, $salt);
        $User->passwd = substr(md5(mt_rand()), 0, 6);
        $User->method = C('DEFAULT_METHOD');
        $User->protocol = C('DEFAULT_PROTOCOL');
        $User->obfs = C('DEFAULT_OBFS');
        $User->invited_by = $invite_code['uid'];
        $User->money = $invite_code['money'];
        $User->plan = $invite_code['group'];
        $User->plan_end_time = time() + $invite_code['expiration'];
        $User->transfer_enable = $invite_code['transfer'];
        $User->invite_code_amount = C('DEFAULT_INVITE_AMOUNT');
        $User->port = 1 + M('user')->max('port');
        $uid = $User->add();           //添加用户
        
        $Google2Factor = new \PHPGangsta_GoogleAuthenticator();
        $Salt = M('salt');
        $Salt->salt = $salt;
        $Salt->uid = $uid;
        $Salt->google2factor = $Google2Factor->createSecret();
        $Salt->add();
        C('REQUIRE_INVITE_CODE')?$InviteCode->where(['code'=>I('post.invite_code')])->delete():1;  //删除已用邀请码
        
        $this->assign('verify_url',generate_verify_url($uid, 'Home/Auth/verifyEmail', 3600, 'verify_email'));
        $this->assign('username', I('post.username'));
        $content = $this->fetch('Email/verify');    //渲染邮件模板
        //下面自然就是发送邮件啦
        if(($info = send_mail(I('post.email'), _('验证您的账户').' - '.C('SITE_NAME'), $content)) == 0){
            $this->ajaxReturn(['status'=>'success', 'info'=>sprintf(_('我们已经发送一封验证邮件到%s<br>请点击里面的链接验证您的邮箱！'), I('post.email'))]);
        }
        else
            $this->ajaxReturn(['status'=>'success', 'info'=>sprintf(_('您已注册成功，但是在为您发送激活邮件时系统发生了错误<br>详细信息为：%s<br>请将此信息告知网站管理员以获得帮助'),$info)]);
        }
    }
    
    
    
    public function forgetPassword(){
        $email = I('post.email');
        if(($userinfo = M('User')->where(['email'=>$email])->find()) == NULL){
            $this->ajaxReturn(['status'=>'error', 'info'=>_('邮箱无效，邮箱格式不正确或该邮箱未在本站注册')]);
        }
        else{
            $this->assign('username', $userinfo['username']);
            $url = generate_verify_url($userinfo['uid'], 'Home/Auth/resetPassword', 600, 'reset_password');
            $this->assign('url', $url);
            $content = $this->fetch('Email/forgetPassword');
            $ret = send_mail($email, _('找回密码').' - '.C('SITE_NAME'), $content);
            if($ret === 0){
                $this->ajaxReturn(['status'=>'success', 'info'=>'我们已经发送一封验证邮件到'.$email.
                    '<br>请点击里面的链接来重置您的密码<small>（链接有效期为10分钟）</small>']);
            }
            else
                $this->ajaxReturn(['status'=>'error','info'=>sprintf(_('噢哦，发送邮件时似乎出现了一些错误，错误信息为%s，请将其告知网站管理员'),$ret)]);
        }
            
    }
    
    
    public function resetPassword(){
        //重置密码
        $verify = verify_url();
        
        if($verify['operation']!='reset_password_action'){
            $this->ajaxReturn(['status'=>'error', 'info'=>_('无效的链接或链接已过期')]);
            exit;
        }
        
        $private_key = openssl_pkey_get_private('file://../private_key.pem');
        $password = base64_decode(I('post.password'));
        $repassword = base64_decode(I('post.repassword'));
        
        if(!openssl_private_decrypt($password, $password_dec, $private_key, OPENSSL_PKCS1_PADDING)){
            $this->ajaxReturn(['status'=>'error', 'info'=>_('密码解码失败，请检查您的网络链接或与网站管理员联系')]);
            exit;
        }
        if(!openssl_private_decrypt($repassword, $repassword_dec, $private_key, OPENSSL_PKCS1_PADDING)){
            $this->ajaxReturn(['status'=>'error', 'info'=>_('重复密码解码失败，请检查您的网络链接')]);
            exit;
        }
        if($password_dec != $repassword_dec){
            $this->ajaxReturn(['status'=>'error', 'info'=>_('密码和重复密码不相同')]);
            exit;
        }
        if(strlen($password_dec) < 6){
            $this->ajaxReturn(['status'=>'error', 'info'=>_('密码不能小于6位')]);
            exit;
        }
        $salt = bin2hex(openssl_random_pseudo_bytes(64));
        $ret = M('user')->where(['uid'=>$verify['uid']])->save(array('password'=>password($password_dec, $salt)));
        $userinfo = M('user')->where(array('uid'=>$verify['uid']))->find();
        
        M('salt')->salt = $salt;
        M('salt')->where(array('uid'=>$userinfo['uid']))->save();
        
        if($ret == 1){
            $this->assign('username', $userinfo['username']);
            $this->assign('ip', get_client_ip().' | '.resolve_ip(get_client_ip()));
            send_mail($userinfo['email'], _('密码重置成功').' - '.C('SITE_NAME'), $this->fetch('Email/resetPassword'));
            D('Ip')->saveIp($userinfo['uid'], _('重置登录密码'));
            $this->ajaxReturn(array('status'=>'success', 'info'=>_('密码修改成功，请使用新密码登录！')));
        }
        else
            $this->ajaxReturn(array('status'=>'error','info'=>_('未知错误，可能是用户不存在或新密码与原密码相同')));
        
    }
    
    public function tos(){
        $tos = M('announcement')->where(array('item'=>'TOS'))->select()[0]['text'];
        $this->show($tos);
    }

}