<!DOCTYPE html>
<html lang="en_US" >

<head style="background-image:url(__PUBLIC__/bootstrap/img/bg.jpeg); background-size:cover; ;background-position:center; min-height:auto">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><{$site_name}> - <?php echo _('登录');?></title>

    <!-- Bootstrap Core CSS -->
    <link href="__PUBLIC__/bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="__PUBLIC__/bootstrap/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="__PUBLIC__/bootstrap/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="__PUBLIC__/bootstrap/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <!-- jquery-confirm CSS -->
    <link href="__PUBLIC__/bootstrap/vendor/jquery-confirm/jquery-confirm.min.css" rel="stylesheet" type="text/css">
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body style="background-image:url(__PUBLIC__/bootstrap/img/bg.jpeg); background-size:cover; min-height:auto">

    <div class="container center" style="opacity: 0.8;">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><?php echo _('登录');?><{$site_name}></h3>
                    </div>
                    <div class="panel-body">
                        <form role="form">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" id="email" placeholder="<?php echo _('邮箱');?>" name="email" type="email" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" id="password" placeholder="<?php echo _('密码');?>" name="password" type="password" value="">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember-me" id="remember-me" type="checkbox" value="Remember Me"><?php echo _('记住我七天');?>
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <a href="javascript:;" class="btn btn-lg btn-success btn-block" id="login"><?php echo _('登录');?></a>
                            </fieldset>
                        </form>
                        <div class="pull-left">
                            <a class="btn btn-link" href="<{:U("Home/Auth/register")}>">注册账号</a>
                        </div>
                        <div class="pull-right">
                            <a class="btn btn-link" href="<{:U("Home/Auth/forgetPassword")}>">忘记密码</a>
                        </div>
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

$('#login').click(function(){
        login();
    });
    
    function login(){
        var loading = $.dialog({
			    title:"登录中，请稍后",
			    content:'<p class="text-center"><i class="fa fa-circle-o-notch fa-spin fa-4x" aria-hidden="true"></i></p>',
			    closeAnimation: 'right',
			    });
			    
        password = $('#password').val();
        password = cmdEncryptClick(password);
        $.post("<{:U('Home/AuthAction/login')}>", { email: $('#email').val(), 'password': password,'remember':$('#remember-me').is(':checked')},
        
        function(data){
            loading.close();
            if(data['status'] == 'success'){
                $.alert({
				        title:"登录成功！",
				        confirmButtonClass:"btn-success",
				        confirmButton: '我知道了！',
				        content:data['info'],
				        animation: 'left',
				        autoClose: 'confirm|3000',
				        confirm:function(){location.href='<{:U('Home/User/index')}>'}
				        });
            }
            else {
                $.alert({
				    confirmButtonClass:"btn-danger",
				    confirmButton: '我知道了！',
				    title:"出现问题",
				    content:data['info']
				    });
            };
        });
    };
    $("#password").keydown(function(event){
        if(event.keyCode==13){
            login();
        }
    });
    
</script>
</body>

</html>
