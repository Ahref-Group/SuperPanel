<!DOCTYPE html>
<html lang="<{:cookie('locale')}>">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><?php echo _('系统信息');?> - <{$site_name}></title>
    
    <include file="Home@bootstrap/User/head" />

</head>

<body>

    <div id="wrapper">
        <include file="Home@bootstrap/User/nav" />

        <!-- Page Content -->
        <div id="page-wrapper" style="">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">系统信息</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                    <div class="col-md-6 col-md-offset-3 col-xs-12">
                        <div class="panel panel-primary">
                            <div class="panel-body text-center">
                                <h3>SuperPanel 0.1</h3>
                                <hr />
                                <strong>
                                <p class="text-primary">本站当前有<code>20</code>位注册用户</p>
                                <p class="text-warning">当前有<code>2</code>个用户在线</p>
                                <p class="text-success">过去1小时内，有<code>2</code>个用户在线</p>
                                <p class="text-primary">当前共计<code>20</code>个在线节点</p>
                                <p class="text-danger">共产生<code>536.5 GB</code>流量</p></strong>
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
