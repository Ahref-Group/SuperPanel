<!DOCTYPE html>
<!-- metheno 操了垃圾macOS。ps. 这只是一个页面 没有任何-->
<html lang="zh-cn">
    <head>
        <title>找回密码 - <{$site_name}></title>
        <include file="Public/source" />
        <!-- 页面所需特殊CSS和JS -->
        <include file="source" />  
    </head>

    <body class="cyan">
        <include file="Public/pageloading" />
        <div id="login-page" class="row">
            <div class="col s12 z-depth-4 card-panel">
                <form class="login-form">
                    <div class="row">
                        <div class="input-field col s12 center">
                            <h4>找回密码</h4>
                            <p class="center">找回在 <{$site_name}> 注册时用的密码</p>
                        </div>
                    </div>
                    <div class="row margin hiden">
                        <div class="input-field col s12">
                            <i class="mdi-communication-email prefix"></i>
                            <input id="email" type="email">
                            <label for="email" class="center-align">邮箱&nbsp;Email</label>
                        </div>
                    </div>
                    <div id="alert" class="card cyan lighten-5" style="display:none;">
                        <div class="card-content cyan-text darken-1">
                            <span class="card-title cyan-text darken-1">提示&nbsp;<small>Notice</small></span>
                            <p id="msg"></p>
                        </div>
                    </div>
                    <div class="center"><include file="Public/loading" /></div>
                    <div class="row hiden">
                        <div class="input-field col s12">
                            <a href="javascript:void(0)" class="btn waves-effect col s12" id="forget_password">找回密码</a>
                        </div>
                        <div class="input-field col s12">
                            <p class="margin center medium-small sign-up">想起来了？<a href="<{:U('Home/Auth/login')}>">登录</a></p>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
    
    <script>
        $('#forget_password').click(function(){
            $('.loading').show();
            $('#alert').hide();
            $('.hiden').hide();
            forgetcheck();
        });

        function forgetcheck(){
            
            if(($("#email").val()).length==0){
                $("#alert").show();
                $('.hiden').show();
                $(".loading").hide();
                $("#msg").html("请填写邮箱!");
                msg_id=1;
                return false;
            }
            var email_reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
            if(!email_reg.test($("#email").val())) {
                $("#alert").show();
                $('.hiden').show();
                $(".loading").hide();
                $("#msg").html("邮箱格式错误!");
                msg_id=1;
                return false;
            }
            send();
            $('.hiden').show();
        }
        function send(){
            $.post("<{:U('Home/Auth/forget_password_action')}>", {
                email:$("#email").val()},
                function(data){
                    $(".loading").hide();
                    if (data['status'] == 'success') {
					    swal({
					        title: "成功！",
                            text: data['info'],   
                            type: "success",
                            html: true 
                        });
					    $("#alert").hide();
				    } else {
				        swal({
					        title: "出现问题！",
                            text: data['info'],   
                            type: "error",
                            html: true 
                        });
					    $("#alert").show();
					    $("#msg").html(data['info']);
				    }
				}
            );
                
        }
    </script>
</html>
            
            