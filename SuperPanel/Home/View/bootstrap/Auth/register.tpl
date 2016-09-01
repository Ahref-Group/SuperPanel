<!DOCTYPE html>
<html lang="en_US">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><{$site_name}> - <?php echo _('注册');?></title>

    <include file="Home@bootstrap/User/head" />

</head>

<body style="background-image:url(__PUBLIC__/bootstrap/img/bg.jpeg); background-size:cover;  ">

    <div class="container" style="opacity: 0.8;">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><?php echo _('注册');?> <{$site_name}></h3>
                    </div>
                    <div class="panel-body">
                        <form role="form">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="<?php echo _('用户名');?>" id="username" name="username" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="<?php echo _('邮箱');?>" id="email" name="email" type="email">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="<?php echo _('密码');?>" id="password" name="password" type="password">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="<?php echo _('重复密码');?>" id="repassword" name="repassword" type="password">
                                </div>
                                <eq name="require_invite_code" value="1">
                                <div class="form-group">
                                    <input class="form-control" placeholder="<?php echo _('邀请码');?>" id="invite_code" name="invite_code" type="text" value="<{$invite_code}>">
                                </div>
                                </eq>
                                <!-- Change this to a button or input when using this as a form -->
                                <a href="javascript:;" class="btn btn-lg btn-success btn-block" id="register"><?php echo _('注册');?></a>
                            </fieldset>
                        </form>
                        <div class="pull-left">
                            <a href="<{:U('Home/Auth/login')}>" class="btn btn-link">已有账号？登录</a>
                        </div>
                        <eq name="require_invite_code" value="1">
                        <div class="pull-right">
                            <a href="<{:U('Home/Index/inviteCode')}>" class="btn btn-link">公共邀请码</a>
                        </div>
                        </eq>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <include file="Home@bootstrap/User/js" />

    <script src="__PUBLIC__/js/rsa/BigInt.js"></script>
	<script src="__PUBLIC__/js/rsa/Barrett.js"></script>
	<script src="__PUBLIC__/js/rsa/RSA.js"></script>
    <script src="__PUBLIC__/js/rsa/password.js"></script>
	<script>
	var public_key = "<{:C('PUBLIC_KEY')}>";
	$(document).ready(function(){
	    $('input').change(function(){$(this).parent().removeClass("has-error")});
	    })

		$('#register').click(function() {
			registercheck();
		});

		function registercheck() {
			if (($("#username").val()).length < 7) {
				$.alert({title:"错误",content:"<?php echo _('用户名需要大于7位');?>",confirmButton:"知道了",confirmButtonClass:'btn-danger',
				    confirm:function(){$("#username").parent().addClass("has-error");}});
				msg_id = 1;
				return false;
			}
			if (($("#email").val()).length == 0) {
				$.alert({title:"错误",content:"<?php echo _('喂喂喂，邮箱呢！');?>",confirmButton:"知道了",confirmButtonClass:'btn-danger',
				    confirm:function(){$("#email").parent().addClass("has-error");}});
				msg_id = 1;
				return false;
			}
			var email_reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
			if (!email_reg.test($("#email").val())) {
				$.alert({title:"错误",content:"<?php echo _('吃货！这不是邮箱！');?>",confirmButton:"知道了",confirmButtonClass:'btn-danger',
				    confirm:function(){$("#email").parent().addClass("has-error");}});
				msg_id = 1;
				return false;
			}
			if (($("#password").val()).length == 0) {
				$.alert({title:"错误",content:"<?php echo _('啊啊啊！密码呢！');?>",confirmButton:"知道了",confirmButtonClass:'btn-danger',
				    confirm:function(){$("#password").parent().addClass("has-error");}});
				msg_id = 1;
				return false;
			}
			if (($("#password").val()).length < 8) {
				$.alert({title:"错误",content:"<?php echo _('嗨，密码长一点能忘啊！');?>",confirmButton:"知道了",confirmButtonClass:'btn-danger',
				    confirm:function(){$("#password").parent().addClass("has-error");}});
				msg_id = 1;
				return false;
			}
			if (($("#repassword").val()).length == 0) {
				$.alert({title:"错误",content:"<?php echo _('重复输一遍密码啊喂！');?>",confirmButton:"知道了",confirmButtonClass:'btn-danger',
				    confirm:function(){$("#repassword").parent().addClass("has-error");}});
				msg_id = 1;
				return false;
			}
			if ($("#password").val() != $("#repassword").val()) {
				$.alert({title:"错误",content:"<?php echo _('吃货！两次密码不一样');?>",confirmButton:"知道了",confirmButtonClass:'btn-danger',
				    confirm:function(){$("#repassword").parent().addClass("has-error");}});
				msg_id = 1;
				return false;
			}
			<eq name="require_invite_code" value="1">
			if ($("#invite_code").val().length == 0) {
				$.alert({title:"错误",content:"<?php echo _('哼！我要看邀请码！');?>",confirmButton:"知道了",confirmButtonClass:'btn-danger',
				    confirm:function(){$("#invite_code").parent().addClass("has-error");}});
				msg_id = 1;
				return false;
			}
			</eq>
			$.confirm({
                content: 'url:<{:U("Home/Auth/tos")}>',
                title: '请阅读<{$site_name}>的TOS',
                confirmButtonClass:"btn-success",
                cancelButtonClass:'btn-danger',
                confirmButton:'我同意',
                cancelButton: '我才不同意呢！',
                animation:'bottom',
                confirm:function(){
                    register();
                },
                cancel:function(){
                    $.alert({
                        content:"不同意你就哪儿凉快哪儿呆着吧！",
                        confirmButton:'知道了'
                        });
                }
            });
			
			
                
        }
		function register() {
			password = $('#password').val();
			password = cmdEncryptClick(password);

			repassword = $('#repassword').val();
			repassword = cmdEncryptClick(repassword);
			
			var loading = $.dialog({
			    title:"注册中，请稍后",
			    content:'<p class="text-center"><i class="fa fa-spinner fa-spin fa-4x" aria-hidden="true"></i></p>'
			    });
			
			
			$.post("<{:U('Home/AuthAction/register')}>", {
				username: $('#username').val(),
				'password': password,
				email: $('#email').val(),
				repassword: repassword<eq name="require_invite_code" value="1">,
				invite_code: $('#invite_code').val()</eq>
			},

			function(data) {
			    loading.close();
				if (data['status'] == 'success') {
					$.alert({
				        title:"注册成功！",
				        confirmButtonClass:"btn-success",
				        confirmButton: '我知道了！',
				        content:data['info'],
				        autoClose: 'confirm|5000',
				        confirm:function(){location.href='<{:U('Home/Auth/login')}>'}
				        });
				} else {
				    $.alert({
				        confirmButtonClass:"btn-danger",
				        confirmButton: '我知道了！',
				        title:"出现问题",
				        content:data['info']
				        });
				}
			});
		}
	</script>
	
</body>

</html>
