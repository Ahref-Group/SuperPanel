<!DOCTYPE html>
<html lang="<{:cookie('locale')}>">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>分组管理 - <{$site_name}></title>
    
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
                        <h1 class="page-header">分组管理</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                    
                    <div class="col-md-6">
                        <div class="panel panel-primary">
                            <div class="panel-heading">添加分组</div>
                            <div class="panel-body">
                                <form role="form">
                                    <div class="form-group">
                                        <label>分组名称</label>
                                        <input type="text" placeholder="请输入分组名称" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label>分组介绍</label>
                                        <textarea class="form-control" row="3"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>分组类型</label>
                                        <select class="form-control">
                                            <option value="expiration">周期</option>
                                            <option value="traffic">流量</option>
                                            <option value="funding">众筹</option>
                                        </select>
                                    </div>
                                </form>
                            </div>
                            <div class="panel-footer text-right">
                                <btn class="btn btn-sm btn-warning">提交</btn>
                            </div>
                        </div>
                        <!--/.panel-->
                    </div>
                    <div class="col-md-6">
                        <div class="panel panel-green">
                            <div class="panel-heading">分组列表</div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>名称</th>
                                                <th>类型</th>
                                                <th style="width:10px" class="text-center"><i class="fa fa-chevron-up"></i></th>
                                                <th style="width:10px" class="text-center"><i class="fa fa-chevron-down"></i></th>
                                                <th style="width:10px" class="text-center"><i class="fa fa-trash"></i></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <foreach name="group_list" item="group">
                                            <tr>
                                                <td><{$key+1}></td>
                                                <td><{$group.group_name}></td>
                                                <td><{$group.type}></td>
                                                <td><btn class="btn btn-circle btn-warning"><i class="fa fa-fw fa-chevron-up"></i></btn></td>
                                                <td><btn class="btn btn-circle btn-warning"><i class="fa fa-fw fa-chevron-down"></i></btn></td>
                                                <td><btn class="btn btn-circle btn-warning"><i class="fa fa-fw fa-trash"></i></btn></td>
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
</html>
