<!DOCTYPE html>
<html lang="zh-cn">
    <head>
        <title>验证失败 - <{$site_name}></title>
        <include file="Public/source" />
        <!-- 页面所需特殊CSS和JS -->
        <include file="source" />  
    </head>

    <body class="cyan">
    </body>
    <script>
        $(document).ready(function(){
            swal({
				title: "链接失效",
                    text: "认证失败，链接已失效。",   
                    type: "error",
                    html: true 
                });
            })
    </script>
</html>
            
            