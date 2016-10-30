<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<title><?php echo _('操作历史')?> -<{$site_name}></title>
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
						<div class="col l10 m12">
							<div class="card hoverable">
								<div class="card-content">
									<span class="card-title"><?php echo _('敏感操作历史')?></span>
									<table class="bordered responsive-table hoverable">
										<thead>
											<tr>
												<th data-field="id"><?php echo _('序号');?></th>
												<th data-field="time"><?php echo _('时间');?></th>
												<th data-field="ip"><?php echo _('IP');?></th>
												<th data-field="data"><?php echo _('登录地点&服务商');?></th>
												<th data-field="data"><?php echo _('操作');?></th>
											</tr>
										</thead>
										<tbody>
											<!--<{$id=1}>-->
											<foreach name="ip_list" item="vo">
												<tr>
													<td><{$id++}></td>
													<td><{$vo.operation_time}></td>
													<td><{$vo.ip}></td>
													<td><{$vo.location}></td>
													<td><{$vo.operation}></td>
												</tr>
											</foreach>
										</tbody>
									</table>
									<br/><br/>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</body>
	<include file="Public/footer" />