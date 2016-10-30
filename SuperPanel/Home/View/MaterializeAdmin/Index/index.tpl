<!DOCTYPE html>
<html lang="zh-cn">
    <head>
	    <title><{$site_name}></title>
	    <include file="Home@MaterializeAdmin/Public/source" />
		
	</head>
	<body>
		<include file="Home@MaterializeAdmin/Index/header" />
		<div class="flex-background"></div>
		<include file="Home@MaterializeAdmin/Public/pageloading" />
		<section class="no-padding">
			<div class="container center">
			    <br/><br/><br/><br/><br/><br/><br/>
				<div class="pushdown-10p"></div>
				<div class="row">
					<div class="col s12">
						<h1 style="font-family: Orbitron;"><font size="60"><{$site_name}></font></h1>
					</div>
				</div>
				<br/><br/><br/><br/><br/><br/><br/>
				<div class="container">
					<div class="row">
						<div class="col s12">
							<a href="<{:U('Home/Auth/login')}>" class="waves-effect waves-light btn-large z-depth-1"><?php echo _("登录");?></a>
							<a href="<{:U('Home/Auth/register')}>" class="waves-effect waves-light btn-large z-depth-1"><?php echo _('注册');?></a>
						</div>
					</div>
				</div>
			</div>
		</section>
	</body>
	<include file="Home@MaterializeAdmin/Public/indexfooter" />