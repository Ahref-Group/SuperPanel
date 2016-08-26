        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<{:U("Home/User/index")}>"><{$site_name}></a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">

                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-globe fa-fw"></i>  <i class="fa fa-caret-down fa-fw"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li>
                            <a href="#">
                                <div>
                                    简体中文
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                     繁體中文
                                </div>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-language -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <img src="<{:get_gravatar_url($userinfo['email'], 20)}>" alt="<{$userinfo['username']}>" class="img-circle" />
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="<{:U("Home/User/me")}>"><i class="fa fa-user fa-fw"></i> <?php echo _('用户详情');?></a>
                        </li>
                        <li><a href="<{:U("Home/User/setting")}>"><i class="fa fa-gear fa-fw"></i> <?php echo _('用户设置');?></a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="javascript:;" class="logout"><i class="fa fa-sign-out fa-fw"></i> <?php echo _('退出登录');?></a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="<{:U("Home/User/index")}>"><i class="fa fa-user fa-fw"></i> <?php echo _('用户中心');?></a>
                        </li>
                        <li>
                            <a href="<{:U("Home/User/node")}>"><i class="fa fa-server fa-fw"></i> <?php echo _('节点列表');?></a>
                        </li>
                        <li>
                            <a href="<{:U("Home/User/charge")}>"><i class="fa fa-table fa-fw"></i> <?php echo _('充值');?></a>
                        </li>
                        <li>
                            <a href="<{:U("Home/User/shop")}>"><i class="fa fa-shopping-cart fa-fw"></i> <?php echo _('商店');?></a>
                        </li>
                        <li>
                            <a href="<{:U("Home/User/message")}>"><i class="fa fa-comment fa-fw"></i> <?php echo _('站内信息');?><span class="badge pull-right"><{$unread_message_amount}></span></a>
                        </li>
                        <li>
                            <a href="javascript:;"><i class="fa fa-envelope fa-fw"></i> <?php echo _('工单');?><span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="<{:U("Home/User/newTicket")}>"><i class="fa fa-plus fa-fw"></i> <?php echo _('新工单');?></a>
                                </li>
                                <li>
                                    <a href="<{:U("Home/User/tickets")}>"><i class="fa fa-folder fa-fw"></i> <?php echo _('我的工单');?></a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="<{:U("Home/User/invite")}>"><i class="fa fa-user-plus fa-fw"></i> <?php echo _('邀请好友');?></a>
                        </li>
                        <li>
                            <a href="javascript:;"><i class="fa fa-clock-o fa-fw"></i> <?php echo _('记录');?><span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="<{:U('Home/User/economicRecord')}>"> <?php echo _('消费记录');?></a>
                                </li>
                                <li>
                                    <a href="<{:U('Home/User/record')}>"> <?php echo _('操作记录');?></a>
                                </li>
                            </ul>
                        </li>
                                
                        <li>
                            <a href="<{:U('Home/User/setting')}>"><i class="fa fa-clock-o fa-fw"></i> <?php echo _('用户设置');?></a>
                        </li>
                        <li>
                            <a href="<{:U('Home/User/systemInfo')}>"><i class="fa fa-info-circle fa-fw"></i> <?php echo _('系统信息');?></a>
                        </li>
                        <li class="divider"></li>
                        <if condition="$userinfo['is_admin']">
                        <li>
                            <a href="<{:U('Home/Admin/index')}>"><i class="fa fa-dashboard fa-fw"></i> <?php echo _('管理后台');?></a>
                        </li>
                        </if>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>