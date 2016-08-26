<?php

if(empty($_POST['sign'])){
$t = microtime(1)+0.3;
if(empty($_COOKIE['t'])||empty($_COOKIE['v'])){
    die('<script>document.cookie="t="+"'.$t.
     '";document.cookie="v="+"'.hash('md4', $t.'prss').'";setTimeout("window.location.reload()",500);  </script>');
}else{
    if(hash('md4',$_COOKIE['t'].'prss')== $_COOKIE['v'])
    {
        if(microtime(1) < $_COOKIE['t']){
            header("Content-type:text/html;charset=utf-8");
            die('访问太频繁了哦');
        }
            
    }
    else{
        header("HTTP/1.1 500 Internal Server Error");
        die('<h1>500 Internal Server Error</h1>');
    }
}
$t = microtime(1)+0.3;
setcookie('v',hash('md4',$t.'prss'));
setcookie('t',$t);
}
const GETTEXT_PACKAGE = 'lang';
if (isset($_COOKIE['locale']))
    $arg_locale = $_COOKIE['locale'];
else{
    $arg_locale = 'zh_CN';
    setcookie('locale', $arg_locale);
}
    


$possible_locale_name_list = array(
    $arg_locale . '.utf8', $arg_locale
);

if (PHP_VERSION_ID >= 40300) {
    $result = setlocale(LC_MESSAGES, $possible_locale_name_list);
}
else {
    foreach ($possible_locale_name_list as $l) {
        $result = setlocale(LC_MESSAGES, $l);
        if ($result)
            break;
    }
}
bindtextdomain(GETTEXT_PACKAGE, './locale'); //国际化语言包存放路径
textdomain(GETTEXT_PACKAGE); //语言包的文件名
bind_textdomain_codeset(GETTEXT_PACKAGE, 'utf-8');


// 开启调试模式 建议开发阶段开启 部署阶段注释或者设为false
define('APP_DEBUG',True);

// 定义应用目录
define('APP_PATH','./SuperPanel/');

// 引入ThinkPHP入口文件
require './ThinkPHP/ThinkPHP.php';