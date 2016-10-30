<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<title><?php echo _('我的信息');?> -<{$site_name}></title>
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
						<div id="profile-page" class="section">
							<!-- profile-page-header -->
							<div id="profile-page-header" class="card hoverable">
								<div class="card-image waves-effect waves-block waves-light hoverable">
									<img src="__PUBLIC__/MaterializeAdmin/images/user-profile-bg.jpg" alt="user background">
								</div>
								<figure class="card-profile-image">
									<img src="<{:get_gravatar_url($userinfo['email'])}>" alt="profile image" class="circle z-depth-2 responsive-img hoverable">
								</figure>
								<div class="card-content">
									<div class="row">
										<div class="col s3 offset-s2">
											<h4 class="card-title grey-text text-darken-4"><{$userinfo[ 'username']}></h4>
											<p class="medium-small grey-text"><{$userinfo[ 'plan']}><?php echo _('套餐');?></p>
										</div>
										<div class="col l2 s6 center-align">
											<h4 class="card-title grey-text text-darken-4"  id="transfer_used"></h4>
											<p class="medium-small grey-text"><?php echo _('使用流量');?></p>
										</div>
										<div class="col l2 s6 center-align">
											<h4 class="card-title grey-text text-darken-4" id="transfer_remain"></h4>
											<p class="medium-small grey-text"><?php echo _('剩余流量');?></p>
										</div>
										<div class="col l2 s6 center-align">
											<h4 class="card-title grey-text text-darken-4" id="transfer_total"></h4>
											<p class="medium-small grey-text"><?php echo _('总流量');?></p>
										</div>
										<div class="col l1 s6 right-align">
											<h4 class="card-title grey-text text-darken-4"><{$userinfo[ 'money']}><?php echo _('个');?></h4>
											<p class="medium-small grey-text"><?php echo _('喵币余额');?></p>
										</div>
									</div>
								</div>
							</div>
							<!--/ profile-page-header -->
							<div class="row">
								<div class="col l5 s12">
									<!-- Profile About Details -->
									<ul id="profile-page-about-details" class="collection z-depth-1 hoverable">
										<li class="collection-item hoverable">
											<div class="row">
												<div class="col s5 grey-text darken-1"><i class="material-icons left">email</i><?php echo _('邮箱');?></div>
												<div class="col s7 grey-text text-darken-4 right-align"><{$userinfo[ 'email']}></div>
											</div>
										</li>
										<li class="collection-item hoverable">
											<div class="row">
												<div class="col s5 grey-text darken-1"><i class="material-icons left">group_add</i><?php echo _('邀请码');?></div>
												<div class="col s7 grey-text text-darken-4 right-align"><{$userinfo[ 'invite_code_amount']}>个</div>
											</div>
										</li>
										<li class="collection-item hoverable">
											<div class="row">
												<div class="col s5 grey-text darken-1"><i class="material-icons left">person_add</i><?php echo _('我的邀请人');?></div>
												<div class="col s7 grey-text text-darken-4 right-align">
													<if condition="$userinfo['invited_by'] eq '0'"><?php echo _('公开');?><else /><{$userinfo[ 'invited_by']}></if>
												</div>
											</div>
										</li>
										<li class="collection-item hoverable">
											<div class="row">
												<div class="col s5 grey-text darken-1"><i class="material-icons left">beenhere</i><?php echo _('注册日期');?></div>
												<div class="col s7 grey-text text-darken-4 right-align"><{$userinfo[ 'reg_date']}></div>
											</div>
										</li>
									</ul>
									<ul id="profile-page-about-details" class="collection z-depth-1 hoverable">
										<li class="collection-item hoverable">
											<div class="row">
												<div class="col s5 grey-text darken-1">
													<i class="material-icons left">vpn_key</i><?php echo _('Shadowsocks密码');?></div>
												<div class="col s7 grey-text text-darken-4 right-align">
													<{$userinfo[ 'passwd']}></div>
											</div>
										</li>
										<li class="collection-item hoverable">
											<div class="row">
												<div class="col s5 grey-text darken-1">
													<i class="material-icons left">lock</i><?php echo _('Shadowsocks加密');?></div>
												<div class="col s7 grey-text text-darken-4 right-align">
													<{$userinfo[ 'method']}></div>
											</div>
										</li>
										<li class="collection-item hoverable">
											<div class="row">
												<div class="col s5 grey-text darken-1">
													<i class="material-icons left">cast</i><?php echo _('ShadowsocksR协议');?></div>
												<div class="col s7 grey-text text-darken-4 right-align">
													<{$userinfo[ 'protocol']}></div>
											</div>
										</li>
										<li class="collection-item hoverable">
											<div class="row">
												<div class="col s5 grey-text darken-1">
													<i class="material-icons left">enhanced_encryption</i><?php echo _('ShadowsocksR混淆');?></div>
												<div class="col s7 grey-text text-darken-4 right-align">
													<{$userinfo[ 'obfs']}></div>
											</div>
										</li>
									</ul>
									<!-- Profile About Details -->
								</div>
								<div class="col l7 s12">
									<div class="card hoverable">
										<div class="card-content">
											<span class="card-title"><?php echo _('是否接收每日流量报告？');?></span>
											<form action="#">
												<p class="range-field">
													<input type="range" id="mail_report" min=0 max="90" />
												</p>
											</form>
											<br/>
										</div>
										<div class="card-action">
											<a href="#" class="btn waves-effect hoverable"><?php echo _('保存');?></a></div>
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
	<include file="Home@MaterializeAdmin/Public/footer" />
	<script type="text/javascript">
	    transfer_used = <{$userinfo[ 'd']+$userinfo[ 'u']}>;
	    transfer_total = <{$userinfo[ 'transfer_enable']}>;
	    transfer_remain = <{$userinfo[ 'transfer_enable']-$userinfo[ 'd']-$userinfo[ 'u']}>;
	    $(document).ready(function(){
	        $('#transfer_used').html(auto_unit(transfer_used));
	        $('#transfer_total').html(auto_unit(transfer_total));
	        $('#transfer_remain').html(auto_unit(transfer_remain));
	        })
        function auto_unit(transfer){
            unit = 'B';
            if(transfer > 1024){
                transfer = transfer/1024;
                unit = 'KB';
            }
            if(transfer>1024){
                transfer = transfer/1024;
                unit = 'MB';
            }
            if(transfer>1024){
                transfer = transfer/1024;
                unit = 'GB';
            }
            return transfer.toFixed(2).toString() + unit;
        }
	        
	</script>
</html>