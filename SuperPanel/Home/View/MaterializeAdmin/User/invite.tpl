<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<title><?php echo _( '邀请好友');?>-<{$site_name}></title>
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
						<div class="row">
							<div class="col l5 s12">
								<div class="card light-blue hoverable">
									<div class="card-content white-text">
										<span class="card-title"><?php echo _('生成邀请码');?></span>
										<p><?php printf(_('Yooo,你现在可以生成%d个邀请码哦~'),$userinfo[ 'invite_code_amount']);?></p>
										<p><?php echo _('你可以为使用邀请码的账户添加喵币或更多的流量，此操作会扣除您的相对数据。');?></p>
										<if condition="$userinfo['invite_code_amount'] neq '0'"><br/>
											<button class="btn waves-effect waves-light hoverable" id="go"><?php echo _( '生成邀请码');?></button>
										</if>
										<include file="loading" /></div>
									</div>
									<div class="card purple accent-1 hoverable">
										<div class="card-content white-text">
											<span class="card-title"><?php echo _( '用户须知');?></span>
											<p>
											    <{$announcement['user_invite']}>
											</p>
										</div>
									</div>
								</div>
								<div class="col l7 s12">
									<div class="card hoverable">
										<div class="card-content">
											<span class="card-title"><?php echo _( '我的邀请码');?></span>
											<table class="bordered responsive-table hoverable display">
												<thead>
													<tr>
														<th data-field="id"><?php echo _( '序号');?></th>
														<th data-field="time"><?php echo _( '邀请码,点击发送');?></th>
														<th data-field="ip"><?php echo _( '流量');?></th>
														<th data-field="data"><?php echo _( '喵币');?></th>
													</tr>
												</thead>
												<tbody>
													<foreach name="invite_code__list" item="vo">
														<tr>
															<td><{$key+1}></td>
															<td><a href="javascript:void(0);" class="invite_email"><{$vo.code}></a></td>
															<td><{:round($vo['transfer']/1024/1024/1024, 2)}> GB</td>
															<td><{$vo.money}>个</td>
														</tr>
													</foreach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</body>
	<include file="Public/footer" />
	<script>
// 		$(document).ready(function() {
// 			$('.invite_email').click(function(){
// 				var email_reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
// 				swal({   
// 					title: "请输入邀请邮箱",
// 					text: "系统会发送一封邀请邮件到您所邀请人的邮箱中",
// 					type: "input",   showCancelButton: true,
// 					closeOnConfirm: false,
// 					animation: "slide-from-top",
// 					inputPlaceholder: "example@superpanel.pw" },
// 					function(email){
// 						if (email === false) return false;
// 						if (email === "") {
// 							swal.showInputError("请输入邮箱！");
// 							return false;
// 						}
// 						if (!email_reg.test($("#email").val())){
// 							swal.showInputError("请输入正确的邮箱格式！");
// 							return false;
// 						}
// 					});
					
// 				});
// 			});
	code_avalible=<{$userinfo['invite_code_amount']}>;
	transfer_avalible=<{$userinfo['transfer_enable']}>/1024/1024/1024;
	transfer_avalible=transfer_avalible.toFixed(2);
	miao_avalible=<{$userinfo['money']}>;
	$('#go').click(function() {
		swal({
			title: "<?php echo _('请输入个数');?>",
			text: "您有"+code_avalible+"个邀请码可以使用",
			type: "input",
			showCancelButton: true,
			closeOnConfirm: false,
			animation: "slide-from-bottom",
			inputPlaceholder: "个",
		},
		function(amount){
		    
			if (amount === false) return false;
			if (amount === "") {
				swal.showInputError("<?php echo _('请输入生成个数');?>");
				return false
			}
			if (amount > code_avalible){
				swal.showInputError("<?php echo _('您没有足够多的邀请码');?>");
				return false
			}
			swal({
				title: "<?php echo _('请输入邀请码的流量');?>",
				text: "您有"+transfer_avalible+"GB流量可以使用，0为默认",
				type: "input",
				showCancelButton: true,
				closeOnConfirm: false,
				animation: "slide-from-bottom",
				inputPlaceholder: "GB",
			},
			function(transfer) {
			    
				if (transfer === false) return false;
				if (transfer === "") {
					swal.showInputError("<?php echo _('请输入流量');?>");
					return false
				}
				if (transfer > transfer_avalible) {
					swal.showInputError("<?php echo _('您没有足够多的流量');?>");
					return false
				}
				swal({
					title: "<?php echo _('请输入邀请码包含的喵币');?>",
					text: "您有"+miao_avalible+"个喵币可以使用，0为默认",
					type: "input",
					showCancelButton: true,
					closeOnConfirm: false,
					animation: "slide-from-left",
					inputPlaceholder: "个",
					html: true
				},
				function(miao) {
					if (miao === false) return false;
					if (miao === "") {
						swal.showInputError("<?php echo _('请输入喵币');?>");
						return false
					}
					if (miao > miao_avalible) {
						swal.showInputError("<?php echo _('您没有足够多的喵币');?>");
						return false
					}
					swal({
						title: "<?php echo _('完成');?>",
						text: "您即将生成"+amount+"个包含如下内容的邀请码<br>流量：" + transfer + "GB<br>喵币" + miao + "个",
						type: "input",
						showCancelButton: true,
						closeOnConfirm: false,
						showLoaderOnConfirm: true,
						animation: "slide-from-left",
						html: true,
						type: "success"},
						function() {
							transfer=transfer*1024*1024*1024;
							$.post("<{:U('Home/User/invite_action')}>", 
							{
								invite_code_amount:amount,
								transfer:transfer,
								money:miao,
							},
							function(data) {
								if (data['status'] == 'success') {
									swal({
										title: "<?php echo _('成功');?>",
										text: data['info'],
										type: "success",
										html: true 
									});
									window.setTimeout("location.href='<{:U('Home/User/invite')}>'", 2000);
								} 
								else {
									swal({
										title: "<?php echo _('出现问题');?>",
										text: data['info'],
										type: "error",
										html: true 
									});
								};
							};
						};
					});
				};
			};
		};
	});
		});
		</script>