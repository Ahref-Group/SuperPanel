<!DOCTYPE html>
<html lang="en_US">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><?php echo _('邀请码');?> - <{$site_name}></title>

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

<body style="background-image:url(__PUBLIC__/bootstrap/img/bg.jpeg); background-size:cover;  ">

    <div class="container" style="padding-top:60px opacity: 0.8;">
        <h1 class="text-center"><{$site_name}> 邀请码发放页</h1>
        <div class="row" style="padding-top:20px">
            <div class="col-md-8 col-md-offset-2">
                <div class="panel panel-red">
                    <div class="panel-body">
                        <{$announcement['invite_code']}>
                    </div>
                </div>
                <!--/.panel-->
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title text-center"><?php echo _('公共邀请码');?></h3>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th class="text-center">#</th>
                                        <th class="text-center">邀请码</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <foreach name="inviteCodeList" item="vo">
                                        <td class="text-center"><{$key+1}></td>
                                        <td class="text-center"><a href="<{:U('Home/Auth/register',array('code'=>$vo['code']))}>"><{$vo.code}></td>
                                    </tr>
                                    </foreach>
                                </tbody>
                            </table>
                        </div>
                        <if condition="sizeof($invite_code_list) eq 0"><div class="alert alert-info">当前没有邀请码哦！</div></if>
                    </div>
                    <div class="panel-footer">
                        * 直接点击邀请码即可开始注册
                    </div>
                </div>
                <!--/.panle-->
            </div>
        </div>
    </div>
    <include file="Home@bootstrap/User/js" />
</body>

</html>
