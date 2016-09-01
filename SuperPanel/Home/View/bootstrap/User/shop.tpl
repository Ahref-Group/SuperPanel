<!DOCTYPE html>
<html lang="<{:cookie('locale')}>">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="__PUBLIC__/bootstrap/css/shop.css" rel="stylesheet">
    <title><{$site_name}> - <?php echo _('商店');?></title>
    
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
                        <h1 class="page-header"><?php echo _('购买商品');?></h1>
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                公告
                            </div>
                            <div class="panel-body">
                                lalala
                            </div>
                        </div>
                    </div>
                </div>
                
                <if condition="count($expiration_items) neq 0">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                包月不限流量哦
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <foreach name="expiration_items" item="item">
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="panel panel-info panel-hover">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-md-8 col-sm-8 text-left">
                                        <div class="huge"><{$item.title}></div>
                                    </div>
                                    <div class="col-md-4 col-sm-4 text-right">
                                        <div class="huge"><i class="fa fa-paw"></i> <{$item.prices}></div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="text-center">
                                    <{$item.introduction}>
                                </div>
                            </div>
                            <div class="panel-footer text-center">
                                <button type="button" class="btn btn-outline btn-success btn-block panel-hover buy" data-iid="<{$item.iid}>">购买</button>
                            </div>
                        </div>
                    </div>
                    <!--/.col-lg-4-->
                    </foreach>
                </div>
                <!--/.row-->
                </if>
                
                <if condition="count($transfer_items) neq 0">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                流量用完了么？快来买流量包吧！
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <foreach name="transfer_items" item="item">
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="panel panel-success panel-hover">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-md-8 col-sm-8 text-left">
                                        <div class="huge"><{$item.title}></div>
                                    </div>
                                    <div class="col-md-4 col-sm-4 text-right">
                                        <div class="huge"><i class="fa fa-paw"></i> <{$item.prices}></div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="text-center">
                                    <{$item.introduction}>
                                </div>
                            </div>
                            <div class="panel-footer text-center">
                                <button type="button" class="btn btn-outline btn-warning btn-block panel-hover buy" data-iid="<{$item.iid}>">购买</button>
                            </div>
                        </div>
                    </div>
                    <!--/.col-lg-4-->
                    </foreach>
                </div>
                <!--/.row-->
                </if>
                
                <if condition="count($port_items) neq 0">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="panel panel-red">
                            <div class="panel-heading">
                                您想换一个特殊的端口吗？没问题！
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <foreach name="port_items" item="item">
                    <div class="col-lg-4 col-md-6 col-sm-12">
                        <div class="panel panel-danger panel-hover">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-md-8 col-sm-8 text-left">
                                        <div class="huge"><{$item.title}></div>
                                    </div>
                                    <div class="col-md-4 col-sm-4 text-right">
                                        <div class="huge"><i class="fa fa-paw"></i> <{$item.prices}></div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="text-center">
                                    <{$item.introduction}>
                                </div>
                            </div>
                            <div class="panel-footer text-center">
                                <button type="button" class="btn btn-outline btn-success btn-block panel-hover buy" data-iid="<{$item.iid}>">购买</button>
                            </div>
                        </div>
                    </div>
                    <!--/.col-lg-4-->
                    </foreach>
                </div>
                <!--/.row-->
                </if>
                
            </div>
        </div>
    </div>
    <!-- 模态框（Modal） -->
<div class="modal fade" id="purchase" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
                <h4 class="modal-title" id="purchaseLabel">购买确认</h4>
            </div>
            <div class="modal-body">
                <h3>请确认您的购买</h3>
                <p>您将要购买的是：</p>
                <h4 id="purchase-title" class="text-center"><i class="fa fa-spinner fa-spin" ></i></h4>
                <div class="well text-center" id="purchase-introduction">
                    <i class="fa fa-spinner fa-spin fa-5x" ></i>
                </div>
                <p>价格 <code id="purchase-prices"><i class="fa fa-spinner fa-spin" ></i></code> 喵币</p>
                <hr />
                <p>您当前可用余额为：<code id="balance" data-balance="<{$userinfo['money']}>"><{$userinfo['money']}></code> 喵币</p>
                <p class="text-danger" id="insufficient-balance" style="display:none;">您当前余额不足，无法完成此次购买！ <span class="text-info"><a href="<{:U('Home/User/charge')}>">点我充值</a></span></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="confirm-purchase">确认购买</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div> 
<include file="Home@bootstrap/Public/footer" />
</body>
<include file="Home@bootstrap/User/js" />
    
    <script>
        
        $('.buy').click(function(){
            iid = $(this).attr('data-iid');
            $.get("<{:U('Home/UserAction/getItemInfo')}>", {iid:iid},function(data){
                if(data['status'] == 'success'){
                    $('#purchase-title').html(data['info']['title']);
                    $('#purchase-prices').html(data['info']['prices']);
                    $('#purchase-introduction').html(data['info']['introduction']);
                    if(parseInt(data['info']['prices']) > parseInt($('#balance').attr('data-balance')))
                    {
                        $("#insufficient-balance").show();
                        $('#confirm-purchase').attr('disabled', true);
                    }
                }
                else{
                $.alert('请求错误');
                }
            });
            $('#purchase').modal('show');
        });
        
        $('#purchase').on('hidden.bs.modal', function(){
            $('#purchase-title').html('<i class="fa fa-spinner fa-spin" ></i>');
            $('#purchase-prices').html('<i class="fa fa-spinner fa-spin" ></i>');
            $('#purchase-introduction').html('<i class="fa fa-spinner fa-spin fa-5x" ></i>');
            $("#insufficient-balance").hide();
            $('#confirm-purchase').attr('disabled', false);
        });
        
        $('#confirm-purchase').click(function(){
            loading = $.dialog("<p class='text-center'><i class='fa fa-spinner fa-spin fa-5x'></i></p>");
            $.post("<{:U('Home/UserAction/purchase')}>", {iid:iid}, function(data){
                loading.close();
                if(data['status'] == 'success'){
                    $.alert("购买成功，当前余额为"+data['info']+'喵币');
                    $('#balance').html(data['info']);
                    $('#balance').attr('data-balance', data['info']);
                }else
                    $.alert("购买失败");
            })
        })
    </script>
</html>
