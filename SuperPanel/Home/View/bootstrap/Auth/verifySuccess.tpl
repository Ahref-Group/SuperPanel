<!DOCTYPE html>
<html lang="en_US" >

<head style="background-image:url(__PUBLIC__/bootstrap/img/bg.jpeg); background-size:cover; ;background-position:center; min-height:auto">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><?php echo _('邮箱认证成功');?> - <{$site_name}></title>

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
<style type="text/css">   
        *{   
            margin: 0;   
            padding: 0;   
        }   
        .center-in-center{   
            position: absolute;   
            top: 50%;   
            left: 50%;   
            -webkit-transform: translate(-50%, -50%);   
            -moz-transform: translate(-50%, -50%);   
            -ms-transform: translate(-50%, -50%);   
            -o-transform: translate(-50%, -50%);   
            transform: translate(-50%, -50%);   
        }   
    </style> 
<body style="background-image:url(__PUBLIC__/bootstrap/img/bg.jpeg); background-size:cover; min-height:auto;">

    <div class="container ">
        <div class="row center-in-center" style="width: 200px;   height: 200px;" id="loading">
                <h1><i class="fa fa-circle-o-notch fa-spin fa-5x text-center text-white" aria-hidden="true"></i></h1>
        </div>
    </div>
    <include file="Home@bootstrap/User/js" />
    <script>
        $(document).ready(function() { 
        setTimeout(popUuuuuuuuuuuup,1500);
        }); 
        function popUuuuuuuuuuuup(){
        $("#loading").hide();
        $.alert({title:"验证成功！",
                content:"您的邮箱已经认证并记录",
                confirmButtonClass:"btn-success",
                confirmButton: '好的',
            });
            
        }
</script>
</body>

</html>
