<!DOCTYPE html>
<html lang="<{:cookie('locale')}>">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><?php echo _('邀请好友');?> - <{$site_name}></title>
    
    <include file="Home@bootstrap/User/head" />

</head>

<body>

    <div id="wrapper">
        <include file="Home@bootstrap/User/nav" />

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header"><?php echo _('邀请好友');?></h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="panel panel-yellow">
                            <div class="panel-heading"><?php echo _('邀请码公告');?></div>
                            <div class="panel-body"><{$announcement['user_invite']}></div>
                        <!--</div>-->
                        <!--<div class="panel panel-red">-->
                        <!--    <div class="panel-body">-->
                        <!--        您当前拥有<code>1</code>个未使用的邀请码，还可以生成<code>2</code>个邀请码-->
                        <!--    </div>-->
                            <div class="panel-footer">
                                您当前拥有<code><{:sizeof($invite_code__list)}></code>个未使用的邀请码，还可以生成<code><{$userinfo[ 'invite_code_amount']}></code>个邀请码
                                <div class="text-right">
                                    <button class="btn btn-warning btn-sm" id="generate" <if condition="$userinfo['invite_code_amount'] eq 0">disabled</if> ><?php echo _('点我生成');?></button>
                                    </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading"><?php echo _('您的邀请码');?></div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr>
                                                <th class="text-center">#</th>
                                                <th class="text-center"><?php echo _('邀请码');?></th>
                                                <th class="text-center"><?php echo _('包含喵币');?></th>
                                                <th class="text-center"><?php echo _('操作');?></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <foreach name="invite_code__list" item="vo">
                                            <tr>
                                                <td><{$key+1}></td>
                                                <td><a href="javascript:void(0);"><{$vo.code}></a></td>
                                                <td><{$vo.money}><?php echo _('个');?></td>
                                                <td><button data-clipboard-text="<{$vo.code}>" class="copy-code btn btn-warning btn-sm"><?php echo _('点我复制');?></button></td>
                                            </tr>
                                            </foreach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="panel-footer">
                                <small>*<?php echo _('邀请链接可以直接点击使用');?></small>
                            </div>
                        </div>
                        <!--/.panel-->
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.5.12/clipboard.min.js"></script>
    <script>
        clipboard = new Clipboard('.copy-code');
        clipboard.on('error', function(e) {
        $.alert({title:'成功',content:"复制失败！<br />当前仅支持Chrome 42+、Firefox 41+、IE 9+、Opera 29+浏览器",confirmButton: '好的',confirmButtonClass: 'btn-danger'});
        });
        
        clipboard.on('success', function(e){
            $.alert({title:'成功',content:"复制成功！",confirmButton: '好的',confirmButtonClass: 'btn-success'});
            })
        
        $('#generate').click(function(){
                $.confirm({
                    title:"生成邀请码",
                    content:"请输入您要生成邀请码的数量\
                            <p class='text-info'><small>&bull;您当前有 <{$userinfo['invite_code_amount']}> 个邀请码</small></p>\
                            <div class='form-group'>\
                                <input autofocus type='text' id='amount' placeholder='请输入您要生成邀请码的数量' class='form-control'></div>\
                                <input type='text' id='miao' placeholder='每个邀请码包含的喵币' class='form-control'></div>",
                    confirmButton:"生成",
                    cancelButton:"取消",
                    confirmButtonClass: 'btn-success',
                    cancelButtonClass: 'btn-danger',
                    confirm:function(){
                        this.$confirmButton.html('<i class="fa fa-circle-o-notch fa-spin" aria-hidden="true"></i>');
                        if(($("#amount").val()).lenth == 0){
                            return false;
                        };
                        if(($("#miao").val()).lenth == 0){
                            return false;
                        };
                        post_code();
                    }
                });
            });
        function post_code(){
						$.post("<{:U('Home/UserAction/invite')}>", 
						{
							invite_code_amount:$('#amount').val(),
							money:$('#miao').val(),
						},
						function(data) {
							if (data['status'] == 'success') {
								$.alert({
									title: "<?php echo _('成功');?>",
									content: data['info'],
									confirmButton: '好的',
									confirmButtonClass: 'btn-success',
				    			});
								window.setTimeout("location.href='<{:U('Home/User/invite')}>'", 2000);
							} 
							else {
								$.alert({
									title: "<?php echo _('出现问题');?>",
				    				content: data['info'],
									confirmButton: '好的',
									confirmButtonClass: 'btn-success',
								});
							};
						});
	    }
    </script>
</html>
