<!DOCTYPE html>
<html lang="<{:cookie('locale')}>">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>公共邀请码管理 - <{$site_name}></title>
    
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
                        <h1 class="page-header">公共邀请码管理</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-6 col-xs-12">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                当前设置的默认值
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th>设置项</th>
                                                <th>值</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>注册后的默认组</td>
                                                <td><{:C('DEFAULT_GROUP')}></td>
                                            </tr>
                                            <tr>
                                                <td>注册后默认组的有效期</td>
                                                <td><{:C('DEFAULT_INVITE_AMOUNT')}> S</td>
                                            </tr>
                                            <tr>
                                                <td>注册后默认流量</td>
                                                <td><{:C('DEFAULT_TRANSFER')}> B</td>
                                            </tr>
                                            <tr>
                                                <td>注册后喵币数量</td>
                                                <td><{:C('DEFAULT_MONEY')}></td>
                                            </tr>
                                            <tr>
                                                <td>注册后邀请码数量</td>
                                                <td><{:C('DEFAULT_INVITE_AMOUNT')}></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!--/.panel-body-->
                            <div class="panel-footer text-info">
                                *默认值可以在站点设置中更改哦
                            </div>
                        </div>
                        <!--/.panel-->
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <h4>当前共有 <code><{$public_invite_code_amount}></code> 个公共邀请码未使用</h4>
                            </div>
                        </div>
                        <!--/.panel-->
                    </div>
                    <!--/.col-lg-6-->
                    <div class="col-lg-6 col-xs-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                发放邀请码
                            </div>
                            <div class="panel-body">
                                <form class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label for="group" class="col-sm-2 control-label">节点组</label>
                                        <div class="col-sm-4" data-toggle="tooltip" data-placement="right" data-trigger="focus" title="注册后用户将自动属于该组，留空则为默认值">
                                            <input type="text" class="form-control" id="group" placeholder="请输入组编号" >
                                        </div>
                                        <label for="expiration" class="col-sm-2 control-label">有效期</label>
                                        <div class="col-sm-4" data-toggle="tooltip" data-placement="auto left" data-trigger="focus" title="注册后用户属于默认组的有效期，留空则为默认值">
                                            <input type="text" class="form-control" id="expiration" placeholder="请输入有效期">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="transfer" class="col-sm-2 control-label">流量</label>
                                        <div class="col-sm-4" data-toggle="tooltip" data-placement="right" data-trigger="focus" title="注册后用户所拥有的流量单位为<strong>GB</strong>，留空则为默认值">
                                            <input type="text" class="form-control" id="transfer" placeholder="请输入流量" >
                                        </div>
                                        <label for="money" class="col-sm-2 control-label">喵币</label>
                                        <div class="col-sm-4" data-toggle="tooltip" data-placement="auto left" data-trigger="focus" title="注册后用户账户内的喵币余额，留空则为默认值">
                                            <input type="text" class="form-control" id="money" placeholder="请输入喵币数量">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="prefix" class="col-sm-2 control-label">前缀</label>
                                        <div class="col-sm-4" data-toggle="tooltip" data-placement="auto left" data-trigger="focus" title="生成的邀请码将以此前缀开头">
                                            <input type="text" class="form-control" id="prefix" placeholder="请输入前缀">
                                        </div>
                                        <label for="amount" class="col-sm-2 control-label">生成数量</label>
                                        <div class="col-sm-4" data-toggle="tooltip" data-placement="auto left" data-trigger="focus" title="生成邀请码的数量">
                                            <input type="text" class="form-control" id="amount" placeholder="请输入邀请码数量">
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="panel-footer">
                                <button class="btn btn-warning btn-sm pull-right" id="generate">生成</button>
                                <div class="clearfix"></div> 
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
    <script>
    $('#generate').click(function(){
        group = $('#group').val();
        expiration= $('#expiration').val();
        transfer= $('#transfer').val();
        money= $('#money').val();
        prefix= $('#prefix').val();
        amount= $('#amount').val();
        $.post('<{:U('Home/AdminAction/generateInviteCode')}>', {group:group,expiration:expiration,transfer:transfer
            ,money:money,prefix:prefix,amount:amount},function(){
            
        });
    })
    
   $(function () { $("[data-toggle='tooltip']").tooltip({html : true }); });
</script>
</html>
