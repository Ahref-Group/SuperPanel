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
                var logout_comfirm = $.confirm({
                    title:"确认退出？",
                    content:"我们将清除cookie！",
                    confirmButton: '是的，我要退出',
                    cancelButton: '不不不，我是点着玩的!',
                    closeAnimation: 'right',
                    confirm:function(){
                        this.$confirmButton.html('<i class="fa fa-circle-o-notch fa-spin" aria-hidden="true"></i>');
                        this.$title.html('进行中...');
                        this.$content.html('正在清除您本地cookie和历史信息');
                        this.$cancelButton.hide();
                        logout();
                        return false;
                        }
                });
                function logout(){
			$.post("<{:U('Home/AuthAction/logout')}>", {}, function(data){
			    logout_comfirm.close();
			        if(data['status'] == 'success'){
			            $.alert({title:"成功！",
			                content:data['info'],
			                confirmButtonClass:"btn-success",
			                confirmButton: '好的',
			                animation: 'left',
			                autoClose: 'confirm|3000',
			                confirm:function(){location.href='<{:U('Home/Auth/login')}>'}
			            });
			        }
			    });
        }
            })
        
    </script>