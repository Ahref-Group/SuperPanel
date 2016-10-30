    <!-- start header nav-->
	<nav class="navbar-color" role="navigation">
        <div class="nav-wrapper container">
            <div class="col s12">
                <a id="logo-container" href="#" class="brand-logo waves-effect" style="font-family: Orbitron;"><{$site_name}></a>
                <ul class="right hide-on-med-and-down">
					<li>
						<a href="<{:U('Home/Auth/login')}>" class="waves-effect"><i class="material-icons left">account_circle</i><?php echo _('登录');?></a>
					</li>
					<li><a href="<{:U('Home/Auth/register')}>" class="waves-effect"><i class="material-icons left">add</i>注册</a></li>
					<li><a href="javascript:void(0);" class="waves-effect waves-block waves-light translation-button"  data-activates="translation-dropdown"><img src="__PUBLIC__/MaterializeAdmin/images/flag-icons/<?php echo empty($_COOKIE['locale'])?'zh_CN':$_COOKIE['locale'];?>.png" alt="Chinese" /></a>
                        </li>
                    <ul id="translation-dropdown" class="dropdown-content">
                      <li>
                        <a href="javascript:void(0)" ><img src="__PUBLIC__/MaterializeAdmin/images/flag-icons/zh_CN.png" alt="Chinese" /><span class="language-select" id="zh_CN">简体中文</span></a>
                      </li>
                      <li>
                        <a href="javascript:void(0)" ><img src="__PUBLIC__/MaterializeAdmin/images/flag-icons/zh_TW.png" alt="Taiwan" /><span class="language-select"  id="zh_TW">繁體中文</span></a>
                      </li>                      
                      <li>
                        <a href="javascript:void(0)" ><img src="__PUBLIC__/MaterializeAdmin/images/flag-icons/en_US.png" alt="English" /><span class="language-select" id="en_US">English</span></a>
                      </li>
                      <li>
                        <a href="javascript:void(0)" ><img src="__PUBLIC__/MaterializeAdmin/images/flag-icons/ja_JP.png" alt="Japan" /><span class="language-select" id="ja_JP">日本語</span></a>
                      </li>
                    </ul>
					<li><a href="<{:U('Home/Index/invite_code')}>" class="waves-effect"><i class="material-icons left">adb</i><?php echo _('邀请码');?></a></li>
					<li><a href="#!" class="waves-effect"><i class="material-icons left">report_problem</i><?php echo _('用户协议');?></a></li>
					<li><a href="#!" class="waves-effect"><i class="material-icons left">info</i><?php echo _('关于 SuperPanel');?></a></li>
				</ul>
				<ul id="nav-mobile" class="side-nav">
				    <li>
						<a href="<{:U('Home/Auth/login')}>" class="waves-effect"><i class="material-icons left">account_circle</i><?php echo _('登录');?></a>
					</li>
					<li><a href="<{:U('Home/Auth/register')}>" class="waves-effect"><i class="material-icons left">add</i>注册</a></li>
					<li><a href="#!" class="waves-effect"><i class="material-icons left">adb</i><?php echo _('邀请码');?></a></li>
					<li><a href="#!" class="waves-effect"><i class="material-icons left">report_problem</i><?php echo _('用户协议');?></a></li>
					<li><a href="#!" class="waves-effect"><i class="material-icons left">info</i><?php echo _('关于 SuperPanel');?></a></li>
				</ul>
				<a href="#" data-activates="nav-mobile" class="button-collapse"><i class="material-icons">arrow_drop_down_circle</i></a>
            </div>
        </div>
    </nav>
	<!-- end header nav-->
	
	<style type="text/css">
	.flex-background{
	width: 100%;
	height: 100%;
	position: absolute;
	z-index: -1;
	background-image: url('__PUBLIC__/MaterializeAdmin/images/bg.jpg');
	background-size: cover;
	background-position: center;
    }
    </style>
    <script>
    $(document).ready(function(){
    $('.language-select').click(function(){
        $.cookie('locale', $(this).attr('id'), {expires: 3650});
        window.location.reload(1);
        })
    });
        (function($){
  $(function(){

    $('.button-collapse').sideNav();

  }); // end of document ready
})(jQuery); // end of jQuery name space
    </script>