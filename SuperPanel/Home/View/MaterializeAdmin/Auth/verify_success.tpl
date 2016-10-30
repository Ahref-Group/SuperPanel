<!DOCTYPE html>
<html lang="zh-cn">
    <head>
        <title>验证成功 - <{$site_name}></title>
        <include file="Public/source" />
        <!-- 页面所需特殊CSS和JS -->
        <include file="source" />  
    </head>

    <body class="cyan">
    </body>
    <script>
        $(document).ready(function(){
            swal({
				title: "成功",
                    text: "邮箱验证成功！",   
                    type: "success",
                    html: true 
                });
                
            })
    </script>
</html>
            
            