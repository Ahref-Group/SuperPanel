<!DOCTYPE html>
<html lang="<{:cookie('locale')}>">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>节点列表 - <{$site_name}></title>
    
    <include file="Home@bootstrap/User/head" />
        
    <style>
        th{
        text-align:center;
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
                        <h1 class="page-header">节点列表</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                    <div class="col-lg-12">
                        <div class="table-responsive">
                            <table class="table table-condensed table-hover text-center">
                                <thead>
                                    <tr>
                                        <th style="width: 30px">#</th>
                                        <th style="width: 30px">ID</th>
                                        <th>节点名称</th>
                                        <th>节点流量</th>
                                        <th>节点状态</th>
                                        <th>可见</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <foreach name="node_list" item="node">
                                    <tr class="<{$node['status'] == 0?"success":($node['status'] == 1?'warning':'danger')}>">
                                        <td><{$key+1}></td>
                                        <td><{$node.nid}></td>
                                        <td><{$node.node_name}></td>
                                        <td>123456KB/45456sKB</td>
                                        <td><{$node['status'] == 0?"正常":($node['status'] == 1?'调试中':'异常')}></td>
                                        <td><{$node['visibal']?'<i class="fa fa-check">':'<i class="fa fa-close">'}></td>
                                        <td>
                                            <button class="btn btn-xs btn-success edit-node" data-nid="<{$node.nid}>">编辑</button>
                                            <button class="btn btn-xs btn-danger delete-node" data-nid="<{$node.nid}>">删除</button>
                                        </td>
                                    </tr>
                                    </foreach>
                                </tbody>
                            </table>
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
<script>
    $(".delete-node").click(function(){
        nid = $(this).attr("data-nid");
        
        $.post("<{:U('Home/AdminAction/deleteNode')}>", {nid:nid}, function(data){
            if(data['status'] == 'success')
                $.alert("删除成功！");
            else
                $.alert("删除失败，原因："+data['info']);
        })
    });
</script>
</html>
