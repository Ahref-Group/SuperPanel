<!DOCTYPE html>
<html lang="<{:cookie('locale')}>">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title><?php echo _('我的工单');?> - <{$site_name}></title>
    
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
                        <h1 class="page-header"><?php echo _('我的工单');?></h1>
                    </div>
                    <!-- /.col-lg-12 -->
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <?php echo _('开启的工单');?>
                                </div>
                                <php>$times = 0;</php>
                                <foreach name="ticket_list" item="vo"><if condition="$vo.status eq 'updated' or $vo.status eq 'replied'">
                                <div class="panel-body" id="t<{$vo.tid}>">
                                    <div class="panel panel-green">
                                        <div class="panel-heading">
                                            <{$vo.title}>
                                            <if condition="$vo.status eq 'replied'">
                                                <span class="text-danger pull-right">有新回复！</span>
                                            </if>
                                        </div>
                                        <div class="panel-body">
                                            <pre class="well well-sm ticket-message"><{$vo.message}></pre>
                                        </div>
                                        <div class="panel-footer">
                                            <div class="row">
                                                <div class="col-lg-6">
                                                <div class="text-left">
                                                    <span><small class="open_time"><{$vo.open_time}></small></span>
                                                </div>
                                                </div>
                                                <div class="col-lg-6">
                                                <div class="text-right">
                                                    <button class="btn btn-primary btn-sm details" data-tid="<{$vo.tid}>"><i class="fa fa-folder-open" aria-hidden="true"></i> <?php echo _('查看详细');?></button>
                                                    <button class="btn btn-primary btn-sm close_ticket" data-tid="<{$vo.tid}>" id="<{$vo.tid}>"><i class="fa fa-close" aria-hidden="true"></i> <?php echo _('关闭工单');?></button>
                                                    <button class="btn btn-primary btn-sm delete_ticket"  data-tid="<{$vo.tid}>" style="display:none;"><i class="fa fa-trash-o" aria-hidden="true"></i> <?php echo _('删除工单');?></button>
                                                </div></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /panel-body -->
                                <php>$times++; </php>
                                </if></foreach>
                                <if condition="$times eq 0">
                                    <div class="panel-body">
                                        <?php echo _('没有更多工单');?>
                                    </div>
                                </if>
                            </div>
                        </div>
                        <!-- /.col-lg-6 -->
                        <div class="col-lg-6">
                            <div class="panel panel-yellow">
                                <div class="panel-heading" id="close">
                                    <?php echo _('关闭的工单');?>
                                </div>
                                <php>$times = 0;</php>
                                <foreach name="ticket_list" item="vo"><if condition="$vo.status eq 'closed'">
                                <div class="panel-body" id="t<{$vo.tid}>">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <{$vo.title}>
                                        </div>
                                        <div class="panel-body">
                                            <pre class="well well-sm ticket-message"><{$vo.message}></pre>
                                        </div>
                                        <div class="panel-footer">
                                            <div class="row">
                                                <div class="col-lg-6">
                                                <div class="text-left">
                                                    <span><small class="open_time"><{$vo.open_time}></small></span>
                                                </div>
                                                </div>
                                                <div class="col-lg-6">
                                                <div class="text-right">
                                                    <button class="btn btn-primary btn-sm details" data-tid="<{$vo.tid}>"><i class="fa fa-folder-open" aria-hidden="true"></i> <?php echo _('查看详细');?></button>
                                                    <button class="btn btn-primary btn-sm delete_ticket" data-tid="<{$vo.tid}>"><i class="fa fa-trash-o" aria-hidden="true"></i> <?php echo _('删除工单');?></button>
                                                </div></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /panel-body -->
                                <php>$times++; </php>
                                </if></foreach>
                                <if condition="$times eq 0">
                                    <div class="panel-body">
                                        <?php echo _('没有更多工单');?>
                                    </div>
                                </if>
                            </div>
                        </div>
                        <!-- /.col-lg-6 -->
                    </div>
                </div>
                <!-- /.row -->
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

    <include file="Home@bootstrap/User/js" />
    <script>
    
    $('.details').click(function(){
            $('#ticket_info').modal('show');
			tid = $(this).attr('data-tid');
			$.post("<{:U('Home/UserAction/tickets')}>", {
				tid:tid,
				action:"get_ticket_content"
			},
			function(data){
				$('#reply').empty();   //清空回复
				$('#ticket_title').html($('#t'+tid).find('.panel-heading').html());     //根据点击查找对应的标题
				if(data['status'] == 'success'){
					data['data'].splice(0,0,{'uid':<{$userinfo['uid']}>, 'message':$('#t'+tid).find('.ticket-message').html(), 'reply_time':$('#t'+tid).find('.open_time').html()})
					for(var key in data['data']){
						if(data['data'][key]['uid'] == 0){
							admin_add(data['data'][key]);
						}else{
							user_add(data['data'][key]);
						}
					}
				}
			})
        });
    
    
    $("#send").click(function(){
            message=$('#message-reply').val();
            $.post("<{:U('Home/UserAction/tickets')}>",{tid:tid, action:"reply_ticket",message:message},function(data){
                if(data['status'] == 'success'){
                    user_add({'message': message, 'reply_time':'<?php echo _('刚刚')?>'});
                    $('#message-reply').val('');    //清空回复框
                }
                });
        });
    
    function admin_add(data){
        $("#reply").append('\
            <li class="left clearfix">\
                <span class="chat-img pull-left">\
                    <img src="http://placehold.it/50/55C1E7/fff" alt="User Avatar" class="img-circle" />\
                </span>\
                <div class="chat-body clearfix">\
                    <div class="header">\
                        <strong class="primary-font">Jack Sparrow</strong>\
                        <small class="pull-right text-muted">\
                            <i class="fa fa-clock-o fa-fw"></i>'+data['reply_time']+'\
                        </small>\
                    </div>\
                    <p>'+data['message']+'\
                    </p>\
                </div>\
            </li>');
    }
    
    
    
    function user_add(data){
        $("#reply").append('<li class="right clearfix">\
            <span class="chat-img pull-right">\
                <img src="<{:get_gravatar_url($userinfo['email'], 50)}>" alt="<{$userinfo['username']}>" class="img-circle" />\
            </span>\
            <div class="chat-body clearfix">\
                <div class="header">\
                    <small class=" text-muted">\
                        <i class="fa fa-clock-o fa-fw"></i> '+data['reply_time']+'</small>\
                    <strong class="pull-right primary-font"> <{$userinfo['username']}> </strong>\
                </div>\
                <p>'+data['message']+'</p>\
            </div>\
        </li>');
    }
    
        $('.delete_ticket').click(function(){
				tid = $(this).attr('data-tid');
				$.post("<{:U('Home/UserAction/tickets')}>", {
					tid:tid,
					action:"delete_ticket"
					},
					function(data){
						$('#t'+tid).slideUp(500, function(){$(this).remove()})
				})
			});
	$('.close_ticket').click(function(){
				tid = $(this).attr('data-tid');
				$.post("<{:U('Home/UserAction/tickets')}>", {
				tid:tid,
				action:"close_ticket"
				},
				function(data){
				$('#t'+tid).slideUp(500, function(){
				    $(this).children().removeClass('panel-green');
				    $(this).children().addClass('panel-red');
				    
					$(this).hide();
					$('#close').after($(this));
					$(this).show(500);
					$('#'+tid).hide();
					$('#'+tid).next().show();
				})
			})
		});
    </script>
</body>

</html>
