<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<title><?php echo _('注册');?> - <{$site_name}></title>
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
							<h4><?php echo _('注册');?></h4>
							<p class="center"><{$site_name}><?php echo _('欢迎喵~');?></p></div>
					</div>
					<div class="row margin">
						<div class="input-field col s12">
							<i class="mdi-social-person-outline prefix"></i>
							<input id="username" type="text">
							<label for="username" class="center-align"><?php echo _('用户名');?></label>
						</div>
					</div>
					<div class="row margin">
						<div class="input-field col s12">
							<i class="mdi-communication-email prefix"></i>
							<input id="email" type="email">
							<label for="email" class="center-align"><?php echo _('邮箱');?></label>
						</div>
					</div>
					<div class="row margin">
						<div class="input-field col s12">
							<i class="mdi-action-lock-outline prefix"></i>
							<input id="password" type="password">
							<label for="password"><?php echo _('密码');?></label>
						</div>
					</div>
					<div class="row margin">
						<div class="input-field col s12">
							<i class="mdi-action-lock-outline prefix"></i>
							<input id="repassword" type="password">
							<label for="repassword"><?php echo _('重复密码');?></label>
						</div>
					</div>
					<eq name="require_invite_code" value="1">
					<div class="row margin">
						<div class="input-field col s12">
							<i class="material-icons outline prefix">pets</i>
							<input id="invite_code" type="text" value="<{$invite_code}>">
							<label for="invite_code" class="center-align"><?php echo _('邀请码');?></label>
						</div>
					</div>
					</eq>
					<div id="alert" class="card cyan lighten-5" style="display:none;">
						<div class="card-content cyan-text darken-1">
							<span class="card-title cyan-text darken-1"><?php echo _('提示');?></span>
							<p id="msg"></p>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12">
							<a href="#" class="btn waves-effect waves-light col s12" id="register"><?php echo _('注册');?></a>
						</div>
						<div class="input-field col s12">
							<p class="margin center medium-small sign-up"><?php echo _('已有账户？');?><a href="<{:U('Home/Auth/login')}>"><?php echo _('登录！');?></a></p>
						</div>
					</div>
				</form>
			</div>
		</div>
	</body>
	<script src="__PUBLIC__/js/rsa/BigInt.js"></script>
	<script src="__PUBLIC__/js/rsa/Barrett.js"></script>
	<script src="__PUBLIC__/js/rsa/RSA.js"></script>
    <script src="__PUBLIC__/js/rsa/password.js"></script>
	<script>
    var public_key = "<{:C('PUBLIC_KEY')}>";

		$('#register').click(function() {
			registercheck();
		});

		function registercheck() {
			$("#loading").hide();
			if (($("#username").val()).length < 7) {
				$("#alert").show();
				$("#msg").html("<?php echo _('用户名需要大于7位');?>");
				msg_id = 1;
				return false;
			}
			if (($("#email").val()).length = 0) {
				$("#alert").show();
				$("#msg").html("<?php echo _('喂喂喂，邮箱呢！');?>");
				msg_id = 1;
				return false;
			}
			var email_reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
			if (!email_reg.test($("#email").val())) {
				$("#alert").show();
				$("#msg").html("<?php echo _('吃货！这不是邮箱！');?>");
				msg_id = 1;
				return false;
			}
			if (($("#password").val()).length == 0) {
				$("#alert").show();
				$("#msg").html("<?php echo _('啊啊啊！密码呢！');?>");
				msg_id = 1;
				return false;
			}
			if (($("#password").val()).length < 8) {
				id_name = "#password";
				$("#alert").show();
				$("#msg").html("<?php echo _('嗨，密码长一点能忘啊！');?>");
				msg_id = 1;
				return false;
			}
			if (($("#repassword").val()).length == 0) {
				id_name = "#repassword";
				$("#alert").show();
				$("#msg").html("<?php echo _('重复输一遍密码啊喂！');?>");
				msg_id = 1;
				return false;
			}
			if ($("#password").val() != $("#repassword").val()) {
				$("#alert").show();
				$("#msg").html("<?php echo _('吃货！两次密码不一样');?>");
				msg_id = 1;
				return false;
			}
			<eq name="require_invite_code" value="1">
			if ($("#invite_code").val().length == 0) {
				id_name = "#invite_code";
				$("#alert").show();
				$("#msg").html("<?php echo _('哼！我要看邀请码！');?>");
				msg_id = 1;
				return false;
			}
			</eq>
		    swal({title: "请阅读<{$site_name}>的TOS",   
                text: "Balabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabalabala",   
                type: "info",   showCancelButton: true,   
                closeOnConfirm: false,   
                showLoaderOnConfirm: true, }, 
                function(){   
                    register();
                }
            );
        }
		function register() {
			password = $('#password').val();
			password = cmdEncryptClick(password);

			repassword = $('#repassword').val();
			repassword = cmdEncryptClick(repassword);

			$.post("<{:U('Home/Auth/register_action')}>", {
				username: $('#username').val(),
				'password': password,
				email: $('#email').val(),
				repassword: repassword<eq name="require_invite_code" value="1">,
				invite_code: $('#invite_code').val()</eq>
			},

			function(data) {
				$('.loading').hide();
				if (data['status'] == 'success') {
					swal({
					    title: "<?php echo _('注册成功！');?>",
                        text: data['info'],   
                        type: "success",
                        html: true 
                    });
					$("#alert").hide();
					window.setTimeout("location.href='<{:U('Home/Auth/login')}>'", 2000);
				} else {
				    swal({
					    title: "<?php echo _('出现问题！');?>",
                        text: data['info'],   
                        type: "error",
                        html: true 
                    });
					$("#alert").show();
					$("#msg").html(data['info']);
					$('.hiden').show();
				}
			});
		}
	</script>
</html>