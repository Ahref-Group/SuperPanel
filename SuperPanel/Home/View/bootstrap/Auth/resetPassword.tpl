<!DOCTYPE html>
<html lang="en_US" >

<head style="background-image:url(__PUBLIC__/bootstrap/img/bg.jpeg); background-size:cover; ;background-position:center; min-height:auto">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><{$site_name}> - <?php echo _('重置密码');?></title>

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
                        <h3 class="panel-title"><?php echo _('重置密码');?><{$site_name}></h3>
                    </div>
                    <div class="panel-body">
                        <form role="form">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" id="password" placeholder="<?php echo _('密码');?>" name="password" type="password" value="">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" id="repassword" placeholder="<?php echo _('重复密码');?>" name="password" type="password" value="">
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <a href="javascript:;" class="btn btn-lg btn-success btn-block" id="reset"><?php echo _('重置密码');?></a>
                            </fieldset>
                        </form>
                        <div class="pull-left">
                            <a class="btn btn-link" href="<{:U("Home/Auth/login")}>">登录</a>
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

$('#reset').click(function(){
        reset();
    });
    
    function reset(){
        var loading = $.dialog({
			    title:"重置中，请稍后",
			    content:'<p class="text-center"><i class="fa fa-circle-o-notch fa-spin fa-4x" aria-hidden="true"></i></p>',
			    closeAnimation: 'right',
			    });
			    
        password = $('#password').val();
        repassword = $('#repassword').val();
        password = cmdEncryptClick(password);
        repassword = cmdEncryptClick(repassword);
        
        $.post("<{$url}>", {repassword:repassword, 'password': password},
        
        function(data){
            loading.close();
            if(data['status'] == 'success'){
                $.alert({
				        title:"成功！",
				        confirmButtonClass:"btn-success",
				        confirmButton: '好的！',
				        content:data['info'],
				        animation: 'left',
				        autoClose: 'confirm|3000',
				        confirm:function(){location.href='<{:U('Home/Auth/login')}>'}
				        });
            }
            else {
                $.alert({
				    confirmButtonClass:"btn-danger",
				    confirmButton: '我知道了！',
				    title:"重置失败",
				    content:data['info']
				    });
            };
        });
    };
    $("#repassword").keydown(function(event){
        if(event.keyCode==13){
            reset();
        }
    });
    
</script>
</body>

</html>
