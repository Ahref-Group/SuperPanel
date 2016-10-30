<!DOCTYPE html>
<html lang="<{:cookie('locale')}>">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>商品管理 - <{$site_name}></title>
    
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
                        <h1 class="page-header"><{$edit?"编辑商品":"添加商品"}></h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-6 col-md-12">
                        <div class="panel panel-info">
                            <div class="panel-heading">商品管理</div>
                            <div class="panel-body">
                                <form role="form">
                                    <div class="form-group">
                                        <label>项目名称</label>
                                        <input type="text" placeholder="请输入项目名称" class="form-control" id="item-title" value="<{$edit?$item_info['title']:''}>">
                                    </div>
                                    <div class="form-group">
                                        <label>最大销售量</label>
                                        <input type="text" placeholder="超过销售量后商品将隐藏，留空则不限制" class="form-control" id="item-amount" value="<{$edit?$item_info['amount']:''}>">
                                        <p class="text-info">超过最大销售量时商品将隐藏，有效数值范围为1-99999，填写inf或留空即可不限制销售量</p>
                                    </div>
                                    <div class="form-group">
                                        <label>售价</label>
                                        <input type="text" placeholder="请输入售价" class="form-control" id="item-prices" value="<{$edit?$item_info['prices']:''}>">
                                    </div>
                                    <div class="form-group">
                                        <label>商品介绍</label>
                                        <textarea class="form-control" row="3" id="item-introduction"><{$edit?$item_info['introduction']:''}></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>命令</label>
                                        <textarea class="form-control" row="3" id="item-command"><{$edit?$item_info['commands']:''}></textarea>
                                    </div>
                                </form>
                            </div>
                            <div class="panel-footer text-right">
                                <button class="btn btn-info" id="submit"><{$edit?"更新商品":"添加商品"}></button>
                            </div>
                        </div>
                        <div class="panel panel-success">
                            <div class="panel-heading">
                                命令使用方法
                            </div>
                            <div class="panel-body">
                                <div class="well">
                                    每个命令间用|分割
                                    命令格式：<span class="text-danger">命令</span> <span class="text-success">:</span> 节点组id <span class="text-primary">操作符</span> <span class="text-success">值</span>
                                    <br>
                                    节点组id的值请在组列表查看
                                    =将强行修改命令对应字段的值，+-将在原来值得基础上增加或减少相应的值。
                                    可选的操作符因命令而异，每个命令实际可用的操作符详见下列表
                                    <br>
                                    <ul>
                                        <li>time:group(+-=)days 括号内为操作符，可选用+-=，<span class="text-danger">当用户原来不属于该组时，- 操作符无效</span></li>
                                        <li>transfer:group(+-=)gigabytes 括号内为操作符，可选用+-=，-操作符的限制同上</li>
                                        <li>port:=port 括号内为操作符，只可选用=，且":"不可省略</li>
                                    </ul>
                                    transfer和time可以同时出现（即对流量和有效期同时限制），也可以单独出现（另一个条件不限制）
                                    <br>
                                    <span class="text-danger">如果使用端口设置时，上面的最大销售量必须改为1，否则会出现</span>
                                    <hr>
                                    命令示例：
                                    <ul>
                                        <li>将用户设置为1组，流量1GB，无有效期限制：transfer:1+1</li>
                                        <li>将用户设置为5组，流量10GB，有效期1个月：transfer:5+10|time:5=31</li>
                                        <li>设置用户端口为443：port:=443</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--./col-lg-6 col-md-12-->
                    <div class="col-lg-6 col-md-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                已有的商品列表
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-condensed table-hover text-center">
                                        <thead>
                                            <tr>
                                                <th class="text-center">#</th>
                                                <th class="text-center">名称</th>
                                                <th class="text-center">剩余数量</th>
                                                <th class="text-center">售价</th>
                                                <th class="text-center">操作</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <foreach name="items" item="item">
                                            <tr>
                                                <td><{$key+1}></td>
                                                <td><{$item.title}></td>
                                                <td><{$item.amount}></td>
                                                <td><{$item.prices}></td>
                                                <td>
                                                    <a href="<{:U('Home/Admin/shopItem', ['iid'=>$item['iid']])}>" class="btn btn-circle btn-xs btn-success"><i class="fa fa-edit fa-fw"></i></a>
                                                    <button class="btn btn-circle btn-xs btn-danger delete-item" data-iid="<{$item['iid']}>"><i class="fa fa-trash fa-fw"></i></button>
                                                </td>
                                            </tr>
                                            </foreach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="panel-footer text-right">
                                <button class="btn btn-danger">删除所有商品</button>
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
    <script src="__PUBLIC__/js/base64/base64.js"></script>
    <script>
        base64 = new Base64();
        $('#submit').click(function(){
            title = base64.urlsafeencode($("#item-title").val());
            amount = $("#item-amount").val();
            prices = base64.urlsafeencode($('#item-prices').val());
            introduction = base64.urlsafeencode($("#item-introduction").val());
            command = base64.urlsafeencode($('#item-command').val());
            
            $.post("<{:U('Home/AdminAction/editItem')}>", {iid:"<{$iid}>", title:title, amount:amount, prices:prices, 
                introduction:introduction, command:command}, function(data){
                if(data['stauts'] == 'success'){
                    $.alert("成功");
                }
            });
        });
        
        $('.delete-item').click(function(){
            iid = $(this).attr('data-iid');
            $.post("<{:U('Home/AdminAction/deleteItem')}>", {iid:iid}, function(data){
                if(data['status'] == 'success'){
                    $.alert('删除成功');
                }else{
                    $.alert('删除失败，'+data['info']);
                }
            })
        });
        
        $('#delete-all').click(function(){
            $.post("<{:U('Home/AdminAction/deleteAllItem')}>", {confirm:"confrim"}, function(data){
                if(data['status'] == 'success'){
                    $.alert("删除成功");
                }
            })
        });
    </script>
</html>
