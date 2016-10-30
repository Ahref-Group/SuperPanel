<!DOCTYPE html>
<html lang="zh-cn">
    <head>
        <title>登录 - <{$site_name}></title>
        <include file="Home@MaterializeAdmin/Public/source" />
        <!-- 页面所需特殊CSS和JS -->
        <include file="Home@MaterializeAdmin/User/source" />  
    </head>
    <body class="cyan">
        <include file="Home@MaterializeAdmin/Public/pageloading" />
        <div id="login-page" class="row">
            <div class="">
                <div class="card-panel">
                    <form class="login-form">
                        <div class="rowhiden">
                            <div class="input-field col s12 center">
                                <a href="<{:U('Home/Index/index')}>"><img src="__PUBLIC__/MaterializeAdmin/images/Ahref.jpg" alt="" class="circle responsive-img valign profile-image-login"></a>
                                <p class="center login-form-text"><?php echo _('您正在登录');?><{$site_name}></p>
                            </div>
                        </div>
                        <div class="row margin hiden">
                            <div class="input-field col s12">
                                <i class="mdi-social-person-outline prefix"></i>
                                <input id="email" type="text">
                                <label for="email" class="center-align"><?php echo _('邮箱');?></label>
                            </div>
                        </div>
                        <div class="row margin hiden">
                            <div class="input-field col s12">
                                <i class="mdi-action-lock-outline prefix"></i>
                                <input id="password" type="password">
                                <label for="password"><?php echo _('密码');?></label>
                            </div>
                        </div>
                        <div class="row hiden">
                            <div class="input-field col s12 m12 l12  login-text">
                                <input type="checkbox" id="remember-me" />
                                <label for="remember-me"><small><?php echo _('记住我七天');?></small></label>
                            </div>
                        </div>
                        <div class="center"><include file="Public/loading" /></div>
                            <div id="alert" class="card cyan lighten-5" style="display:none;">
                                <div class="card-content cyan-text darken-1">
                                <span class="card-title cyan-text darken-1"><?php echo _('提示');?></span>
                                <p id="msg"></p>
                            </div>
                        </div>
                        <div class="row hiden">
                            <div class="input-field col s12">
                                <a href="#" class="btn waves-effect waves-light col s12" id="login"><?php echo _('登录');?></a>
                            </div>
                        </div>
                        <div class="row hiden">
                            <div class="input-field col s6 m6 l6 hiden">
                                <p class="margin medium-small"><a href="<{:U('Home/Auth/register')}>"><?php echo _('注册');?></a></p>
                            </div>
                            <div class="input-field col s6 m6 l6 hiden">
                                <p class="margin right-align medium-small"><a href="<{:U('Home/Auth/forget_password')}>"><?php echo _('忘记密码');?></a></p>
                            </div>          
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="__PUBLIC__/js/rsa/BigInt.js"></script>
        <script src="__PUBLIC__/js/rsa/Barrett.js"></script>
        <script src="__PUBLIC__/js/rsa/RSA.js"></script>
        <script src="__PUBLIC__/js/rsa/password.js"></script>
    </body>
<script>
var public_key = "<{:C('PUBLIC_KEY')}>";

$('#login').click(function(){
        login();
    });
    
    function login(){
        $('#alert').hide();
        $('.hiden').hide();
        $('.loading').show();
        password = $('#password').val();
        password = cmdEncryptClick(password);
        $.post("<{:U('Home/AuthAction/login')}>", { email: $('#email').val(), 'password': password,'remember':$('#remember-me').is(':checked')},
        
        function(data){
            $('.loading').hide();
            if(data['status'] == 'success'){
                $('#alert').hide();
                swal("<?php echo _('登录成功！');?>", "<?php echo _('本次登录IP:').$ip;?>", "success");
                window.setTimeout("location.href='<{:U('Home/User/index')}>'", 2000);
            }
            else {
                Materialize.toast("<?php echo _('登录失败！');?>", 3000, 'rounded');
                $('.hiden').show();
                $('#alert').show();
                $('#msg').html(data.info);
            };
        });
    };
    $("html").keydown(function(event){
        if(event.keyCode==13){
            login();
        }
    });
    
</script>
    
</html>