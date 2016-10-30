<!DOCTYPE html>
<html lang="<{:cookie('locale')}>">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>兑换码管理 - <{$site_name}></title>
    
    <include file="Home@bootstrap/User/head" />
    <link href="__PUBLIC__/bootstrap/vendor/datepicker/css/bootstrap-datepicker3.standalone.min.css" rel="stylesheet" type="text/css" /> 
</head>

<body>

    <div id="wrapper">
        <include file="Home@bootstrap/Admin/nav" />

        <!-- Page Content -->
        <div id="page-wrapper" style="">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">兑换码管理</h1>
                    </div>
                    <div class="col-lg-6 col-sm-12">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                嵌入信息
                            </div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <label>每个兑换码包含的喵币</label>
                                    <input class="form-control" placeholder="请输入包含的喵币" id="code-money">
                                </div>
                                <div class="form-group">
                                    <label>兑换码到期日期</label>
                                    <input class="form-control" placeholder="请输入到期时间" id="code-expiration">
                                </div>
                                <div class="form-group">
                                    <label>兑换码前缀</label>
                                    <input class="form-control" placeholder="请输入前缀" id="code-prefix">
                                </div>
                                <div class="form-group">
                                    <label>生成数量</label>
                                    <input class="form-control" placeholder="请输入生成数量" id="code-amount">
                                </div>
                            </div>
                            <div class="panel-footer">
                                <button class="btn btn-warning btn-sm pull-right" id="generate">生成兑换码</button>
                                <div class="clearfix"></div> 
                            </div>
                        </div>
                        <!--/.panel-->
                        <div class="panel panel-success">
                            <div class="panel-heading">下载兑换码</div>
                            <div class="panel-body">
                                <p>您可以下载所有未使用的兑换码</p>
                            </div>
                            <div class="panel-footer text-right">
                                <button class="btn btn-warning btn-sm" id="download">下载兑换码</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">未使用的兑换码</div>
                            <div class="panel-body">
                                <if condition="count($exchange_code_list) neq 0">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>兑换码</th>
                                                <th>喵币</th>
                                                <th>过期时间</th>
                                                <th>操作</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <foreach name="exchange_code_list" item="exchange_code">
                                            <tr id="<{$exchange_code.code}>">
                                                <td><{$key+1}></td>
                                                <td><{$exchange_code.code}></td>
                                                <td><{$exchange_code.money}></td>
                                                <td><{:date('Y-m-d' ,$exchange_code['expiration'])}></td>
                                                <td><button class="btn btn-primary delete-code"  data-code="<{$exchange_code.code}>">删除</button></td>
                                            </tr>
                                            </foreach>
                                        </tbody>
                                    </table>
                                </div>
                                <!--/.table-responsive-->
                                <else />
                                    <p>当前没有未使用的兑换码，快在左边添加一个吧！</p>
                                </if>
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
    <script src="__PUBLIC__/bootstrap/vendor/datepicker/js/bootstrap-datepicker.min.js"></script>
    <script src="__PUBLIC__/bootstrap/vendor/datepicker/languages.js"></script>
    <script>
        $('#code-expiration').datepicker({
            format: "yyyy-mm-dd",
            todayBtn: "linked",
            clearBtn: true,
            autoclose: true,
            language: "<{:cookie('locale')}>",
            todayHighlight: true
        });
        
        $('#generate').click(function(){
            amount = $('#code-amount').val();
            expiration = $('#code-expiration').val();
            prefix = $('#code-prefix').val();
            money = $('#code-money').val();
            if(money>0 && amount>0)
            $.post("<{:U('Home/AdminAction/generateExchangeCode')}>", {amount:amount,prefix:prefix,money:money,expiration:expiration},
            function(data){
                if(data['status'] =='success'){
                    $.confirm({
                        "title":"成功",
                        "content":"生成成功，点击确定按钮下载生成的兑换码",
                        confirm:function(){window.location.href = "<{:U('Home/AdminAction/getExchangeCodeByToken')}>?token="+data['info'];}
                        });
                    
                }
            });
        });
        
        $('.delete-code').click(function(){
            code = $(this).attr('data-code');
            $.post("<{:U('Home/AdminAction/deleteExchangeCode')}>", {code:code},function(data){
                if(data['status'] == 'success'){
                    $('#'+code).slideUp(500, function(){$(this).remove()})
                }
            });
        });
    </script>
</html>
