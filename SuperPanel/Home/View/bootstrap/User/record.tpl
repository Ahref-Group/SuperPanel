<!DOCTYPE html>
<html lang="<{:cookie('locale')}>">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>操作记录 - <{$site_name}></title>
    
    <include file="Home@bootstrap/User/head" />
    <link href="__PUBLIC__/bootstrap/vendor/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="__PUBLIC__/bootstrap/vendor/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">
</head>

<body>

    <div id="wrapper">
        <include file="Home@bootstrap/User/nav" />

        <!-- Page Content -->
        <div id="page-wrapper" style="">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header"><?php echo _('操作记录');?></h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-red">
                            <div class="panel-body">
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <?php echo _('用户敏感操作记录');?>
                            </div>
                            <div class="panel-body">
                                <div class="dataTable_wrapper">
                                    <table class="table table-striped table-bordered table-hover" id="record">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th><?php echo _('操作时间');?></th>
                                                <th><?php echo _('操作IP');?></th>
                                                <th><?php echo _('归属地');?></th>
                                                <th><?php echo _('操作');?></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <foreach name="ip_list" item="vo">
                                            
                                            <switch name="vo.operation">
                                            
                                            <case value="登录">
                                            <tr class="success">
                                                <td><{$key+1}></td>
                                                <td><{$vo.operation_time}></td>
                                                <td><{$vo.ip}></td>
                                                <td><{$vo.location}></td>
                                                <td><{$vo.operation}></td>
                                            </tr>
                                            </case>
                                            </switch>
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
    
    <!-- DataTables JavaScript -->
    <script src="__PUBLIC__/bootstrap/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="__PUBLIC__/bootstrap/vendor/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
    <script src="__PUBLIC__/bootstrap/vendor/datatables-responsive/js/dataTables.responsive.js"></script>
    <script>
    $(document).ready(function() {
    $('#record').DataTable({responsive: true,language:{"url":"__PUBLIC__/bootstrap/vendor/datatables-plugins/i18n/<{:cookie('locale')}>.json"}});
    });
</script>
</html>
