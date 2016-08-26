<!DOCTYPE html>
<html lang="<{:cookie('locale')}>">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<link href="__PUBLIC__/bootstrap/dist/css/timeline.css" rel="stylesheet">
    <title><?php echo _('站内消息');?> - <{$site_name}></title>
    
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
                        <h1 class="page-header"><?php echo _('站内消息');?></h1>
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                Default Panel
                            </div>
                            <div class="panel-body">
                                <p></p>
                            </div>
                        </div>
                            <div class="panel panel-primary">
                                <div class="panel-body">
                                    <ul class="timeline">
                                        <foreach name="messages" item="message">
                                        <if condition="$key%2">
                                        <li>
                                            <div class="timeline-badge <{$message['unread']?"warning":""}>"><{$message['unread']?"<i class='fa fa-envelope'></i>":"<i class='fa fa-check'></i>"}></div>
                                            <div class="timeline-panel">
                                                <div class="timeline-heading">
                                                    <h4 class="timeline-title"><{$message.title}></h4>
                                                    <p><small class="text-muted"><i class="fa fa-clock-o"></i><{$message.time}></small></p>
                                                </div>
                                                <div class="timeline-body">
                                                    <p><{$message.message}></p>
                                                </div>
                                            </div>
                                        </li>
                                        <else />
                                        <li class="timeline-inverted">
                                            <div class="timeline-badge <{$message['unread']?"warning":""}>"><{$message['unread']?"<i class='fa fa-envelope'></i>":"<i class='fa fa-check'></i>"}></div>
                                            <div class="timeline-panel">
                                                <div class="timeline-heading">
                                                    <h4 class="timeline-title"><{$message.title}></h4>
                                                    <p><small class="text-muted"><i class="fa fa-clock-o"></i><{$message.time}></small></p>
                                                </div>
                                                <div class="timeline-body">
                                                    <p><{$message.message}></p>
                                                </div>
                                            </div>
                                        </li>
                                        </if>
                                        </foreach>
                                    </ul>
                                </div>
                                <!-- /.panel-body -->
                            <!-- /.panel -->
                        </div>
                    </div>
                    <!-- /.col-lg-12 -->
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
