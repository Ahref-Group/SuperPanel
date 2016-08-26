<!DOCTYPE html>
<html lang="<{:cookie('locale')}>">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>充值 - <{$site_name}></title>
    
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
                        <h1 class="page-header">充值喵币</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                    <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading">支付宝充值喵币</div>
                            <div class="panel-body">
                                <div class="col-lg-4 col-sm-6 text-center"><h5>充值金额</h5></div>
                                <div class="col-lg-8 col-sm-6">
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><i class="fa fa-cny fa-lg"></i></span>
                                        <input class="form-control" type="text" id="money">
                                        <span class="input-group-addon add">.00</span>
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-5 text-center"><h5>优惠码</h5></div>
                                <div class="col-md-6 col-sm-7">
                                    <div class="form-group">
                                        <input class="form-control" type="text" placeholder="没有就不写" id="promo-code">
                                    </div>
                                </div>
                                <div class="col-md-2 col-sm-12"><button class="btn btn-primary btn-block" id="check-promo-code">验证</button></div>
                            </div>
                            <div class="panel-footer">
                                <span class="text-info">充值<code id="charge-money">0</code>喵币</span>
                                <span class="text-info">实际消费软妹币<code id="real-money">0</code>元</span>
                                <span class="text-danger" id="promo-info"></span>
                                <button class="btn btn-warning btn-sm pull-right real-money" id="charge">充值</button>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="panel panel-red">
                            <div class="panel-heading">支付宝充值记录</div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th><small>#</small></th>
                                                <th><small>订单号</small></th>
                                                <th><small>喵币</small></th>
                                                <th><small>实付金额</small></th>
                                                <th><small>订单状态</small></th>
                                                <th><small>订单创建时间</small></th>
                                                <th><small>订单完成时间</small></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <foreach name="alipay_order_list" item="order">
                                            <tr>
                                                <td><{$key+1}></td>
                                                <td><{$order.out_trade_no}></td>
                                                <td><{$order.money}></td>
                                                <td><{$order.real_money}></td>
                                                <td class="text-center"><{$order['status'] == 'TRADE_FINISHED'?"<i class='fa fa-check'></i>":"<i class='fa fa-close'></i>"}></td>
                                                <td><{$order.creat_time}></td>
                                                <td><{$order.finish_time}></td>
                                            </tr>
                                            </foreach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <div class="panel panel-green">
                            <div class="panel-heading">兑换码充值喵币</div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-3 col-sm-4">兑换码</div>
                                    <div class="col-md-7 col-sm-8">
                                        <div class="form-group">
                                            <input class="form-control" type="text">
                                            </div>
                                    </div>
                                    <div class="col-md-2 col-sm-12">
                                        <button class="btn btn-primary btn-block">检查</button>
                                    </div>
                                </div>
                                <hr />
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="well text-center text-primary">请先检查兑换码</div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-footer text-right">
                                <button class="btn btn-warning btn-sm">兑换</button>
                            </div>
                        </div>
                    </div>
                    </div>
                    <!--/.col-md-6-->
                    
                <!-- /.row -->
                    
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
    
    <script>
        $("#promo-code").keyup(function(){
            if(($("#promo-code").val()).length != 0){
                $("#check-promo-code").attr("disabled", false);
            }
            else{
                $("#check-promo-code").attr("disabled", true);
            };
        });
        
          $("#check-promo-code").click(function(){
            if(($("#promo-code").val()).length != 0){
                promo_code = $('#promo-code').val();
                money = $("#money").val();
                $("#check-promo-code").html('<i class="fa fa-circle-o-notch fa-spin" aria-hidden="true"></i>');
                $.post("<{:U("Home/UserAction/checkPromoCode")}>",{promo_code:promo_code,money:money},function(data){
                    if(data['status']=="success"){
                        $("#real-money").html(data['info']);
                        
                        $("#check-promo-code").html("已验证");
                        $("#check-promo-code").attr("disabled", true);
                    }
                    else{
                        $("#promo-info").html(data['info']);
                        $("#check-promo-code").html("验证");
                    }
                });
            };
        });
        $("#money").keyup(function(){
            if ($("#money").val()<=10)
            {
                money = parseInt($("#money").val()) + 0.5;
                $(".add").html(".50");
            }
            else{
                money = $("#money").val();
                $(".add").html(".00");
            }
            miao =$("#money").val()
            $("#charge-money").html(miao);
            $("#charge").html("充值"+miao+"喵币");
            $("#real-money").html(money);
            $("#promo-info").empty();
            if(($("#money").val()).length != 0){
                $("#charge").attr("disabled", false);
            }
            else{
                $("#charge").attr("disabled", true);
            };
        });
    
        $("#charge").click(function(){
            if(($("#money").val()).length != 0){
                if(($("#money").val())<=1000){
                    promo_code = $('#promo-code').val();
                    money = $("#money").val();
                    $.get("<{:U("Home/UserAction/charge")}>",{promo_code:promo_code,money:money},function(data){
                        window.location.href=data['url'];
                    });
                }
                else{
                    $.alert({title:"错误",
			                content:"充值金额小于1000",
			                confirmButtonClass:"btn-danger",
			                confirmButton: '好的',
			            });
                }
            };
        });
    <if condition="$charge_status eq 1">
    $.confirm({
        title: '充值成功',
        content: '您已充值成功，当前余额为<{$userinfo['money']}> 喵币',
        confirmButton: '查看详细',
        cancelButton: '好的',
        confirmButtonClass:"btn-success",
        });
    </if>
    <if condition="$charge_status eq 2">
    $.confirm({
        title: '充值成功',
        content: '您已充值成功，当前余额为<{$userinfo['money']}> 喵币',
        confirmButton: '查看详细',
        cancelButton: '好的',
        confirmButtonClass:"btn-success",
        });
    </if>
    </script>
</html>
