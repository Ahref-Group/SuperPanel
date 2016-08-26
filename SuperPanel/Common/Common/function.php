<?php

function jump($location){
    echo '<script>setTimeout("window.location.href=\\"'.C('SITE_URL').$location.'\\"",300);</script>';
}

function password($password, $salt){
    return hash(C('ENCRYPTION_METHOD'), $password.$salt);
}

function send_mail($sendto, $subject, $body, $altbody = 'Please use a client that supports HTML to read the mail'){
    vendor('PHPMailer.PHPMailerAutoload');
    
    $mail = new \PHPMailer();
    
    $mail->IsSMTP();
    
    $mail->Host = C('SMTP_HOST');
    $mail->CharSet = "UTF-8";
    $mail->Encoding = "base64";
    $mail->Host = C('SMTP_HOST');
    $mail->SMTPAuth = true;
    $mail->Username = C('SMTP_USER');
    $mail->Password = C('SMTP_PASSWORD');
    $mail->SMTPSecure = C('SMTP_PROTOCOL');
    $mail->Port = C('SMTP_PORT');
	$mail->setFrom(C('MAIL_ADDRESS'),C('MAIL_NAME'));
	$mail->addAddress($sendto);
	
	$mail->IsHTML(true);
	$mail->Subject = $subject;
	$mail->Body = $body;
	$mail->AltBody = $altbody;
	
	if(!$mail->send()) {
    return $mail->ErrorInfo;
    } else {
    return 0;
    }

}


function urlsafe_b64encode($string) {
   $data = base64_encode($string);
   $data = str_replace(array('+','/','='),array('-','_',''),$data);
   return $data;
}

function urlsafe_b64decode($string) {
   $data = str_replace(array('-','_'),array('+','/'),$string);
   $mod4 = strlen($data) % 4;
   if ($mod4) {
       $data .= substr('====', $mod4);
   }
   return base64_decode($data);
}

function generate_verify_url($uid, $location, $expiration, $operation){
    $expiration = time()+$expiration;
    $token = hash('md4', rand().$uid.$expiration);
    M('token')->add(array('uid'=>$uid, 'token'=>$token, 'expiration'=>$expiration, 
        'operation'=>$operation), $options=array(),$replace=true);
    
    return C('SITE_URL').U($location, array('n'=>urlsafe_b64encode($uid),'token'=>$token));
}

function verify_url(){
    $token = I('get.token');
    $uid = urlsafe_b64decode(I('get.n'));
    //var_dump($username);
    
    $token_info = M('token')->where(array('uid'=>$uid, 'token'=>$token))->find();
    //var_dump($token_info);
    if($token_info){
        //删除token
        M('token')->delete($token_info['tid']);
        if($token_info['expiration'] > time())
            return array('operation'=>$token_info['operation'], 'uid'=>$uid);
    }
    return false;
}



function isLogined(){
    if(cookie('email')){
        $email = cookie('email');
        $code = cookie('code');
        $expiration = cookie('expiration');
        
        $userinfo = M('user')->where(array('email' => $email))->find();
        if($userinfo){
            if(password_verify($email.$expiration.$userinfo['password'],$code)){
                if(time() < $expiration)
                    return $userinfo;
            }
            return 1;
        }
        
    }
        return 0;
}

function isAdmin(){
    $userinfo = isLogined();
    if(count($userinfo)<2){
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
            
    }else{
        //用户已登录，现在检查管理员权限
        $admin = M('admin')->where(['uid'=>$userinfo['uid']])->find();
        if(empty($admin)){
            //为空说明不是管理员
            jump(U('Home/User/index'));
            exit;
        }else{
            $userinfo['permission'] = explode(',', $admin['permission']);
            return $userinfo;
        }
    }
}

function login($email, $password, $remember=false){
    $ret = D('User')->login($email, $password);
    if($ret == false){
        return false;
    }
    
    cookie('email', $email, 86400*365);
    if($remember == 'true'){
        $expiration = time() + 7*86400;
        $code = password_hash($email.$expiration.$ret, PASSWORD_BCRYPT,['cost' => 5]);
        cookie('code', $code, 86400*7);
    }
    else{
        $expiration = time() + 86400;
        $code = password_hash($email.$expiration.$ret, PASSWORD_BCRYPT,['cost' => 5]);
        cookie('code', $code);
    }
    cookie('expiration', $expiration);
        
    return true;
}

function resolve_ip($ip){
    //返回ip对应的地址
    if(C('IP_MODE') == 'taobao'){
        
        $output = json_decode(file_get_contents('http://ip.taobao.com/service/getIpInfo.php?ip='.$ip), true);
        if($output['code'] == 0){
            return $output['data']['country'].' '.$output['data']['region'].' '.$output['data']['city'].' '.$output['data']['isp'];
        }
        else{
            return _('查询失败');
        }
    }elseif(C('IP_MODE') == 'ipip'){
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, "http://ipapi.ipip.net/find?addr=".$ip);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Token:'.C('IPIP_TOKEN')));
        
        $output = json_decode(curl_exec($ch), true);
        if($output['ret'] == 'ok'){
            $info = $output['data'][0].' '.$output['data'][1].' '.$output['data'][2].' '.$output['data'][3].
            ' '.$output['data'][4];
        }
        else 
            $info = _('查询失败').$output['msg'];
        return $info;
    }else{
        return _('不支持的接口类型');
    }
}


function exec_command($commands, $userinfo){
    foreach($commands as $command){
        $operator_location = strcspn($command, '+-=');      //查找命令操作符的位置
        $obj = substr($command, 0, $operator_location);     //取出操作对象
        $operator = substr($command, $operator_location, 1);//取出操作符
        $operation = substr($command, $operator_location+1);//最后剩下的自然就是操作了
        
        $User = M('user');
        switch($obj){
            case 'port':{
                if($operator == '='){
                    if($User->where(['port'=>intval($operation)])->count()) //判断端口是否已被使用
                        return false;
                    $User->where(['uid'=>$userinfo['uid']])->setField('port', intval($operation));
                    return true;
                }
            }
            case 'group_expiration':{
                if($operator != '+')
                    return false;
                
                $operations = explode(':', $operation);
                
                if(empty($operations[0]) || empty($operations[1]))
                    return false;
                    
                $operations[0] = intval($operations[0]);
                $operations[1] = intval($operations[1]);        //强制类型转换，提高安全性
                
                //检查组是否存在
                if(0 == M('group')->where(['gid'=>$operations[0]])->count())
                    return false;
                
                if(0 == M('user_group')->where(['uid'=>$userinfo['uid'], 'group'=>$operation[0]])->count()){
                    //用户不在该组就先将其添加到该组
                    $groups = explode(',', $userinfo['plan']);
                    if(!in_array($operations[0])){
                        //如果用户在购买时不属于任何组，explode也会返回一个数组，其第一个元素为空字符串
                        //这种情况下，为了避免空字符串再次被打包，就需要判断一下是否为空
                        if(empty($groups[0]))
                            $groups[0] = $operations[0];
                        else
                            $groups[] = $operations[0];
                            
                        $User->uid = $userinfo['uid'];
                        $User->plan = implode(',', $groups);
                        $User->save();          //更新user表中的group
                    }
                    $data['uid']=$userinfo['uid'];
                    $data['group'] = $operations[0];
                    $data['expiration'] = time() + $operations[1];
                    
                    M('user_group')->add($data);
                }
                else
                    M('user_group')->where(['uid'=>$userinfo['uid'], 'group'=>$operations[0]])->setInc('expiration',$operations[1]);
                return true;
            }
            case 'group_transfer':{
                $operations = explode(':', $operation);
                
                if(empty($operations[0]) || empty($operations[1]))
                    return false;
                    
                $operations[0] = intval($operations[0]);
                $operations[1] = intval($operations[1]);        //强制类型转换，提高安全性
                
                //检查组是否存在
                if(0 == M('group')->where(['gid'=>$operations[0]])->count())
                    return false;
                
                if(0 == M('user_group')->where(['uid'=>$userinfo['uid'], 'group'=>$operation[0]])->count()){
                    //用户不在该组就先将其添加到该组
                    $groups = explode(',', $userinfo['plan']);
                    if(!in_array($operations[0])){
                        
                        //如果用户在购买时不属于任何组，explode也会返回一个数组，其第一个元素为空字符串
                        //这种情况下，为了避免空字符串再次被打包，就需要判断一下是否为空
                        if(empty($groups[0]))
                            $groups[0] = $operations[0];
                        else
                            $groups[] = $operations[0];
                        $User->uid = $userinfo['uid'];
                        $User->plan = implode(',', $groups);
                        $User->save();          //更新user表中的group
                    }
                    $data['uid']=$userinfo['uid'];
                    $data['group'] = $operations[0];
                    $data['transfer_enable'] = $operations[1];
                    
                    M('user_group')->add($data);
                }
                else
                    M('user_group')->where(['uid'=>$userinfo['uid'], 'group'=>$operations[0]])->setInc('transfer_enable',$operations[1]);
                return true;
            }
        }
    }
}
