    <!-- jQuery -->
    <script src="__PUBLIC__/bootstrap/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="__PUBLIC__/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="__PUBLIC__/bootstrap/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="__PUBLIC__/bootstrap/js/sb-admin-2.js"></script>
    
    <!-- jquery-confirm -->
    <script src="__PUBLIC__/bootstrap/vendor/jquery-confirm/jquery-confirm.min.js"></script>
    
    <!-- logout the website -->
    <script>
        $(".logout").click(function(){
                $.confirm({
                    title:"确认退出？",
                    content:"我们将清除cookie！",
                    confirmButton: '是的，我要退出',
                    cancelButton: '不不不，我是点着玩的!',
                    confirm:function(){logout()}
                });
            })
        function logout(){
            var loading = $.dialog({
			    title:"退出中，请稍后",
			    content:'<p class="text-center"><i class="fa fa-spinner fa-spin fa-4x" aria-hidden="true"></i></p>'
			    });
			$.post("<{:U('Home/AuthAction/logout')}>", {}, function(data){
			        loading.close();
			        if(data['status'] == 'success'){
			            $.alert({title:"退出成功！",
			                content:data['info'],
			                confirmButton: '好的',
			                confirm:function(){location.href='<{:U('Home/Auth/login')}>'}
			            });
			        }
			    });
        }
    </script>