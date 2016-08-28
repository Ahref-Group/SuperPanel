<!DOCTYPE html>
<html lang="<{:cookie('locale')}>">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>用户详情 - <{$site_name}></title>
    
    <include file="Home@bootstrap/User/head" />

</head>

<body>

    <div id="wrapper">
        <include file="Home@bootstrap/User/nav" />

        <!-- Page Content -->
        <div id="page-wrapper" style="">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">用户详情</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                    <div class="col-lg-4 col-md-6 col-xs-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading">关于我</div>
                            <div class="panel-body">
                                <div class="text-center">
                                    <img src="<{:get_gravatar_url($userinfo['email'])}>" alt="<{$userinfo['username']}>" class="img-circle" />
                                </div>
                                <hr />
                                <table class="table table-striped">
                                    <tr>
                                        <td>注册时间</td>
                                        <td><{$userinfo['reg_date']}></td>
                                    </tr>
                                    <tr>
                                        <td>邀请人</td>
                                        <td><span class="text-danger"><{$inviter}></span></td>
                                    </tr><tr>
                                        <td>用户名</td>
                                        <td><{$userinfo['username']}></td>
                                    </tr><tr>
                                        <td>用户邮箱</td>
                                        <td><{$userinfo['email']}></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="panel panel-red">
                            <div class="panel-heading">安全信息</div>
                            <div class="panel-body">
                                <p>Google 2步验证状态：<{$userinfo['enable_google2factor'] == 0?'<span class="text-danger">未开启</span>':'<span class="text-success">已开启</span>'}></p>
                            </div>
                        </div>
                    </div>
                    <!--/ about me-->
                    <div class="col-lg-8 col-md-6 col-xs-12">
                        <div class="col-lg-4 col-md-12 col-sm-6 col-xs-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-plug fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <h2 id="transfer_total"></h2>
                                            <div>总流量</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12 col-sm-6 col-xs-12">
                            <div class="panel panel-green">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-paw fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <h2><{$userinfo['money']}></h2>
                                            <div>喵币余额</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12 col-sm-6 col-xs-12">
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-paw fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <h2 id="transfer_remain"></h2>
                                            <div>剩余流量</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/ transfer-->
                        <div class="col-xs-12">
                            <div class="panel panel-yellow">
                                <div class="panel-heading">
                                    连接信息
                                </div>
                                <div class="panel-body">
                                    <table class="table table-striped">
                                        <tr>
                                            <td>可用节点数</td>
                                            <td><{$node_amount}></td>
                                        </tr>
                                        <tr>
                                            <td>端口号</td>
                                            <td><{$userinfo['port']}></td>
                                        </tr>
                                        <tr>
                                            <td>连接密码</td>
                                            <td><{$userinfo['passwd']}></td>
                                        </tr>
                                        <tr>
                                            <td>加密方式</td>
                                            <td><{$userinfo['method']}></td>
                                        </tr>
                                        <tr>
                                            <td>协议</td>
                                            <td><{$userinfo['protocol']}></td>
                                        </tr>
                                        <tr>
                                            <td>混淆</td>
                                            <td><{$userinfo['obfs']}></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
<include file="Home@bootstrap/Public/footer" />
</body>

<include file="Home@bootstrap/User/js" />
    <script>
	    transfer_total = <{$userinfo[ 'transfer_enable']}>;
	    transfer_remain = <{$userinfo[ 'transfer_enable']-$userinfo[ 'd']-$userinfo[ 'u']}>;
	    $(document).ready(function(){
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
            return transfer.toFixed(0).toString()+unit;
        }
</script>
</html>
