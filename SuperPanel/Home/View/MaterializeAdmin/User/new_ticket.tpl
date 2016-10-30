<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<title><?php echo _('工单系统')?> -<{$site_name}></title>
		<include file="Home@MaterializeAdmin/Public/source" />
		<include file="Home@MaterializeAdmin/User/source" />
	</head>
	<body>
		<include file="Home@MaterializeAdmin/User/header" />
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
						<div class="section">
							<p class="caption"><?php echo _('您申请工单后，系统会自动通知管理员对您的问题进行答复，请耐心等待');?></p>
							<div class="divider"></div>
							<div id="contact-page" class="card">
								<div class="card-content">
									<div class="row">
										<div class="col s12 m6">
											<form class="contact-form">
												<div class="row">
													<div class="input-field col s12">
														<label></label>
														<select id="type">
															<option value="节点问题"><?php echo _('节点问题');?></option>
															<option value="账号问题"><?php echo _('账号问题');?></option>
															<option value="使用问题"><?php echo _('使用问题');?></option>
															<option value="其他问题"><?php echo _('其他');?></option>
														</select>
													</div>
												</div>
												<div class="row">
													<div class="input-field col s12">
														<input id="title" type="text">
														<label for="website"><?php echo _('标题');?></label>
													</div>
												</div>
												<div class="row">
													<div class="input-field col s12">
														<textarea id="message" class="materialize-textarea"></textarea>
														<label for="message"><?php echo _('信息');?></label>
													</div>
													<div class="row">
														<div class="input-field col s12">
															<button class="btn cyan waves-effect waves-light right" type="button" name="action" id="send-new"><?php echo _('提交');?><i class="mdi-content-send right"></i></button>
														</div>
													</div>
												</div>
											</form>
										</div>
										<div class="col s12 m6">
											<ul class="collapsible collapsible-accordion popout" data-collapsible="accordion">
												<li>
													<div class="collapsible-header"><i class="mdi-communication-live-help"></i>FAQ</div>
													<div class="collapsible-body" style="">
														<p>那有问题，事真多！【啪】</p>
													</div>
												</li>
												<li class="active">
													<div class="collapsible-header active"><i class="mdi-communication-email"></i>如何获得帮助?</div>
													<div class="collapsible-body" style="display: none;"><p>我们一定不会给你提供帮助的哦~</p></div>
												</li>
												<li>
													<div class="collapsible-header"><i class="mdi-editor-insert-emoticon"></i>嗯</div>
													<div class="collapsible-body" style="">
														<blockquote>垃圾！！！ </blockquote>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="card-reveal">
									<span class="card-title grey-text text-darken-4">Company Name LLC <i class="mdi-navigation-close right"></i></span>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</body>
	<script>
		$('#send-new').click(function() {
			ticket_check();
		}) 
		function ticket_check() {
			if (($("#title").val()).length == 0) {
				swal({
					title: "<?php echo _('出现问题！');?>",
					text: "<?php echo _('请填写标题');?>",
					type: "error",
					html: true
				});
				return false;
			}
			if (($("#message").val()).length == 0) {
				swal({
					title: "<?php echo _('出现问题！');?>",
					text: "<?php echo _('请填写内容');?>",
					type: "error",
					html: true
				});
				return false;
			}
			ticket_post();
		}
		function ticket_post(){
			$.post("<{:U('Home/User/new_ticket_action')}>", {
				type: $('#type').val(),
				title: $('#title').val(),
				message: $('#message').val()
			},
			function(data) {
				swal({
					title: "<?php echo _('成功！');?>",
					text: data['info'],
					type: "success",
					html: true
				});
			});
		}
	</script>