        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<{:U('Home/Admin/index')}>"><{$site_name}> 管理后台</a>
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
                                    <img src="__PUBLIC__/bootstrap/img/zh_CN.png" /> 简体中文
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <img src="__PUBLIC__/bootstrap/img/zh_TW.png" /> 繁體中文
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <img src="__PUBLIC__/bootstrap/img/en_US.png" /> English
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <img src="__PUBLIC__/bootstrap/img/ja_JP.png" /> 日本語
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
                        <li><a href="javascript:;" class="logout"><i class="fa fa-sign-out fa-fw"></i> 退出登录</a>
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
                            <a href="<{:U("Home/Admin/index")}>"><i class="fa fa-dashboard fa-fw"></i> 仪表盘</a>
                        </li>
                        <li>
                            <a href="<{:U("Home/Admin/node")}>"><i class="fa fa-server fa-fw"></i> 节点管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="<{:U("Home/Admin/editNode")}>"><i class="fa fa-plus fa-fw"></i> 添加节点</a>
                                </li>
                                <li>
                                    <a href="<{:U("Home/Admin/nodeList")}>"><i class="fa fa-list fa-fw"></i> 节点列表</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="<{:U("Home/Admin/group")}>"><i class="fa fa-bars fa-fw"></i> 分组管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="<{:U("Home/Admin/group")}>"><i class="fa fa-plus fa-fw"></i> 添加组</a>
                                </li>
                                <li>
                                    <a href="<{:U("Home/Admin/groupList")}>"><i class="fa fa-list fa-fw"></i> 组设置</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="<{:U("Home/Admin/user")}>"><i class="fa fa-users fa-fw"></i> 用户管理</a>
                        </li>
                        <li>
                            <a href="<{:U("Home/Admin/shopItem")}>"><i class="fa fa-shopping-cart fa-fw"></i> 商品管理</a>
                        </li>
                        <li>
                            <a href="<{:U("Home/Admin/exchangeCode")}>"><i class="fa fa-shopping-cart fa-fw"></i> 兑换码</a>
                        </li>
                        <li>
                            <a href="<{:U("Home/Admin/message")}>"><i class="fa fa-comment fa-fw"></i> 站内信息</a>
                        </li>
                        <li>
                            <a href="<{:U("Home/Admin/tickets")}>"><i class="fa fa-envelope fa-fw"></i> 工单管理</a>
                        </li>
                        <li>
                            <a href="<{:U("Home/Admin/invite")}>"><i class="fa fa-user-plus fa-fw"></i> 邀请管理</a>
                        </li>
                        <li>
                            <a href="<{:U('Home/Admin/setting')}>"><i class="fa fa-cog fa-fw"></i> 站点设置</a>
                        </li>
                        <li>
                            <a href="javascript:;"><i class="fa fa-envelope fa-fw"></i> 公告管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <volist name="announcement_list" id="vo" >
                                <li>
                                    <a href="<{:U("Home/Admin/announcement",array('item'=>$vo['item']))}>"><i class="fa fa-edit fa-fw"></i> <{$vo.introduction}></a>
                                </li>
                                </volist>
                                <li>
                                    <a href="<{:U("Home/Admin/announcement")}>"><i class="fa fa-plus fa-fw"></i> 添加公告</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="<{:U('Home/User/index')}>"><i class="fa fa-arrow-circle-left fa-fw"></i> 返回用户中心</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>