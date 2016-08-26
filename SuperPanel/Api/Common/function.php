<?php

function spay_alipay_notify_verify($key) {//异步验证函数
    if (strstr(file_get_contents("http://www.dayyun.com/spaymq.php/Napi/api/?service=notify_verify&notify_id=".$_POST["notify_id"]), "true")===false) return false;// 二次验证 注释此行可关闭二次验证
    $i=0;$jk='';
    $data= $_POST;
    ksort($data);
    reset($data);
    $sign=$data['sign'];
    unset($data['sign']);
    unset($data['sign_type']);
    $ii=count($data);
    foreach($data as $as1=>$as2){$i++;$jk .= $as1."=".$as2;if($ii!=$i)$jk .="&";}
    $newsign=md5($jk.$key);
    if ($newsign == $sign)  return true;
    return false;
}
?>