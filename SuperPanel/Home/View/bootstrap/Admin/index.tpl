<!DOCTYPE html>
<html lang="<{:cookie('locale')}>">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>管理后台 - <{$site_name}></title>
    
    <include file="Home@bootstrap/User/head" />

</head>

<body>

    <div id="wrapper">
        <include file="Home@bootstrap/Admin/nav" />

        <!-- Page Content -->
        <div id="page-wrapper" style="">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">站点概况</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="col-lg-12 col-sm-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            用户
                        </div>
                        <div class="panel-body">
                            <div class="col-lg-3 col-md-6 col-sm-12">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-xs-3">
                                                <i class="fa fa-users fa-5x"></i>
                                            </div>
                                            <div class="col-xs-9 text-right">
                                                <div class="huge"><{$user_amount}></div>
                                                <div>位用户</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12">
                                <div class="panel panel-green">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-xs-3">
                                                <i class="fa fa-plug fa-5x"></i>
                                            </div>
                                            <div class="col-xs-9 text-right">
                                                <div class="huge">21</div>
                                                <div>位在线用户</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12">
                                <div class="panel panel-yellow">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-xs-3">
                                                <i class="fa fa-pencil fa-5x"></i>
                                            </div>
                                            <div class="col-xs-9 text-right">
                                                <div class="huge"><{$checked_user_amount}></div>
                                                <div>位用户今日已签到</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 col-sm-12">
                                <div class="panel panel-info ">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-xs-3">
                                                <i class="fa fa-paper-plane fa-5x"></i>
                                            </div>
                                            <div class="col-xs-9 text-right">
                                                <div class="huge"><{$checked_user_amount}></div>
                                                <div>位用户使用了服务</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <a href="<{:U('Home/Admin/user')}>">
                                <span class="pull-left">用户管理</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            </a>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-sm-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            流量
                        </div>
                        <div class="panel-body">
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <div class="panel panel-info">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-xs-3">
                                                <i class="fa fa-area-chart fa-5x"></i>
                                            </div>
                                            <div class="col-xs-9 text-right">
                                                <div class="huge">265G</div>
                                                <div>总流量</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-12">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-xs-3">
                                                <i class="fa fa-exchange fa-5x"></i>
                                            </div>
                                            <div class="col-xs-9 text-right">
                                                <div class="huge">13G</div>
                                                <div>今日流量</div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <a href="#">
                                <span class="pull-left">查看详细</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            </a>
                            <div class="clearfix"></div>
                        </div>
                        
                    </div>
                </div>
                <div class="col-lg-6 col-sm-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            组和节点
                        </div>
                        <div class="panel-body">
                            <div class="col-lg-6 col-sm-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-xs-3">
                                                <i class="fa fa-cogs fa-5x"></i>
                                            </div>
                                            <div class="col-xs-9 text-right">
                                                <div class="huge"><{$group_amount}></div>
                                                <div>个组</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-footer">
                                        <a href="<{:U("Home/Admin/group")}>">
                                            <span class="pull-left">组管理</span>
                                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                        </a>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-sm-12">
                                <div class="panel panel-green">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-xs-3">
                                                <i class="fa fa-server fa-5x"></i>
                                            </div>
                                            <div class="col-xs-9 text-right">
                                                <div class="huge"><{$node_amount}></div>
                                                <div>个节点</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-footer">
                                        <a href="<{:U("Home/Admin/node")}>">
                                            <span class="pull-left">节点管理</span>
                                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                        </a>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-sm-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            工单系统
                        </div>
                        <div class="panel-body">
                            <div class="col-lg-6 col-sm-12">
                                <div class="panel panel-yellow">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-xs-3">
                                                <i class="fa fa-support fa-5x"></i>
                                            </div>
                                            <div class="col-xs-9 text-right">
                                                <div class="huge">1</div>
                                                <div>个未回复工单</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-footer">
                                        <a href="#">
                                            <span class="pull-left">立即回复</span>
                                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                        </a>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 com-sm-12">
                                <div class="panel panel-info">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-xs-3">
                                                <i class="fa fa-ticket fa-5x"></i>
                                            </div>
                                            <div class="col-xs-9 text-right">
                                                <div class="huge">7</div>
                                                <div>个工单</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-footer">
                                        <a href="#">
                                            <span class="pull-left">查看全部</span>
                                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                        </a>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-sm-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            安全系统
                        </div>
                        <div class="panel-body">
                            <div class="col-lg-6 col-md-12">
                                <div class="panel panel-red">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-xs-3">
                                                <i class="fa fa-warning fa-5x"></i>
                                            </div>
                                            <div class="col-xs-9 text-right">
                                                <div class="huge">0</div>
                                                <div>个警告</div>
                                            </div>
                                        </div>
                                    </div>                                       
                                    <div class="panel-footer">
                                        <a href="#">
                                            <span class="pull-left">查看详情</span>
                                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                        </a>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-12">
                                <div class="panel panel-red">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-xs-3">
                                                <i class="fa fa-shield fa-5x"></i>
                                            </div>
                                            <div class="col-xs-9 text-right">
                                                <div class="huge">0</div>
                                                <div>个封禁IP</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-footer">
                                        <a href="#">
                                            <span class="pull-left">查看详情</span>
                                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                        </a>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
<include file="Home@bootstrap/Public/footer" />



</body>
<include file="Home@bootstrap/User/js" />
</html>
