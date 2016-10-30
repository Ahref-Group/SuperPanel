<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<title><?php echo _( '节点列表')?> - <{$site_name}></title>
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
							<div class="col s12">
								<div class="card blue-grey darken-1 hoverable">
									<div class="card-content white-text">
										<span class="card-title"><?php echo _( '公告')?></span>
										<p>hehehe</p>
									</div>
								</div>
							</div>
							<div class="col l3">
								<div class="card blue-grey darken-1 hoverable">
									<div class="card-content white-text">
										<span class="card-title"><?php echo _( '您所属的组')?></span>
										<ul class="collection">
											<foreach name="group_list" item="vo">
												<if condition="in_array($vo['gid'], $user_group)">
													<a href="#!" class="collection-item">
														<{$vo.group_name}>
													</a>
												</if>
											</foreach>
										</ul>
									</div>
								</div>
								<div class="card blue-grey darken-1 hoverable">
									<div class="card-content white-text">
										<span class="card-title"><?php echo _( '其它的组')?></span>
										<ul class="collection">
											<foreach name="group_list" item="vo">
												<if condition="!in_array($vo['gid'], $user_group)">
													<a href="#!" class="collection-item">
														<{$vo.group_name}>
													</a>
												</if>
											</foreach>
										</ul>
									</div>
								</div>
								<div class="card blue-grey darken-1 hoverable">
									<div class="card-content white-text">
										<span class="card-title"><?php echo _( '下载配置')?></span>
										<p><?php echo _( '在此您可以直接下载您可以连接的所有节点的配置文件');?></p>
									</div>
								</div>
							</div>
							<div class="col l9 s12">
								<div class="card light-blue darken-1 hoverable">
									<div class="card-content white-text">
										<span class="card-title"><?php echo _( '已加入的组')?></span>
									</div>
								</div>
								<foreach name="group_list" item="group">
									<if condition="in_array($group['gid'], $user_group)">
										<div class="card hoverable">
											<div class="card-content">
												<span class="card-title"><{$group.group_name}></span>
												<if condition="!empty($group['group_info'])">
													<p><?php echo _( '组公告')?>：balabalbalabala</p>
												</if>
												<hr />
												<foreach name="group_list" item="group">
													<div class="card hoverable">
														<div class="card-content">
															<div class="hidden" id="info-<{$node_id}>" data-address="<{$node_list[$node_id]['address']}>" data-port="<{$userinfo['port']}>" data-passwd="<{$userinfo['passwd']}>" data-method="<{$userinfo['method']}>" data-protocol="<{$userinfo['protocol']}>" data-obfs="<{$userinfo['obfs']}>"></div>
															<span class="card-title"><{$node_list[$node_id][ 'node_name']}></span>
															<p><{$node_list[$node_id][ 'node_info']}></p>
														</div>
														<div class="card-action">
															<a href="#info" class="left-align modal-trigger"><?php echo _( '连接')?></a>
														</div>
													</div>
												</foreach>
											</div>
										</div>
									</if>
								</foreach>
							</div>
						</div>
					</div>
				</section>
				<div id="info" class="modal bottom-sheet">
					<div class="modal-content">
						<h4>节点名称</h4>
						<div class="row">
							<div class="col l4 s12">
								<p>这是假装一个二维码</p>
							</div>
							<div class="col l8 s12">
								<ul id="connect_info" class="collection z-depth-1 hoverable">
									<div class="col l8 s12">
										<li class="collection-item">
											<div class="row">
												<div class="col s5 grey-text darken-1">
													<?php echo _( '地址')?></div>
												<div class="col s7 grey-text text-darken-4 right-align">xxx.xxxxx.xx</div></div>
										</li>
										<li class="collection-item">
											<div class="row">
												<div class="col s5 grey-text darken-1">
													<?php echo _( '端口')?></div>
												<div class="col s7 grey-text text-darken-4 right-align">
													<{$userinfo[ 'port']}></div>
											</div>
										</li>
										<li class="collection-item">
											<div class="row">
												<div class="col s5 grey-text darken-1">
													<?php echo _( '密码')?></div>
												<div class="col s7 grey-text text-darken-4 right-align">
													<{$userinfo[ 'passwd']}></div>
											</div>
										</li>
									</div>
									<div class="col l4 s12">
										<li class="collection-item">
											<div class="row">
												<div class="col s5 grey-text darken-1">
													<?php echo _( '加密方式')?></div>
												<div class="col s7 grey-text text-darken-4 right-align">
													<{$userinfo[ 'method']}></div>
											</div>
										</li>
										<li class="collection-item">
											<div class="row">
												<div class="col s5 grey-text darken-1">
													<?php echo _( '协议')?></div>
												<div class="col s7 grey-text text-darken-4 right-align">
													<{$userinfo[ 'protocol']}></div>
											</div>
										</li>
										<li class="collection-item">
											<div class="row">
												<div class="col s5 grey-text darken-1">
													<?php echo _( '混淆')?></div>
												<div class="col s7 grey-text text-darken-4 right-align">
													<{$userinfo[ 'obfs']}></div>
											</div>
										</li>
									</div>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
	<script src="__PUBLIC__/js/qrcode/jquery.qrcode.min.js"></script>
    <script src="__PUBLIC__/js/base64/base64.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.5.12/clipboard.min.js"></script>
	<include file="Home@MaterializeAdmin/Public/footer" />