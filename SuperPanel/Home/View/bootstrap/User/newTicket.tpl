<!DOCTYPE html>
<html lang="<{:cookie('locale')}>">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><?php echo _('新工单');?> - <{$site_name}></title>
    
    <include file="Home@bootstrap/User/head" />

</head>

<body>

    <div id="wrapper">
        <include file="Home@bootstrap/User/nav" />

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header"><?php echo _('开启工单');?></h1>
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                Primary Panel
                            </div>
                            <div class="panel-body">
                                <p>233</p>
                            </div>
                        </div>
                        <!-- /.panel -->
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="panel panel-green">
                                    <div class="panel-heading"><?php echo _('新工单');?></div>
                                    <div class="panel-body">
                                        <form role="form">
                                            <div class="form-group">
                                                <label><?php echo _('问题类型');?></label>
                                                <select class="form-control" id="type">
                                                    <option><?php echo _('节点问题');?></option>
                                                    <option><?php echo _('账号问题');?></option>
                                                    <option><?php echo _('使用问题');?></option>
                                                    <option><?php echo _('其它问题');?></option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label><?php echo _('标题');?></label>
                                                <input class="form-control" placeholder="标题" id="title">
                                            </div>
                                            <div class="form-group">
                                                <label><?php echo _('详细描述');?></label>
                                                <textarea class="form-control" rows="3" id="message"></textarea>
                                            </div>
                                        </form>
                                    </div>
                                    <!-- ./panel-body -->
                                    <div class="panel-footer">
                                        <div class="text-right">
                                            <button class="btn btn-primary" id="send"><i class="fa fa-paper-plane-o" aria-hidden="true"></i> <?php echo _('提交');?></button>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.panel -->
                            </div>
                            <!-- /.col-lg-6 -->
                            
                            <div class="col-lg-6">
                                <div class="panel panel-info">
                                    <div class="panel-heading">
                                        <?php echo _('常见问题');?>
                                    </div>
                                    <!-- /.panel-heading -->
                                    <div class="panel-body">
                                        <!-- Nav tabs -->
                                        <ul class="nav nav-tabs">
                                            <li class="active"><a href="#home" data-toggle="tab">Home</a>
                                            </li>
                                            <li><a href="#profile" data-toggle="tab">Profile</a>
                                            </li>
                                            <li><a href="#messages" data-toggle="tab">Messages</a>
                                            </li>
                                            <li><a href="#settings" data-toggle="tab">Settings</a>
                                            </li>
                                        </ul>
                                        <!-- Tab panes -->
                                        <div class="tab-content">
                                            <div class="tab-pane fade in active" id="home">
                                                <h4>Home Tab</h4>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                            </div>
                                            <div class="tab-pane fade" id="profile">
                                                <h4>Profile Tab</h4>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                            </div>
                                            <div class="tab-pane fade" id="messages">
                                                <h4>Messages Tab</h4>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                            </div>
                                            <div class="tab-pane fade" id="settings">
                                                <h4>Settings Tab</h4>
                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.panel-body -->
                                </div>
                                <!-- /.panel -->
                            </div>
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <include file="Home@bootstrap/User/js" />
    <script>
        $('#send').click(function(){
            if (($("#title").val()).length == 0) {
				$.alert({title:"出现问题",content:"请填写标题",confirmButton:"好的",confirmButtonClass: 'btn-danger'})
				return false;
			}
			if (($("#message").val()).length == 0) {
				$.alert({title:"出现问题",content:"请填写内容",confirmButton:"好的",confirmButtonClass: 'btn-danger'})
				return false;
			}
			ticket_post();
        });
        
        
        function ticket_post(){
			$.post("<{:U('Home/UserAction/new_ticket')}>", {
				type: $('#type').val(),
				title: $('#title').val(),
				message: $('#message').val()
			},
			function(data) {
				$.alert({title:"发送成功",content:data['info'],confirmButton:"好的",confirmButtonClass: 'btn-danger',
				    confirm:function(){location.href='<{:U('Home/User/tickets')}>'}})
			});
		}
    </script>
</body>

</html>