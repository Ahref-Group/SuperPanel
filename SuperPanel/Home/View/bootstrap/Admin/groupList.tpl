<!DOCTYPE html>
<html lang="<{:cookie('locale')}>">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>管理后台 - <{$site_name}></title>
    
    <include file="Home@bootstrap/User/head" />
    <link href="__PUBLIC__/bootstrap/vendor/icheck/skins/square/blue.css" rel="stylesheet">
</head>

<body>

    <div id="wrapper">
        <include file="Home@bootstrap/Admin/nav" />

        <!-- Page Content -->
        <div id="page-wrapper" style="">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">组设置</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-6 col-md-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading">组设置</div>
                            <div class="panel-body">
                                <form role="form">
                                    <div class="form-group">
                                        <label>组id</label>
                                        <input type="text" class="form-control" disabled="disabled" value="<{$gid}>">
                                    </div>
                                    <div class="form-group">
                                        <label>组名称</label>
                                        <input type="text" class="form-control" disabled="disabled" value="balabala">
                                    </div>
                                    <div class="form-group">
                                        <label>组介绍</label>
                                        <textarea class="form-control" row="2" disabled="disabled">
balabala
                                        </textarea>
                                    </div>
                                    <strong>包含的节点(节点id)</strong>
                                    <div class="well">
                                        
                                        <foreach name="group_node" item="node">
                                            <label><{$node.nid}></label> 
                                            <input type="checkbox" class="node-id" data-nid="<{$node.nid}>" <{$node['in']?'checked="checked"':''}> name="nodes">
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                        </foreach>
                                    </div>
                                </form>
                            </div>
                            <div class="panel-footer text-right">
                                <button class="btn btn-warning" id="submit">提交</button>
                            </div>
                        </div>
                        <!--/.panel-->
                        <div class="panel panel-info">
                            <div class="panel-heading">组列表</div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-condensed table-hover text-center">
                                        <thead>
                                            <tr>
                                                <th class="text-center">组id</th>
                                                <th class="text-center">节点名称</th>
                                                <th class="text-center">编辑</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <foreach name="group_list" item="group">
                                            <tr>
                                                <td><code><{$group.gid}></code></td>
                                                <td><{$group.group_name}></td>
                                                <td><a href="<{:U('Home/Admin/groupList', ['gid'=>$group['gid']])}>" class="btn btn-circle btn-xs btn-warning"><i class="fa fa-edit fa-fw"></i></a></td>
                                            </tr>
                                            </foreach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--/.col-lg-6 col-md-12-->
                    <div class="col-lg-6 col-md-12">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                节点列表
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-condensed table-hover text-center">
                                        <thead>
                                            <tr>
                                                <th class="text-center">节点id</th>
                                                <th class="text-center">节点地址</th>
                                                <th class="text-center">节点名称</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <foreach name="node_list" item="node">
                                            <tr>
                                                <td><code><{$node.nid}></code></td>
                                                <td><{$node.address}></td>
                                                <td><{$node.node_name}></td>
                                            </tr>
                                            </foreach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--/.row-->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
<include file="Home@bootstrap/Public/footer" />



</body>
<include file="Home@bootstrap/User/js" />
    <script src="__PUBLIC__/bootstrap/vendor/icheck/icheck.js">
        
    </script>
<script>
$(document).ready(function(){
  $('input').iCheck({
    checkboxClass: 'icheckbox_square-blue',
    increaseArea: '20%' // optional
  });
});

$("#submit").click(function(){
    var checked_node = "";
    $(".node-id").each(function() {  
        if ($(this).parent().hasClass("checked")) {  
            checked_node += "," + $(this).attr('data-nid');  
        }  
    });
    
    $.post("<{:U('Home/AdminAction/editGroupNode')}>", {gid:"<{$gid}>", nid:checked_node},function(data){
        if(data['status'] == 'success'){
            $.alert("提交成功！");
        }
    })
    
    //alert(checked_node);
    //$('input').iCheck('toggle');
});
</script>
</html>
