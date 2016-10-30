<!DOCTYPE html>
<html lang="<{:cookie('locale')}>">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>用户面板 - <{$site_name}></title>
    
    <include file="Home@bootstrap/User/head" />
    <style>
        .auto-hide span{
            display:none;
        }
    </style>
</head>

<body>

    <div id="wrapper">
        <include file="Home@bootstrap/User/nav" />

        <!-- Page Content -->
        <div id="page-wrapper" style="">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">用户中心</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                    <div class="col-md-6">
                        <if condition="!empty($announcement['user_home'])">
                        <!--仅在有公告时显示面板-->
                        <div class="panel panel-primary">
                            <div class="panel-heading">公告</div>
                            <div class="panel-body">
                                <{$announcement['user_home']}>
                            </div>
                        </div>
                        </if>
                        <div class="panel panel-green">
                            <div class="panel-heading"><i class="fa fa-edit"></i> 签到</div>
                            <div class="panel-body text-center">
                                <strong><if condition="$checkined">你已经签到了，明天再来吧！<else/>今天你签到了么？</if></strong>
                                <p>上次签到时间：<code><{$userinfo['last_check_in_time']?date('Y-m-d H:i:s', $userinfo['last_check_in_time']):"从未签到"}></code></p>
                            </div>
                            <div class="panel-footer text-right">
                                <small class="pull-left text-info">签到可以获得一定数量的喵币哦！</small>
                                <if condition="$checkined">
                                    <button class="btn btn-warning" disabled="disabled">已签到</button>
                                <else/>    
                                    <button class="btn btn-warning" id="checkin">我要签到</button>
                                </if>
                            </div>
                        </div>
                    </div>
                    <!--/.col-md-6-->
                    <div class="col-md-6">
                        <div class="panel panel-info">
                            <div class="panel-heading">使用情况</div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-6 col-xs-12">
                                        <canvas id="transfer" width="100" height="100"></canvas>
                                        <br />
                                    </div>
                                    <div class="col-lg-6 col-xs-12">
                                        <canvas id="days" width="100" height="100"></canvas>
                                        <br />
                                    </div>
                                    <div class="col-md-12"><p>上次使用时间：<code><{$userinfo['t']?date('Y-m-d H:i:s', $userinfo['t']):"从未使用"}></code></p></div>
                                </div>
                            </div>
                            <div class="panel-footer"><button class="btn btn-warning">查看详情</button></div>
                        </div>
                        <div class="panel panel-red">
                            <div class="panel-heading">连接信息</div>
                            <div class="panel-body">
                                <small class="text-warning">鼠标放在表格空白处就可以显示隐藏的端口和密码哦</small>
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <td>端口</td>
                                            <td class="auto-hide"><span><{$userinfo['port']}></span></td>
                                        </tr>
                                        <tr>
                                            <td>密码</td>
                                            <td class="auto-hide"><span><{$userinfo['passwd']}></span></td>
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
                                    </tbody>
                                </table>
                                <small class="text-info">*加密方式、协议和混淆都可以在用户设置中修改</small>
                            </div>
                            <div class="panel-footer"><button class="btn btn-warning">查看我的节点</button></div>
                        </div>
                    </div>
                    <!--/.ol-md-6-->
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
    <script src="//cdn.bootcss.com/Chart.js/2.2.1/Chart.min.js"></script>
<script>
$(document).ready(function(){
        $(".auto-hide").mouseover(function(){
            $(this).children().show();
        });
        $(".auto-hide").mouseleave(function(){
            $(this).children().hide();
        });
    });


var data = {
    labels: [
        "下载流量",
        "上传流量",
        "昨日流量",
        "可用流量"
    ],
    datasets: [
        {
            data: [<{$userinfo[ 'd']}>,<{$userinfo[ 'u']}>,<{$userinfo['real_transfer']}>,<{$userinfo[ 'transfer_enable']}>],
            backgroundColor: [
                "#FF6384",
                "#88629e",
                "#88622e",
                "#00FF00"
            ],
            hoverBackgroundColor: [
                "#FF6384",
                "#88629e",
                "#88622e",
                "#00FF00"
            ]
        }]
};
var ctx = $("#transfer");
var transfer = new Chart(ctx, {
    type:'doughnut',
    data:data,
    options:{
        tooltips: {
            enabled: true,
            tooltipTemplate: "<%if (label){%><%=label%>: <%}%><strong><%= value %></strong>%"
          }
        }
    });
var data = {
    labels: [
        "已用天数",
        "剩余天数",
    ],
    datasets: [
        {
            data: [<{$userinfo[ 'd']}>,<{$userinfo[ 'u']}>],
            backgroundColor: [
                "#FF6384",
                "#88629e"
            ],
            hoverBackgroundColor: [
                "#FF6384",
                "#88629e"
            ]
        }]
};

var ctx = $("#days");
var days = new Chart(ctx, {
    type:'doughnut',
    data:data,
    options:{
        tooltips: {
            enabled: true,
            tooltipTemplate: "<%if (label){%><%=label%>: <%}%><strong><%= value %></strong>%"
          }
        }
    });
    
    
    
    $('#checkin').click(function(){
        $("#checkin").html('<i class="fa fa-circle-o-notch fa-spin" aria-hidden="true"></i>');
        $.post('<{:U('Home/UserAction/checkin')}>',{}, function(data){
            if(data['status'] == 'success'){
                $.alert(data['info']);
                $('#checkin').html("已签到");
                $('#checkin').attr('disabled', true);
            }
            else
                $.alert('额，签到失败了，原因是：'+data['info']);
        });
    });
</script>
</html>
