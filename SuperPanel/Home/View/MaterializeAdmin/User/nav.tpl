	<!-- START LEFT SIDEBAR NAV-->
	<nav id="left-sidebar-nav">
		<ul id="slide-out" class="side-nav fixed leftside-navigation">
			<li class="user-details cyan darken-2">
				<div class="row">
					<div class="col col s4 m4 l4">
						<img src="<{:get_gravatar_url($userinfo['email'])}>" alt="" class="circle responsive-img valign profile-image">
					</div>
					<div class="col col s8 m8 l8">
						<ul id="profile-dropdown" class="dropdown-content">
							<li><a href="<{:U('Home/User/me')}>"><i class="mdi-action-account-circle"></i><?php echo _('信息');?></a></li>
							<li><a href="#"><i class="mdi-action-settings"></i><?php echo _('设置');?></a></li>
							<li class="divider"></li>
							<li><a href="javascript:void(0)" class="exit"><i class="material-icons">close</i><?php echo _('退出');?></a></li>
						</ul>
						<a class="btn-flat dropdown-button waves-effect waves-light white-text profile-btn" href="#" data-activates="profile-dropdown"><small><{$userinfo['username']}><i class="mdi-navigation-arrow-drop-down right"></i><small></a>
						<p class="user-roal"><?php echo _('免费用户');?></p>
					</div>
				</div>
			</li>
			<li class="bold"><a href="<{:U('Home/User/index')}>" class="waves-effect waves-cyan"><i class="mdi-action-dashboard"></i><?php echo _('用户面板');?></a></li>
			<li class="no-padding">
				<ul class="collapsible collapsible-accordion">
					<li class="bold"><a class="collapsible-header waves-effect waves-cyan"><i class="mdi-action-view-carousel"></i><?php echo _('节点');?></a>
						<div class="collapsible-body">
							<ul>
								<li><a href="<{:U('Home/User/node_list')}>"><?php echo _('节点列表');?></a></li>
								<li><a href="/"><?php echo _('众筹节点');?></a></li>
							</ul>
						</div>
					</li>
				</ul>
			</li>
			<li class="bold"><a href="<{:U('Home/User/shop')}>" class="waves-effect waves-cyan"><i class="mdi-action-shop"></i><?php echo _('商店');?></a></li>
			<li class="bold"><a href="<{:U('Home/User/exchange')}>" class="waves-effect waves-cyan"><i class="mdi-action-wallet-giftcard"></i><?php echo _('兑换');?></a></li>
			<li class="bold"><a href="<{:U('Home/User/miao')}>" class="waves-effect waves-cyan"><i class="material-icons">&#xE91D;</i><?php echo _('喵币');?></a></li>
			<li class="bold"><a href="<{:U('Home/User/purchase_info')}>" class="waves-effect waves-cyan"><i class="material-icons">receipt</i><?php echo _('购买&兑换明细');?></a></li>
			<li class="bold"><a href="<{:U('Home/User/annoucement')}>" class="waves-effect waves-cyan"><i class="mdi-action-shop"></i><?php echo _('公告中心');?></a></li>
			<li class="bold"><a href="<{:U('Home/User/message')}>" class="waves-effect waves-cyan"><i class="material-icons">record_voice_over</i><?php echo _('站内信息');?><span class="new badge">4</span></a></li>
			<li class="no-padding">
				<ul class="collapsible collapsible-accordion">
					<li class="bold"><a class="collapsible-header waves-effect waves-cyan"><i class="material-icons">mail</i><?php echo _('工单系统');?></a>
						<div class="collapsible-body">
							<ul>
							    <li><a href="<{:U('Home/User/new_ticket')}>"><?php echo _('新的工单');?></a></li>
								<li><a href="<{:U('Home/User/tickets')}>"><?php echo _('我的工单');?></a></li>
							</ul>
						</div>
					</li>
				</ul>
			</li>
			<li class="bold"><a href="<{:U('Home/User/connection_information')}>" class="waves-effect waves-cyan"><i class="material-icons">wifi_tethering</i><?php echo _('连接信息');?></a></li>
			<li class="bold"><a href="<{:U('Home/User/invite')}>" class="waves-effect waves-cyan"><i class="material-icons">person_add</i><?php echo _('邀请好友');?></a></li>
			<li class="bold"><a href="<{:U('Home/User/record')}>" class="waves-effect waves-cyan"><i class="material-icons">history</i><?php echo _('操作记录');?></a></li>
			<li class="bold"><a href="<{:U('Home/User/system_information')}>" class="waves-effect waves-cyan"><i class="material-icons">info</i><?php echo _('系统信息');?></a></li>
			<li><p>.</p></li>
			</ul>
		<a href="#" data-activates="slide-out" class="sidebar-collapse waves-effect waves-light hide-on-large-only btn-medium"><i class="material-icons">menu</i></a>
	</nav>
	<!-- END LEFT SIDEBAR NAV-->