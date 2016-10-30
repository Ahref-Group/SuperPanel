<!DOCTYPE html>
<html lang="<{:cookie('locale')}>">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><?php echo $edit?_('编辑节点'):_('添加节点');?> - <{$site_name}></title>
    
    <include file="Home@bootstrap/User/head" />
    <link href="__PUBLIC__/bootstrap/vendor/bootstrap-toggle/css/bootstrap-toggle.min.css" rel="stylesheet">
    
    <style>
  .toggle.ios, .toggle-on.ios, .toggle-off.ios { border-radius: 20px; }
  .toggle.ios .toggle-handle { border-radius: 20px; }
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
                        <h1 class="page-header"><?php echo $edit?_('编辑节点'):_('添加节点');?></h1>
                    </div>
                    <!-- /.col-lg-12 -->
                    
                    <div class='col-md-6'>
                        <div class="panel panel-primary">
                            <div class="panel-heading">节点信息</div>
                            <div class="panel-body">
                                <form role="form">
                                    <div class="form-group">
                                        <label>节点id</label>
                                        <input type="text" class="form-control" id="nid" disabled="disabled" placeholder="将在提交后自动生成" value="<{:isset($node_info)?$node_info['nid']:''}>"></input>
                                    </div>
                                    <div class="form-group">
                                        <label>节点名称</label>
                                        <input type="text" class="form-control" id="node_name" placeholder="请输入节点名称" value="<{:isset($node_info)?$node_info['node_name']:''}>"></input>
                                    </div>
                                    <div class="form-group">
                                        <label>节点地址</label>
                                        <input type="text" class="form-control" id="address" placeholder="请输入节点地址" value="<{:isset($node_info)?$node_info['address']:''}>"></input>
                                    </div>
                                    <div class="form-group">
                                        <label>节点介绍</label>
                                        <textarea class="form-control" rows="3" id="node_info"><{:isset($node_info)?$node_info['node_info']:''}></textarea> 
                                    </div>
                                    <div class="form-group">
                                        <label>节点状态</label>
                                        <select class="form-control" id="status">
                                            <option <{$edit?($node_info['status'] == 0?'selected="selected"':''):''}> value="0">正常</option>
                                            <option <{$edit?($node_info['status'] == 1?'selected="selected"':''):''}> value="1">调试中</option>
                                            <option <{$edit?($node_info['status'] == 2?'selected="selected"':''):''}> value="2">异常</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>是否可见 </label>
                                        <input type="checkbox" data-toggle="toggle" id="visible" data-on="可见" data-off="隐藏" data-style="ios"
                                            data-onstyle="success" data-offstyle="warning" data-size="small" <{$edit?($node_info['visible']?"checked":''):"checked"}>>
                                    </div>
                                </form>
                            </div>
                            <!--/.panel-body-->
                            <div class="panel-footer text-right">
                                <button class="btn btn-warning" id="submit">提交</button>
                            </div>
                        </div>
                    </div>
                    <div class='col-md-6'>
                        <div class="panel panel-green">
                            <div class="panel-heading">节点列表</div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-condensed table-hover text-center">
                                        <thead>
                                            <tr>
                                                <th class="text-center">#</th>
                                                <th class="text-center">id</th>
                                                <th class="text-center">节点名称</th>
                                                <th class="text-center">操作</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <foreach name="node_list" item="node">
                                            <tr>
                                                <td><{$key+1}></td>
                                                <td><code><{$node.nid}></code></td>
                                                <td><{$node.node_name}></td>
                                                <td>
                                                    <a class="btn btn-sm btn-success" style="color:#fff" href="<{:U('Home/Admin/editNode', ['nid'=>$node['nid']])}>"><i class="fa fa-edit"></i> 编辑</a>
                                                    <button class="btn btn-sm btn-danger delete" data-nid="<{$node.nid}>"><i class="fa fa-trash"></i> 删除</button>
                                                </td>
                                            </tr>
                                            </foreach>
                                        </tbody>
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
    <script src="__PUBLIC__/bootstrap/vendor/bootstrap-toggle/js/bootstrap-toggle.min.js"></script>
    <script>
        $("#submit").click(function(){
            nid = $('#nid').val();
            node_name = $("#node_name").val();
            address = $("#address").val();
            node_info = $("#node_info").val();
            status= $("#status").val();
            visible= $("#visible").is(':checked');
            
            
            $.post("<{:U('Home/AdminAction/editNode')}>", {nid:nid,node_name:node_name, node_info:node_info, address:address, status:status, visible:visible}, function(data){
                if(data['status'] == 'success'){
                    $.alert('添加成功！');
                }
            });
        });
        
        $(".delete").click(function(){
            nid = $(this).attr('data-nid');
            $.post("<{:U('Home/AdminAction/deleteNode')}>", {nid:nid}, function(data){
                if(data['status'] == 'success'){
                    $("[data-nid='"+nid+"']").parent().parent().hide(500, function(){$(this).remove();});
                    
                }
            });
        });
    </script>
</html>
