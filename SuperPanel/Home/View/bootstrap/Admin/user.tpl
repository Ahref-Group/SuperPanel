<!DOCTYPE html>
<html lang="<{:cookie('locale')}>">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>用户管理 - <{$site_name}></title>
    
    <include file="Home@bootstrap/Admin/head" />
    <link href="__PUBLIC__/bootstrap/vendor/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="__PUBLIC__/bootstrap/vendor/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">
    <style>
        #paging-form {
    display: inline-block;
    margin: 0px;
    margin-left: 10px;
    padding: 0px;
}

#paging-value {
    display: inline-block;
    width: 50px;
    height: 45px;
    margin: 0px;
    padding: 0px;
    text-align: center;
}

#paging-button {
    display: inline-block;
    width: 50px;
    margin: 0px;
    padding: 0px;
    text-align: center;
}

#paging-button:hover {
    color: #66ccff;
}
    </style>
</head>

<body>

    <div id="wrapper">
        <include file="Home@bootstrap/Admin/nav" />

        <!-- Page Content -->
        <div id="page-wrapper" style="">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">用户管理</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <div class="col-lg-3 col-sm-6">  
                            <form class="form-horizontal" role="form">
                                <div class="form-group text-center">
                                    <label class="col-sm-4 control-label">显示</label>
                                    <div class="col-sm-8">
                                        <select class="form-control input-sm form" id="display-amount">
                                            <option value="10">10条</option>
                                            <option value="20">20条</option>
                                            <option value="50">50条</option>
                                            <option value="100">100条</option>
                                        </select>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="col-sm-6 col-xs-12 pull-right">
                            <form role="form">
                                <div class="form-group input-group">
                                    <input class="form-control input-sm" type="text" id="search-keyword">
                                        <span class="input-group-btn">
                                        <button class="btn btn-default btn-sm" type="button" id="search"><i class="fa fa-search"></i>
                                        </button>
                                    </span>
                                </div>
                            </form>
                        </div>
                        <div class="clearfix"></div> 
                    </div>
                    <!--/.panel-heading-->
                    <div class="panel-body">

                        <form class="form-inline" role="form">
                        <div class="form-group">
                            <label>排序选项：</label>
                            <label class="radio-inline">
                                <input name="order" class="order form" value="uid" checked="true" type="radio">uid
                            </label>
                            <label class="radio-inline">
                                <input name="order" class="order form" value="port" type="radio">端口号
                            </label>
                            <label class="radio-inline">
                                <input name="order" class="order form" value="reg_date" type="radio">注册时间
                            </label>
                            <label class="radio-inline">
                                <input name="order" class="order form" value="t" type="radio">最后使用时间
                            </label>
                            <label class="radio-inline">
                                <input name="order" class="order form" value="last_check_in_time" type="radio">签到时间
                            </label>
                            <label class="radio-inline">
                                <input name="order" class="order form" value="real_transfer" type="radio">已用流量
                            </label>
                            <label> 排序规则</label>
                                <select class="form-control input-sm form" id="sort">
                                <option value="asc">升序</option>
                                <option value="desc">降序</option>
                            </select>
                        </div>
                        </form>
                        <form class="form-inline" role="form">
                        <div class="form-group">
                                <label>附加选项：</label>
                                <label class="checkbox-inline"><input type="checkbox" class="form" id="transfer-eq-zero">仅显示已用流量为0的</label>
                                <label class="checkbox-inline"><input type="checkbox" class="form" id="miao-not-none">仅显示喵币不为0的</label>
                                <label class="checkbox-inline"><input type="checkbox" class="form" id="user-disabled">仅显示停用账户</label>
                                <label class="checkbox-inline"><input type="checkbox" class="form" id="email-not-verify">仅显示邮箱未验证的</label>
                            </div>
                        </form>
                    </div>
                    <!--/.panel-body-->
                    <div class="panel-footer">
                        已显示<code id="displayed-amount"></code>条结果，总数据<code id="user-amount"></code>条，符合条件的有<code id="available-amount"></code>条
                    </div>
                </div>
                <div class="row">
                    <!--<div class="col-lg-12">-->
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th class="text-center">#</th>
                                        <th class="text-center">uid</th>
                                        <th class="text-center">用户名</th>
                                        <th class="text-center">邮箱</th>
                                        <th class="text-center">端口</th>
                                        <th class="text-center">所属组</th>
                                        <th class="text-center">喵币</th>
                                        <th class="text-center">总流量</th>
                                        <th class="text-center">已用流量</th>
                                        <th class="text-center">注册时间</th>
                                        <th class="text-center">最后使用</th>
                                        <th class="text-center">最后签到</th>
                                        <th class="text-center">邀请人</th>
                                    </tr>
                                </thead>
                                <tbody id="user-list" class="text-center"></tbody>
                                <tfoot>
                                    <tr>
                                        <th class="text-center">#</th>
                                        <th class="text-center">uid</th>
                                        <th class="text-center">用户名</th>
                                        <th class="text-center">邮箱</th>
                                        <th class="text-center">端口</th>
                                        <th class="text-center">所属组</th>
                                        <th class="text-center">喵币</th>
                                        <th class="text-center">总流量</th>
                                        <th class="text-center">已用流量</th>
                                        <th class="text-center">注册时间</th>
                                        <th class="text-center">最后使用</th>
                                        <th class="text-center">最后签到</th>
                                        <th class="text-center">邀请人</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                        <!--/.table-responsive-->
                    <!--</div>-->
                    <!--/.col-lg-12-->
                </div>
                <!--/.row-->
                <div class="row">
                    <!--<div class="panel panel-primary">-->
                    <!--    <div class="panel-body">-->
                            <div class="form-group">
                                <label>选中项：</lable>
                                <label class="radio-inline"><input type="radio">启用</label>
                                <label class="radio-inline"><input type="radio">停用</label>
                                <label class="radio-inline"><input type="radio">删除</label>
                                <label class="radio-inline"><input type="radio">发送消息</label>
                            </div>
                            <button class="btn btn-primary edit" data-uid="'+e['uid']+'">编辑</button>
                            <button class="btn btn-primary">提交</button>
                            
                    <!--    </div>-->
                    <!--</div>-->
                </div>
                <div class="row">
                    <div class="text-center">
                        <ul class="pagination pagination-lg">
                            <li id="previous-page"><a href="javascript:;"><i class="fa fa-angle-double-left"></i></a></li>
                            <li id="next-page"><a href="javascript:;" ><i class="fa fa-angle-double-right"></i> </a></li>
                            <li class="page-item" style="padding-left:10px"><input class="form-control" id="paging-value" type="text" placeholder="0"></li>
                            <li class="page-item"><div class="btn btn-primary" name="button" id="go">Go</div></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
<div class="modal fade" id="userInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
                <h4 class="modal-title" id="connect-info-title">
                   <?php echo _('用户信息');?>
                </h4>
            </div>
            <div class="modal-body" id="connect-info-body">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#ss-info" data-toggle="tab"><?php echo _('账号信息');?></a>
                                </li>
                                <li><a href="#qrcode" data-toggle="tab"><?php echo _('连接信息');?></a>
                                </li>
                                <li><a href="#ss-link-info" data-toggle="tab"><?php echo _('账户设置');?></a>
                                </li>
                                <li><a href="#ss-config" data-toggle="tab"><?php echo _('管理员备注');?></a>
                                </li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane fade in active" id="accountInfo">
                                    <h4><?php echo _('账号信息');?></h4>
                                    <hr />
                                    <div class="table-responsive">
                                        <table class="table table-striped text-center">
                                            <tbody>
                                                <tr>
                                                    <td><?php echo _('用户名');?></td>
                                                    <td id="userName">userName</td>
                                                </tr>
                                                <tr>
                                                    <td><?php echo _('用户邮箱');?></td>
                                                    <td id="userEmail">useremail@superpanel.pw</td>
                                                </tr>
                                                <tr>
                                                    <td><?php echo _('新登录密码');?></td>
                                                    <td id="newPass" placeholder="留空为不更改"></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="tab-pane fade clearfix text-center" id="connectionInfo">
                                    <h4><?php echo _('连接信息');?></h4>
                                    <hr />
                                    <div class="table-responsive">
                                        <table class="table table-striped text-center">
                                            <tbody>
                                                <tr>
                                                    <td><?php echo _('端口号');?></td>
                                                    <td id="port">port</td>
                                                </tr>
                                                <tr>
                                                    <td><?php echo _('连接密码');?></td>
                                                    <td id="connectPass"></td>
                                                </tr>
                                                <tr>
                                                    <td><?php echo _('节点加密方式');?></td>
                                                    <td id="method"></td>
                                                </tr>
                                                <tr>
                                                    <td><?php echo _('节点混淆');?></td>
                                                    <td id="obfs"></td>
                                                </tr>
                                                <tr>
                                                    <td><?php echo _('节点协议');?></td>
                                                    <td id="protocol"></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="accoutSettings">
                                    <h4><?php echo _('账户设置');?></h4>
                                    <hr />
                                    <div class="table-responsive">
                                        <table class="table table-striped text-center">
                                            <tbody>
                                                <tr>
                                                    <td><?php echo _('所属节点组');?></td>
                                                    <td id="group"></td>
                                                </tr>
                                                <tr>
                                                    <td><?php echo _('剩余喵币');?></td>
                                                    <td id="miaoLeft">0</td>
                                                </tr>
                                                <tr>
                                                    <td><?php echo _('账户状态');?></td>
                                                    <td id="state">暂停</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="ss-config">
                                    <h4><?php echo _('管理员备注：');?></h4>
                                    <div class="table-responsive">
                                        <table class="table table-striped text-center">
                                            <tbody>
                                                <tr>
                                                    <td><?php echo _('只有权限管理可见');?></td>
                                                    <td id="group"></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-dismiss="modal"><i class="fa fa-close"></i> <?php echo _('保存');?></button>
                <button type="button" class="btn btn-warning" data-dismiss="modal"><i class="fa fa-close"></i> <?php echo _('关闭');?></button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<include file="Home@bootstrap/Public/footer" />

    </body>
    <include file="Home@bootstrap/User/js" />
        
    <!-- DataTables JavaScript -->
    <script src="__PUBLIC__/bootstrap/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="__PUBLIC__/bootstrap/vendor/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
    <script src="__PUBLIC__/bootstrap/vendor/datatables-responsive/js/dataTables.responsive.js"></script>
    <script>
        $(document).ready(function(){
            update_page();
        })
        
        var draw = 0;               //请求编号
        var current_page = 1;       //当前页数
        var last_page = 1;
        $(".form").change(function(){
            current_page = 1;
            update_page();
        });
        
        function update_page(){
            draw = draw+1;
            display_amount=$("#display-amount").val();
            order = $('.order:checked').val();
            sort = $("#sort").val();
            var ajaxing = $.dialog({title:"Loading",content:"<p class='text-center'><i class='fa fa-circle-o-notch fa-spin fa-5x'></i></p>",closeIcon: false});
            $.get('<{:U('Home/AdminAction/userList')}>',{draw:draw,page:current_page,length:display_amount,order:order,
                sort:sort,miao_not_none:$("#miao-not-none").is(':checked'),email_not_verified:$("#email-not-verify").is(":checked"),
                user_disabled:$("#user-disabled").is(":checked"),transfer_eq_zero:$("#transfer-eq-zero").is(":checked")
                },function(data){
                ajaxing.close();
                if(draw != data['draw']){
                    return;
                }
                $('#user-list').empty();
                data['data'].forEach(function(e){
                    trclass=e['enable']=='1'?'success':'danger';
                    tr = '<tr class="'+trclass+'">\
                        <td><input type="checkbox"></td>\
                        <td>'+e['uid']+'</td>\
                        <td>'+e['username']+'</td>\
                        <td>'+e['email']+'</td>\
                        <td>'+e['port']+'</td>\
                        <td>'+e['plan']+'</td>\
                        <td>'+e['money']+'</td>\
                        <td>'+auto_unit(e['transfer_enable'])+'</td>\
                        <td>'+auto_unit(e['real_transfer'])+'</td>\
                        <td>'+e['reg_date']+'</td>\
                        <td>'+formatDate(e['t'], true)+'</td>\
                        <td>'+formatDate(e['last_check_in_time'],true)+'</td>\
                        <td>'+e['invited_by']+'</td>\
                    </tr>';
                    $('#user-list').append(tr);
                });
                $("#displayed-amount").html(data['length']);
                $("#user-amount").html(data['total']);
                $("#available-amount").html(data['available']);
                
                update_pagination(data['available'], display_amount);
            });
        }
        
        
        function update_pagination(total, length){
            //total 总页数 current 当前页数
            if(current_page == 1){
                //如果是第一页，自然就要禁用上一页的按钮
                $('#previous-page').addClass("disabled");
            }
            else
                $('#previous-page').removeClass("disabled");
            if(current_page * length >= total){
                //显示的是最后一页
                $('#next-page').addClass("disabled");
            }
            else
                $('#next-page').removeClass("disabled");
            last_page = Math.ceil(total/length);
            page_list = new Array(current_page-4, current_page-3, current_page-2, current_page-1, 
                current_page, current_page+1, current_page+2, current_page+3, current_page+4);    //根据当前页码生成五个页数
            $(".page-number").remove(); //删除已经有的页码
            
            
            console.debug(page_list)
            //然后只显示符合要求的
            for(x in page_list){
                console.debug('x='+x+':'+page_list[x]);
                if(page_list[x] > 0 && page_list[x] <= last_page){
                    console.debug('\tx='+x+':'+page_list[x]);
                    //筛选出有效的页，然后输出
                    $("#next-page").before('<li class="page-number" data-page="'+page_list[x]+'"><a href="javascript:;">'+page_list[x]+'</a></li>');
                }
            }
            //别忘了给当前页高亮一下
            $("[data-page="+current_page+"]").addClass('active');
            listen_click();
        }
        
        function listen_click(){
            $(".page-number").click(function(){
                current_page = parseInt($(this).attr("data-page"));
                update_page();
                
            });
        }
        
        
        $("#previous-page").click(function(){
            current_page = current_page - 1;
            update_page();
        });
        $("#next-page").click(function(){
            current_page = current_page + 1;
            update_page();
        });
        
        $('#go').click(function(){
            page = parseInt($("#paging-value").val());
            if(page < 0 || page > last_page){
                $.alert("无效的页码范围，当前筛选条件下允许的页码范围为：0~"+last_page);
                return;
            }
            current_page = page;
            update_page();
        });
        
        function auto_unit(transfer){
            unit = ' B';
            if(transfer <= 1024)
                return transfer+unit;
            else{
                transfer = transfer/1024;
                unit = ' KB';
            }
            if(transfer>1024){
                transfer = transfer/1024;
                unit = ' MB';
            }
            if(transfer>1024){
                transfer = transfer/1024;
                unit = ' GB';
            }
            return transfer.toFixed(2).toString() + unit;
        }
        
        function formatDate(timestamp, format){
            var myDate = new Date(timestamp*1000);
            var year = myDate.getFullYear();
            var month = myDate.getMonth() + 1;
            var day = myDate.getDate();
            var hours = myDate.getHours();
            var minutes = myDate.getMinutes();
            var second = myDate.getSeconds();
            if(format)
                return year + '-' + month + '-' + day;
            else
                return year + '-' + month + '-' + day +' ' +hours + ':' + minutes + ':' + second;
        }
        
        $(".edit").click(function(){
            $("#userInfo").show();
            uid = 0;
            $.get("<{:U('Home/AdminAction/getUserInfo')}>"), {uid:uid},function(data){
                if (data['status'] = 'true'){
                    $("userName").html(data['info']['username']);
                }
                else{
                $.alert("error");
                }
            }
            
        });
        
    </script>
</html>
