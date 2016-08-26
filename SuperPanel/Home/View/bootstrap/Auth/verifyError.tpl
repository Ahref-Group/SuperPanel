<!DOCTYPE html>
<html lang="en_US" >

<head style="background-image:url(__PUBLIC__/bootstrap/img/bg.jpeg); background-size:cover; ;background-position:center; min-height:auto">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><{$site_name}> - <?php echo _('验证失败');?></title>

   <include file="Home@bootstrap/User/head" />

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
        $.alert({title:"验证失败",
                content:"链接已失效",
                confirmButtonClass:"btn-danger",
                confirmButton: '我知道了',
            });
            
        }
</script>
</body>

</html>
