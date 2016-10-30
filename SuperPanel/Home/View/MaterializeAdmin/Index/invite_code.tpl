<!DOCTYPE html>
<html lang="zh-cn">
    <head>
	    <title><{$site_name}>-邀请码</title>
	    <include file="Home@MaterializeAdmin/Public/source" />
		<script src="__PUBLIC__/MaterializeAdmin/js/plugins/jquery-zclip/jquery.zclip.min.js"></script>
	</head>
	<body>
		<include file="Home@MaterializeAdmin/Index/header" />
		<div class="flex-background"></div>
		<include file="Home@MaterializeAdmin/Public/pageloading" />
		<section class="no-padding">
			<div class="container center">
			    <br/><br/><br/><br/><br/><br/><br/>
				<div class="pushdown-3p"></div>
				<div class="container">
					<div class="row">
						<div class="col s10 offset-s1">
						    <div class="card accent-1 hoverable">
								<div class="card-content">
									<span class="card-title"><?php echo _( '公众邀请码');?></span>
									<p>
										Balabalabalabalabalabalabalabalabala
										<br>Balabalabalabalabalabalabalabalabala
										<br>Balabalabalabalabalabalabalabalabala
									</p>
								</div>
							</div>
							<div class="pushdown-2p"></div>
							<div class="card hoverable">
								<div class="card-content">
									<table class="bordered responsive-table hoverable display">
										<thead>
											<tr>
												<th data-field="id"><?php echo _( '序号');?></th>
												<th data-field="code"><?php echo _( '邀请码,点击使用');?></th>
												<th data-field="action"><?php echo _( '更多操作');?></th>
											</tr>
										</thead>
										<tbody>
						    			    <foreach name="invite_code_list" item="vo">
												<tr>
													<td><{$key+1}></td>
													<td><a href="<{:U("Home/Auth/register?invite=".$vo['code'])}>"><{$vo.code}></a></td>
													<td><button class="btn waves-effect waves-light hoverable copy"><?php echo _('复制');?></button></td>
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
	</body>
	<include file="Home@MaterializeAdmin/Public/indexfooter" />