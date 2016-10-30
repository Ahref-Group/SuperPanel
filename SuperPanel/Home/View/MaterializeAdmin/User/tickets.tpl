<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<title><?php echo _('我的工单')?> -<{$site_name}></title>
		<include file="Home@MaterializeAdmin/Public/source" />
		<include file="Home@MaterializeAdmin/User/source" />
	</head>
	<body>
		<include file="Home@MaterializeAdmin/header" />
		<!-- Start Page Loading -->
		<include file="Home@MaterializeAdmin/Public/pageloading" />
		<!-- End Page Loading -->
		<!-- START MAIN -->
		<div id="main">
			<!-- START WRAPPER -->
			<div class="wrapper">
				<include file="Home@MaterializeAdmin/User/nav" />
				<section id="content">
					<!--start container-->
					<div class="container">
						<div class="row">
							<div class="col l7 s12">
								<div class="card blue-grey darken-1 hoverable">
									<div class="card-content white-text">
										<span class="card-title"><?php echo _('开启的工单')?></span>
										<p><?php echo _('这些工单您仍未关闭或仍未解决')?></p>
									</div>
								</div>
								<foreach name="ticket_list" item="vo">
									<if condition="$vo.status eq '1'">
										<div class="card hoverable" id="t<{$vo.tid}>">
											<div class="card-content">
												<span class="card-title"><{$vo.title}></span>
												<p class="ticket-message"><{$vo.message}></p>
											</div>
											<div class="card-action">
												<a href="javascript:void(0)" data-tid="<{$vo.tid}>" class="left-align details"><?php echo _('查看详细')?></a>
												<a href="#" class="left-align close_ticket" data-tid="<{$vo.tid}>" id="<{$vo.tid}>"}><?php echo _('关闭工单')?></a>
												<a href="javascript:void(0)" class="left-align delete_ticket" data-tid="<{$vo.tid}>" style="display:none;"><?php echo _('删除工单')?></a>
												<span class="right-align"><{$vo.open_time}></span>
											</div>
										</div>
									</if>
								</foreach>
							</div>
							<div class="col l5 s12">
								<div class="card light-blue darken-1 hoverable" id="close">
									<div class="card-content white-text">
										<span class="card-title"><?php echo _('关闭的工单')?></span>
										<p><?php echo _('这些工单被管理员或您关闭')?></p>
									</div>
								</div>
								<foreach name="ticket_list" item="vo">
									<if condition="$vo.status eq '0'">
										<div class="card hoverable" id="t<{$vo.tid}>">
											<div class="card-content">
												<span class="card-title"><{$vo.title}></span>
												<p class="ticket-message"><{$vo.message}></p>
											</div>
											<div class="card-action">
												<a href="javascript:void(0)" data-tid="<{$vo.tid}>" class="left-align details"><?php echo _('查看详细')?></a>
												<a href="javascript:void(0)" class="left-align delete_ticket" data-tid="<{$vo.tid}>"><?php echo _('删除工单')?></a>
												<span class="right-align"><{$vo.open_time}></span>
											</div>
										</div>
									</if>
								</foreach>
							</div>
						</div>
					</div>
				</section>
			</div>
			<div id="ticket_info" class="modal modal-fixed-footer">
				<div class="modal-content">
					<div class="row">
					    <h1 id="ticket_title" class="center fixed"></h1>
						<div id="location"></div>
					</div>
				</div>
				<div class="modal-footer">
						<div class="col s2">
							<button class="btn cyan waves-effect waves-light right" type="button" id="send"><?php echo _('添加回复');?>
								<i class="mdi-content-send right"></i>
							</button>
						</div>
				</div>
			</div>
		</div>
	</body>
	<script>
		function admin_add(data){
			$('#location').before("\
				<div class='col m9 s12 reply'>\
					<div class='col m2 s5'>\
						<img src='__PUBLIC__/MaterializeAdmin/images/avatar.jpg' class='circle responsive-img valign profile-image' style='width:50px'>\
					</div>\
					<div class='col m10 s7'>\
						<div class='card-panel yellow darken-4' style='border-radius: 10px;'>\
							<span class='white-text'><pre>"+data['message']+"</pre><small><p class='right-align'>"+data['reply_time']+"</p></small></span>\
						</div>\
					</div>\
				</div>"
			)
		}
		function user_add(data){
			$('#location').before("\
				<div class='col m9 s12 offset-m3 offset-s3 reply'>\
					<div class='col m10 s7'>\
						<div class='card-panel green darken-4' style='border-radius: 10px;'>\
							<span class='white-text'><pre>"+data['message']+"</pre><small><p class='right-align'>"+data['reply_time']+"</p></small></span>\
						</div>\
					</div>\
					<div class='col m2 s5'>\
						<img src='<{:get_gravatar_url($userinfo['email'])}>' class='circle responsive-img valign profile-image' style='width:50px'>\
					</div>\
				</div>"
			)
		}
		$('#send').click(function(){
			var message="";
			swal({
				title: "<?php echo _('添加回复');?>",
				text: "<?php echo _('系统会将您的回复告知管理员');?>",
				type: "input",
				showCancelButton: true,
				closeOnConfirm: false,
				animation: "slide-from-bottom",
				showLoaderOnConfirm: true,
				inputPlaceholder: "",
			},
			function(message){
				if (message === false) return false;
				if (message === "") {
					swal.showInputError("<?php echo _('请输入回复内容');?>");
					return false;
				}
				$("html").keydown(function(event){
				    if (message === false) return false;
				    if (message === "") {
				    	swal.showInputError("<?php echo _('请输入回复内容');?>");
				    	return false;
				    }
					if(event.keyCode==13){
					s$.post("<{:U('Home/User/tickets_action')}>", {
				tid:tid,
				action:"reply_ticket",
				message:message
			},
			function(data){
				if (data['status'] == 'success') {
					swal({
						title: "<?php echo _('成功');?>",
						text: data['info'],
						type: "success",
						html: true 
					});
				} 
				user_add({'message': message, 'reply_time':'<?php echo _('刚刚')?>'})
				$('#message').val("");
			})
					}
				});
				$.post("<{:U('Home/User/tickets_action')}>", {
				tid:tid,
				action:"reply_ticket",
				message:message
			},
			function(data){
				if (data['status'] == 'success') {
					swal({
						title: "<?php echo _('成功！');?>",
						text: data['info'],
						type: "success",
						html: true 
					});
				} 
				user_add({'message': message, 'reply_time':'<?php echo _('刚刚')?>'})
				$('#message').val("");
			})
			});
		});
		$('.details').click(function(){
			$('#ticket_info').openModal();
			tid = $(this).attr('data-tid');
			$.post("<{:U('Home/User/tickets_action')}>", {
				tid:tid,
				action:"get_ticket_content"
			},
			function(data){
				$('.reply').remove();
				$('#ticket_title').html($('#t'+tid).find('.card-title').html());
				if(data['status'] == 'success'){
					data['data'].splice(0,0,{'uid':<{$userinfo['uid']}>, 'message':$('#t'+tid).find('.ticket-message').html(), 'reply_time':$('#t'+tid).find('.right-align').html()})
					for(var key in data['data']){
						if(data['data'][key]['uid'] == 0){
							admin_add(data['data'][key]);
						}else{
							user_add(data['data'][key]);
						}
					}
				}
			})
		})
		$('.delete_ticket').click(function(){
				tid = $(this).attr('data-tid');
				$.post("<{:U('Home/User/tickets_action')}>", {
					tid:tid,
					action:"delete_ticket"
					},
					function(data){
						$('#t'+tid).slideUp(500, function(){$(this).remove()})
				})
			});
			$('.close_ticket').click(function(){
				tid = $(this).attr('data-tid');
				$.post("<{:U('Home/User/tickets_action')}>", {
				tid:tid,
				action:"close_ticket"
				},
				function(data){
				$('#t'+tid).slideUp(500, function(){
					$(this).hide();
					$('#close').after($(this));
					$(this).show(500);
					$('#'+tid).hide();
					$('#'+tid).next().show();
				})
			})
		});
	</script>