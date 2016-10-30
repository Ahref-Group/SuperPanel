<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<title><?php echo _('节点列表')?> -<{$site_name}></title>
		<include file="Public/source" />
		<include file="source" />
	</head>
	<body>
		<include file="header" />
		<!-- Start Page Loading -->
		<include file="Public/pageloading" />
		<!-- End Page Loading -->
		<!-- START MAIN -->
		<div id="main">
			<!-- START WRAPPER -->
			<div class="wrapper">
				<include file="nav" />
				<section id="content">
					<!--start container-->
					<div class="container">
						<div class="row">
							<div class="col l6 s12">
								<div class="card blue-grey darken-1 hoverable">
									<div class="card-content white-text">
										<span class="card-title"><?php echo _('普通节点')?></span>
										<p><?php echo _('普通节点公告')?>：balabalbalabala</p>
									</div>
								</div>
								<div class="card hoverable">
									<div class="card-content">
										<span class="card-title"><?php echo _('节点名称')?></span>
										<p>节点信息balabalabla</p>
									</div>
									<div class="card-action">
										<a href="#info" class="left-align modal-trigger"><?php echo _('连接')?></a>
									</div>
								</div>
							</div>
							<div class="col l6 s12">
							    <div class="card light-blue darken-1 hoverable">
									<div class="card-content white-text">
										<span class="card-title"><?php echo _('高级节点')?></span>
										<p><?php echo _('高级节点公告')?>：balabalbalabala</p>
									</div>
								</div>
								<div class="card hoverable">
									<div class="card-content">
										<span class="card-title"><?php echo _('节点名称')?></span>
										<p>节点信息balabalabla</p>
									</div>
									<div class="card-action">
										<a href="#info" class="left-align modal-trigger"><?php echo _('连接')?></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
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
											<?php echo _('地址')?>
										</div>
										<div class="col s7 grey-text text-darken-4 right-align">
											xxx.xxxxx.xx
										</div>
									</div>
								</li>
							    <li class="collection-item">
									<div class="row">
										<div class="col s5 grey-text darken-1">
											<?php echo _('端口')?>
										</div>
										<div class="col s7 grey-text text-darken-4 right-align">
											<{$userinfo[ 'port']}>
										</div>
									</div>
								</li>
								<li class="collection-item">
									<div class="row">
										<div class="col s5 grey-text darken-1">
											<?php echo _('密码')?>
										</div>
										<div class="col s7 grey-text text-darken-4 right-align">
											<{$userinfo[ 'passwd']}>
										</div>
									</div>
								</li>
								</div>
								<div class="col l4 s12">
								<li class="collection-item">
									<div class="row">
										<div class="col s5 grey-text darken-1">
											<?php echo _('加密方式')?>
										</div>
										<div class="col s7 grey-text text-darken-4 right-align">
											<{$userinfo[ 'method']}>
										</div>
									</div>
								</li>
								<li class="collection-item">
									<div class="row">
										<div class="col s5 grey-text darken-1">
											<?php echo _('协议')?>
										</div>
										<div class="col s7 grey-text text-darken-4 right-align">
											<{$userinfo[ 'protocol']}>
										</div>
									</div>
								</li>
								<li class="collection-item">
									<div class="row">
										<div class="col s5 grey-text darken-1">
											<?php echo _('混淆')?>
										</div>
										<div class="col s7 grey-text text-darken-4 right-align">
											<{$userinfo[ 'obfs']}>
										</div>
									</div>
								</li>
								</div>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
	<include file="Public/footer" />