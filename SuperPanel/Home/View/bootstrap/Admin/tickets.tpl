<!DOCTYPE html>
<html lang="<{:cookie('locale')}>">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>工单列表 - <{$site_name}></title>
    
    <include file="Home@bootstrap/User/head" />

</head>

<body>

    <div id="wrapper">
        <include file="Home@bootstrap/Admin/nav" />

        <!-- Page Content -->
        <div id="page-wrapper" style="">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">工单列表</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-green">
                            <div class="panel-heading">开启中的工单</div>
                            <div class="panel-body">
                                <if condition="count($opened_tickets_list) eq 0">
                                    <div class="well">
                                        <p class="success">恭喜，您没有未处理的工单！</p>
                                    </div>
                                <else/>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <th>#</th>
                                            <th>标题</th>
                                            <th>发起人</th>
                                            <th>发起时间</th>
                                            <th>状态</th>
                                            <th>查看</th>
                                            <th>关闭</th>
                                        </thead>
                                        <tbody>
                                            <foreach name="opened_tickets_list" item="ticket">
                                            <tr class=<{$ticket['status']=='replied'?"text-success":"text-danger"}> data-tid="<{$ticket.tid}>">
                                                <td><{$key+1}></td>
                                                <td><{$ticket.title}></td>
                                                <td><{$ticket.username}></td>
                                                <td><{$ticket.open_time}></td>
                                                <td><{$ticket['status']=='replied'?"已回复":"未回复"}></td>
                                                <td><button class="btn btn-sm btn-primary details" data-tid="<{$ticket.tid}>"><i class="fa fa-eye"> 查看</button></td>
                                                <td><button class="btn btn-sm btn-warning close-ticket" data-tid="<{$ticket.tid}>"><i class="fa fa-close"> 关闭</button></td>
                                            </tr>
                                            </foreach>
                                        </tbody>
                                    </table>
                                </div>
                                </if>
                            </div>
                        </div>
                    </div>
                    <!--/.col-md-12-->
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">已关闭的工单</div>
                            <div class="panel-body">
                                <if condition="count($closed_tickets_list) eq 0">
                                    <div class="well">
                                        <p class="success">没有已关闭的工单</p>
                                    </div>
                                <else/>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <th>#</th>
                                            <th>标题</th>
                                            <th>发起人</th>
                                            <th>发起时间</th>
                                            <th>查看</th>
                                            <th>删除</th>
                                        </thead>
                                        <tbody>
                                            <foreach name="closed_tickets_list" item="ticket">
                                            <tr data-tid="<{$ticket.tid}>">
                                                <td><{$key+1}></td>
                                                <td><{$ticket.title}></td>
                                                <td><{$ticket.username}></td>
                                                <td><{$ticket.open_time}></td>
                                                <td><button class="btn btn-sm btn-primary details" data-tid="<{$ticket.tid}>"><i class="fa fa-eye"> 查看</button></td>
                                                <td><button class="btn btn-sm btn-danger delete-ticket" data-tid="<{$ticket.tid}>"><i class="fa fa-trash"></i> 删除</button></td>
                                            </tr>
                                            </foreach>
                                        </tbody>
                                    </table>
                                </div>
                                </if>
                            </div>
                        </div>
                    </div>
                    <!--/.col-lg-12-->
                </div>
                <!--/.row-->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
        
        <div class="modal fade" id="ticket_info" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="ticket_title"></h4>
                    </div>
                    <div class="modal-body">
                        <div class="chat-panel panel panel-default">
                            <div class="panel-body">
                                <ul class="chat" id="reply">
                                </ul>
                            </div>
                            <!-- /.panel-body -->
                            <div class="panel-footer modal-footer">
                                <div class="input-group">
                                    <input id="message-reply" type="text" class="form-control input-sm" placeholder="在此输入您的回复..." />
                                    <span class="input-group-btn">
                                        <button class="btn btn-warning btn-sm" id="send"><?php echo _('发送');?></button>
                                    </span>
                                </div>
                            </div>
                            <!-- /.panel-footer -->
                        </div>
                        <!-- /.panel .chat-panel -->
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
        
        
    </div>
    <!-- /#wrapper -->
    
<include file="Home@bootstrap/Public/footer" />



</body>
<include file="Home@bootstrap/User/js" />
    <script>
        $(".close-ticket").click(function(){
            tid = $(this).attr('data-tid');
            $.post("<{:U('Home/AdminAction/closeTicket')}>", {tid:tid}, function(data){
                if(data['status'] == 'success'){
                
                    $('tr[data-tid='+tid+']').hide();
                }else{
                    $.alert("关闭失败");
                }
            });
        });
        
        $(".delete-ticket").click(function(){
            tid = $(this).attr('data-tid');
            $.post("<{:U('Home/AdminAction/deleteTicket')}>", {tid:tid}, function(data){
                if(data['status'] == 'success'){
                
                    $('tr[data-tid='+tid+']').hide();
                }else{
                    $.alert("删除失败");
                }
            });
        });
        
        $("#send").click(function(){
            message=$('#message-reply').val();
            $.post("<{:U('Home/AdminAction/replyTicket')}>",{tid:tid, message:message},function(data){
                if(data['status'] == 'success'){
                    admin_add({'message': message, 'reply_time':'<?php echo _('刚刚')?>'});
                    $('#message-reply').val('');    //清空回复框
                }
                });
        });
        
        $('.details').click(function(){
            $('#ticket_info').modal('show');
			tid = $(this).attr('data-tid');
			$.post("<{:U('Home/AdminAction/getTicketContent')}>", {tid:tid},
			function(data){
				$('#reply').empty();   //清空回复
				$('#ticket_title').html($('#t'+tid).find('.panel-heading').html());     //根据点击查找对应的标题
				if(data['status'] == 'success'){
					username = data['info']['userinfo']['username'];
					gravatar_url = data['info']['userinfo']['gravatar_url'];
					
					for(var key in data['info']['data']){
						if(data['info']['data'][key]['uid'] == 0){
							admin_add(data['info']['data'][key]);
						}else{
							user_add(data['info']['data'][key], data['info']['userinfo']);
						}
					}
				}
			})
        });
        
    function admin_add(data){
        $("#reply").append('\
            <li class="right clearfix">\
                <span class="chat-img pull-right">\
                    <img src="http://placehold.it/50/55C1E7/fff" alt="User Avatar" class="img-circle" />\
                </span>\
                <div class="chat-body clearfix">\
                    <div class="header">\
                        <strong class="primary-font">管理员</strong>\
                        <small class="pull-right text-muted">\
                            <i class="fa fa-clock-o fa-fw"></i>'+data['reply_time']+'\
                        </small>\
                    </div>\
                    <p>'+data['message']+'\
                    </p>\
                </div>\
            </li>');
    }
    
    
    
    function user_add(data, userinfo){
        $("#reply").append('<li class="left clearfix">\
            <span class="chat-img pull-left">\
                <img src="'+userinfo['gravatar_url']+'" alt="'+userinfo['username']+'" class="img-circle" />\
            </span>\
            <div class="chat-body clearfix">\
                <div class="header">\
                    <small class=" text-muted">\
                        <i class="fa fa-clock-o fa-fw"></i> '+data['reply_time']+'</small>\
                    <strong class="pull-left primary-font"> '+userinfo['username']+' </strong>\
                </div>\
                <p>'+data['message']+'</p>\
            </div>\
        </li>');
    }
    </script>
</html>
