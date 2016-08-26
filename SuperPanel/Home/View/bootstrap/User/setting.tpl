<!DOCTYPE html>
<html lang="<{:cookie('locale')}>">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><?php echo _('个人设置');?> - <{$site_name}></title>
    
    <include file="Home@bootstrap/User/head" />
    <style>
        .table-center {
            padding:7px 7px 0px 7px;
        }
        .auto-hide span{
            display:none;
        }
    </style>
</head>

<body>

    <div id="wrapper" >
        <include file="Home@bootstrap/User/nav" />

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header"><?php echo _('个人设置');?></h1>
                    </div>
                    <!-- /.col-lg-12 -->
                    <div class="row">
                        <div class="col-md-6 col-xs-12">
                        <!--<div class="col-lg-6 col-md-6">-->
                            <div class="panel panel-primary">
                                <div class="panel-heading"><?php echo _('连接信息设置');?></div>
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover">
                                            <tbody>
                                                <tr>
                                                    <td><?php echo _('端口号');?></td>
                                                    <td class="auto-hide"><span><{$userinfo[ 'port']}></span></td>
                                                </tr>
                                                <tr>
                                                    <td><?php echo _('连接密码');?></td>
                                                    <td class="auto-hide"><span><{$userinfo[ 'passwd']}></span></td>
                                                </tr>
                                                <tr>
                                                    <td><?php echo _('加密方式');?></td>
                                                    <td><{$userinfo[ 'method']}></td>
                                                </tr>
                                                <tr>
                                                    <td><?php echo _('协议');?></td>
                                                    <td><{$userinfo[ 'protocol']}></td>
                                                </tr>
                                                <tr>
                                                    <td><?php echo _('混淆');?></td>
                                                    <td><{$userinfo[ 'obfs']}></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!--/.table-responsive-->
                                </div>
                                <!--/.table-body-->
                                <div class="panel-footer">
                                    <button class="btn btn-success" id="redistribute-port"><?php echo _('申请新端口');?></button>
                                    <button class="btn btn-warning pull-right" data-toggle="modal" data-target="#set-connect-info-modal"><?php echo _('修改链接信息');?></button>
                                </div>
                            </div>
                        <!--</div>-->
                        <!--<div class="col-lg-6 col-md-6">-->
                            <div class="panel panel-green">
                                <div class="panel-heading"><?php echo _('通知提醒设置');?></div>
                                <div class="panel-body">
                                    <div class="form-group">
                                        <label>通知周期设置</label>
                                        <label class="radio-inline">
                                            <input type="radio" >每天
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" >每周
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" >每月
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" >不提醒
                                        </label>
                                    </div>
                                </div>
                                <div class="panel-footer">
                                    <div class="text-right">
                                        <button class="btn btn-warning btn-sm">提交</button>
                                    </div>
                                </div>
                            </div>
                        <!--</div>-->
                        </div>
                        
                        <div class="col-md-6 col-xs-12">
                        <!--<div class="col-lg-6 col-md-6">-->
                            <div class="panel panel-yellow">
                                <div class="panel-heading"><?php echo _('账户设置');?></div>
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover">
                                            <tbody>
                                                <tr>
                                                    <td><?php echo _('修改登录密码');?></td>
                                                    <td><button class="btn btn-primary btn-block btn-sm" id="change-password">修改</button></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <button class="btn btn-danger btn-block" id="delete-account">删除账户</button>
                                </div>
                                <!--/.panel-body-->
                            </div>
                        <!--</div>-->
                        
                        <!--<div class="col-lg-6 col-md-6">-->
                            <div class="panel panel-red">
                                <div class="panel-heading"><?php echo _('安全设置');?></div>
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover">
                                            <tbody>
                                                <tr>
                                                    <td><?php echo _('开启谷歌二步验证');?></td>
                                                    <td class="text-center"><{$userinfo['enable_google2factor'] == 0?"<i class='fa fa-close fa-lg text-danger'></i>":"<i class='fa fa-check fa-lg text-success'></i>"}></td>
                                                    <td><if condition="$userinfo['enable_google2factor'] eq 0">
                                                        <button class="btn btn-success btn-block btn-sm set-google2factor" >开启</button>
                                                        <else />
                                                        <button class="btn btn-danger btn-block btn-sm set-google2factor">关闭</button>
                                                        </if>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td><?php echo _('验证邮箱');?></td>
                                                    <td class="text-center"><{$userinfo['verified'] == 0?"<i class='fa fa-close fa-lg text-danger'></i>":"<i class='fa fa-check fa-lg text-success'></i>"}></td>
                                                    <td>
                                                        <if condition="$userinfo['verified'] eq 0">
                                                        <button class="btn btn-primary btn-block btn-sm" id="verify-email">验证</button>
                                                        <else />
                                                        <button class="btn btn-primary btn-block btn-sm" disabled>已验证</button>
                                                        </if>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!--/.panel-body-->
                            </div>
                        <!--</div>-->
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

<div class="modal fade" id="google2factor" tabindex="-1" role="dialog" aria-labelledby="google2factorlabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
            <h4 class="modal-title" id="google2factorlabel">Google 两步验证</h4>
            </div>
            <div class="modal-body">
            <div class="row">
                <div class="col-md-6 col-md-offset-3 col-xs-12 text-center">
                    <{$userinfo['enable_google2factor'] == 0?'<h3>开启二次验证将大大提高您的账户的安全性</h3>':'<h3 class="text-success">您已开启二步验证</h3>'}>
                    <div id="qrcode"></div>
                    <div class="text-center">
                        <h3>使用方法</h3>
                        <p class="text-info">使用google身份验证器扫描以上二维码，或输入一下密钥</p>
                        <code id="google-secret"><{$secret}></code>
                        <div class="form-group">
                            <input class="form-control" placeholder="请输入身份验证器中显示的动态密匙" id="code">
                            <hr />
                            <button class="btn btn-primary" id="check">测试</button>
                            <{$userinfo['enable_google2factor'] == 0?'<button class="btn btn-success" id="enable-google2factor">启用</button>':'<button class="btn btn-danger" id="disable-google2factor">取消两步验证</button>'}>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div>
</div><!-- /.modal -->

<div class="modal fade" id="set-connect-info-modal" tabindex="-1" role="dialog" aria-labelledby="set-connect-info-label" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
            <h4 class="modal-title" id="set-connect-info-label">修改连接信息</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>链接密码</label>
                    <input type="text" id="connect-passwd" class="form-control" value="<{$userinfo['passwd']}>">
                </div>
                <div class="form-group">
                    <label>加密方式</label>
                    <input type="text" id="connect-method" class="form-control" value="<{$userinfo['method']}>">
                </div>
                <div class="form-group">
                    <label>链接密码</label>
                    <input type="text" id="connect-protocol" class="form-control" value="<{$userinfo['protocol']}>">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-default" id="submit-connect-info">提交</button>
            </div>
        </div><!-- /.modal-content -->
    </div>
</div><!-- /.modal -->

    <include file="Home@bootstrap/Public/footer" />
</body>
<include file="Home@bootstrap/User/js" />
    <script>var public_key = "<{:C('PUBLIC_KEY')}>";</script>
    <script src="__PUBLIC__/js/rsa/BigInt.js"></script>
	<script src="__PUBLIC__/js/rsa/Barrett.js"></script>
	<script src="__PUBLIC__/js/rsa/RSA.js"></script>
    <script src="__PUBLIC__/js/rsa/password.js"></script>
    <script src="__PUBLIC__/js/qrcode/jquery.qrcode.min.js"></script>
    <script>
    $(document).ready(function(){
        $("#qrcode").qrcode("<{$url}>");
        
        $(".auto-hide").mouseover(function(){
            $(this).children().show();
        });
        $(".auto-hide").mouseleave(function(){
            $(this).children().hide();
        });
    });
        
        $('#redistribute-port').click(function(){
            $.post('<{:U('Home/UserAction/redistributePort')}>',{},function(data){
                if(data['status'] == 'success'){
                    $.alert("端口修改成功，您的新端口为"+data['info']);
                }
            });
        });
    
        $(".set-google2factor").click(function(){
            $('#google2factor').modal('show');
        })
        
        $('#enable-google2factor').click(function(){
            //开启验证需要先验证，确保用户已经能正常使用
            $("#enable-google2factor").html('<i class="fa fa-circle-o-notch fa-spin" aria-hidden="true"></i>');
            $.post("<{:U('Home/UserAction/enableGoogle2Factor')}>",{code:$("#code").val()},function(data){
                if(data['status'] == 'success'){
                    $("#enable-google2factor").html('取消两步验证');
                    $.alert("开启成功");
                }
                else
                    $("#enable-google2factor").html('开启');
                    $.alert("开启失败");
            });
        });
        
        $('#disable-google2factor').click(function(){
            $("#disable-google2factor").html('<i class="fa fa-circle-o-notch fa-spin" aria-hidden="true"></i>');
            $.post("<{:U('Home/UserAction/disableGoogle2Factor')}>",{code:$("#code").val()},function(data){
                if(data['status'] == 'success'){
                    $("#disable-google2factor").html('开启');
                    $.alert("关闭成功");
                }
                else
                    $("#disable-google2factor").html('取消两步验证');
                    $.alert("关闭失败");
            });
        });
        
        
        $('#check').click(function(){
            $("#check").html('<i class="fa fa-circle-o-notch fa-spin" aria-hidden="true"></i>');
            $.post("<{:U('Home/UserAction/checkGoogle2FactorCode')}>",{code:$("#code").val()},function(data){
                if(data['status'] == 'success'){
                    $("#check").html('测试成功');
                    
                }
                else
                    $("#check").html('测试失败');
            });
        });
        
        $("#change-password").click(function(){
            $.confirm({'title':"验证密码",
                content:'您需要先验证您的身份\
                <div class="form-group"><label>请输入旧密码</label>\
                <input autofocus type="password" id="password-confirm" placeholder="旧密码" class="form-control"></div>',
                confirm:function(){
                    var input = this.$b.find('#password-confirm');
                    if(input.val() != ''){
                        loading = $.dialog({title:"验证密码",content:"<p class='text-center'><i class='fa fa-spinner fa-spin fa-5x'></i></p>"});
                        password = cmdEncryptClick(input.val());
                        $.post("<{:U("Home/UserAction/changePassword")}>", {password:password},function(data){
                            loading.close();
                            if(data['status'] == 'success')
                                $.alert({content:"验证成功，请点击下方按钮修改信息",confirm:function(){window.location.href=data['info']}});
                            else
                                $.alert("验证失败，失败原因为："+data['info']);
                        });
                        }
                    }
                });
        });
        
        $('#delete-account').click(function(){
            $.confirm({
            title: '确认删除？',
            content: '<p class="text-danger">此操作将会删除您所有的日志、记录，清空您的密码、剩余流量和喵币余额</p><p>但是，为了保证我们数据的完整性，\
            <span class="text-danger">您的用户名和邮箱不会被删除！</span></p><p class="text-success">当然，您所邀请的用户不会受到影响</p><p class="text-danger">要确认此操作，请在下方输入您的密码</p>\
            <div class="form-group"><label>删除确认</label>\
    <input autofocus type="password" id="delete-confirm" placeholder="请输入密码" class="form-control"></div>',
            confirm: function () {
                var input = this.$b.find('#delete-confirm');
                if (input.val() != '') {
                    loading = $.dialog({title:"删除中",content:"<p class='text-center'><i class='fa fa-spinner fa-spin fa-5x'></i></p>"});
                    password = cmdEncryptClick(input.val());
                    $.post("<{:U("Home/UserAction/deleteUser")}>", {password:password},function(data){
                            loading.close();
                            if(data['status'] == 'success')
                                $.alert("删除成功");
                            else
                                $.alert("删除失败，未作任何更改"+data['info']);
                        });
                } else {
                    $.alert('由于您的输入不正确，您的删除操作被取消');
                }
            }
        });
        })
    </script>
</html>
