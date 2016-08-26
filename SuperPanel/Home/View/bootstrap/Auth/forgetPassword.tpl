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
                                
                                <p class="text-center">输入您注册的邮箱，我们将向您的邮箱发送用于重置密码的链接</p>
                                <div class="form-group">
                                    <input class="form-control" id="email" placeholder="<?php echo _('邮箱');?>" name="email" type="email" value="">
                                </div>
                                <hr />
                                <!-- Change this to a button or input when using this as a form -->
                                <a href="javascript:;" class="btn btn-lg btn-success btn-block" id="send"><?php echo _('发送重置链接');?></a>
                            </fieldset>
                        </form>
                        <div class="pull-left">
                            <a class="btn btn-link" href="<{:U("Home/Auth/login")}>">登录</a>
                        </div>
                        <div class="pull-right">
                            <a class="btn btn-link">寻求帮助</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <include file="Home@bootstrap/User/js" />
    <script>
    
    $("#send").click(function(){
        send();
    });
    
    function send(){
        email = $("#email").val();
        $.post("<{:U('Home/Auth/forgetPassword')}>",{email:email},function(data){
                if(data['status'] == 'success'){
                    $.alert("成功");
                }
            });
    }

    $("#email").keydown(function(event){
        if(event.keyCode==13){
            login();
        }
    });
    
</script>
</body>

</html>
