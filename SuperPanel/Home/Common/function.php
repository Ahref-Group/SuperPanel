<?php

function get_gravatar_url( $email = null, $s = 100, $d = 'mm', $r = 'g') {
    $url = 'https://gravatar.css.network/avatar/';
    $url .= md5( strtolower( trim( $email ) ) );
    $url .= "?s=$s&d=$d&r=$r";
    return $url;
}


function spay_alipay_return_verify($key) {//同步验证函数
    $i=0;$jk='';
    $data= $_GET;
    ksort($data);
    reset($data);
    $sign=$data['sign'];
    unset($data['sign']);
    unset($data['sign_type']);
    $ii=count($data);
    foreach($data as $as1=>$as2){$i++;$jk .= $as1."=".$as2;if($ii!=$i)$jk .="&";}
    $newsign=md5($jk.$key);
    //die($jk.$key);
    if (md5($jk.$key) == $sign)  return true;
    return false;
}

 
function spay_alipay_pay($data,$key) {//提交支付函数
    $i=0;$jk='';
    ksort($data);
    reset($data);
    $ii=count($data);
    foreach($data as $as1=>$as2){$i++;$jk .= $as1."=".$as2;if($ii!=$i)$jk .="&";}
    $data['sign']=md5($jk.$key);
    return "http://www.dayyun.com/spaymq.php/Napi/api/?".http_build_query($data);
    //header("Location: http://www.dayyun.com/spaymq.php/Napi/api/?".);
    //die('正在跳转中...');
}


?>