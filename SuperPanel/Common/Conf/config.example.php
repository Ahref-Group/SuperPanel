<?php
return array(
	'DEFAULT_THEME'=>'bootstrap',//默认主题
    'THEME_LIST'=>'bootstrap',//主题列表
    'TMPL_DETECT_THEME'=>true,//开启自动侦测模版主题
	
	
    //数据库配置信息
    'DB_TYPE'   => 'mysql', // 数据库类型
    'DB_HOST'   => '', // 服务器地址
    'DB_NAME'   => '', // 数据库名
    'DB_USER'   => '', // 用户名
    'DB_PWD'    => '', // 密码
    'DB_PORT'   => 3306, // 端口
    'DB_PREFIX' => '', // 数据库表前缀 没有请留空
    'DB_CHARSET'=> 'utf8', // 字符集
    'DB_DEBUG'  =>  TRUE, // 数据库调试模式 开启后可以记录SQL日志 3.2.3新增
    
    //URL模式
    'URL_MODEL' => 2,
    
	//配置发件人
    'MAIL_ADDRESS' => '',
    'MAIL_NAME' => '',
    
    //配置SMTP
    'SMTP_HOST' => '',
    'SMTP_PORT' => '',
    'SMTP_PROTOCOL' => '',
    'SMTP_USER' => '',
    'SMTP_PASSWORD' => '',
	
	/*  If you don't know WHAT YOU ARE DOING, DO NOT edit lines below!!!
	*   如果你不知道你在干什么，请勿修改以下内容
	*/
	
	//调试选项
	'SHOW_PAGE_TRACE' =>false, 
	
	//查询缓存时间
	'DATA_CACHE_TIME' => 60,
	'URL_HTML_SUFFIX'=>'py',
	
	//设置模板后缀
	'TMPL_TEMPLATE_SUFFIX' => '.tpl',
	
	//设置模板替换标签
	'TMPL_L_DELIM' => '<{',
    'TMPL_R_DELIM' => '}>',
);
