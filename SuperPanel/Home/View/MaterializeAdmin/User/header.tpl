<script>
$(document).ready(function(){
    $('.language-select').click(function(){
        $.cookie('locale', $(this).attr('id'), {expires: 3650});
        window.location.reload(1);
        })
    });


$(document).ready(function(){

        $('.exit').click(function(){
        swal({
        title: "<?php echo _('退出？');?>",   
        text: "<?php echo _('我们会清除Cookie和Session');?>",   
        type: "info",   showCancelButton: true,   
        closeOnConfirm: false,   
        showLoaderOnConfirm: true, }, 
        function(){   
            $.post("<{:U('Home/Auth/logout_action')}>",{},
                function(data) {
                    if (data['status'] == 'success') {
                        swal({
		                title: "<?php echo _('完成！');?>",
                        text: data['info'],   
                        type: "success",
                        html: true 
                        });
                        window.setTimeout("location.href='<{:U('Home/Auth/login')}>'", 2000);
                    }
                    else {
                    swal({
		                title: "<?php echo _('错误！');?>",
                        text: data['info'],   
                        type: "error",
                        html: true 
                        });
                    }
                });
                
            }
        );
    });});
</script>
<div class="navbar-fixed">
    <nav class="navbar-color" role="navigation">
        <div class="nav-wrapper container">
            <div class="col s12">
                <a href="<{:U('Home/Index/index')}>" class="brand-logo waves-effect" style="font-family: Orbitron;"><{$site_name}></a>
                <ul class="right hide-on-med-and-down">
                    <li><?php echo _('公告：');?> <{$announcement['head']}></li>
                    <li><a href="javascript:void(0);" class="waves-effect waves-block waves-light translation-button"  data-activates="translation-dropdown"><img src="__PUBLIC__/MaterializeAdmin/images/flag-icons/<?php echo empty($_COOKIE['locale'])?'zh_CN':$_COOKIE['locale'];?>.png" alt="Chinese" /></a>
                        </li>
                    <ul id="translation-dropdown" class="dropdown-content">
                      <li>
                        <a href="javascript:void(0)" ><img src="__PUBLIC__/MaterializeAdmin/images/flag-icons/zh_CN.png" alt="Chinese" /><span class="language-select" id="zh_CN">简体中文</span></a>
                      </li>
                      <li>
                        <a href="javascript:void(0)" ><img src="__PUBLIC__/MaterializeAdmin/images/flag-icons/zh_TW.png" alt="Hong-Kong" /><span class="language-select"  id="zh_TW">繁體中文</span></a>
                      </li>                      
                      <li>
                        <a href="javascript:void(0)" ><img src="__PUBLIC__/MaterializeAdmin/images/flag-icons/en_US.png" alt="English" /><span class="language-select" id="en_US">English</span></a>
                      </li>
                      <li>
                        <a href="javascript:void(0)" ><img src="__PUBLIC__/MaterializeAdmin/images/flag-icons/ja_JP.png" alt="Japan" /><span class="language-select" id="ja_JP">日本語</span></a>
                      </li>
                    </ul>
                    <li><a href="<{:U('Home/User/record')}>" class="waves-effect" ><?php echo _('访问IP：');?><{$ip}></a></li>
                    <li><a href="#" class="exit"><i class="material-icons left">close</i><?php echo _('退出');?></a></li>
                </ul>
                <ul id="nav-mobile" class="side-nav">
                    <li><a href="#"><?php echo _('公告：');?><{$announcement['head']}></a></li>
                    <li><a href="javascript:void(0);" class="waves-effect waves-block waves-light translation-button"  data-activates="translation-dropdown-m"><img src="__PUBLIC__/MaterializeAdmin/images/flag-icons/<?php echo empty($_COOKIE['locale'])?'zh_CN':$_COOKIE['locale'];?>.png"/></a>
                        </li>
                    <ul id="translation-dropdown-m" class="dropdown-content">
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
                    <li><a href="<{:U('Home/User/record')}>" class="waves-effect" ><?php echo _('访问IP：');?><{$ip}></a></li>
                    <li><a href="#" class="exit"><i class="material-icons left">close</i><?php echo _('退出');?></a></li>
                </ul>
                <a href="#" data-activates="nav-mobile" class="button-collapse right"><i class="material-icons">menu</i></a>
            </div>
        </div>
    </nav>
</div>
<script>
        (function($){
  $(function(){

    $('.button-collapse').sideNav();

  }); // end of document ready
})(jQuery); // end of jQuery name space
    </script>
