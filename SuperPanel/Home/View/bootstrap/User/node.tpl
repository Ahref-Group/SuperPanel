<!DOCTYPE html>
<html lang="<{:cookie('locale')}>">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><?php echo _('节点列表');?> - <{$site_name}></title>
    
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
                        <h1 class="page-header"><?php echo _('节点列表');?></h1>
                        <div class="panel panel-info">
                            <div class="panel-body">
                                <div class="well">
                                    heheh
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-lg-3" >
                        <div class="panel panel-primary visible-lg">
                            <div class="panel-heading"><?php echo _('您所属的组');?></div>
                            <div class="panel-body">
                                <foreach name="group_list" item="vo">
                                    <if condition="in_array($vo['gid'], $user_group)">
                                        <a href="#" class="list-group-item"><i class="fa fa-server"></i> <{$vo.group_name}></a>
                                    </if>
                                </foreach>
                            </div>
                        </div>
                        
                        <div class="panel panel-green visible-lg">
                            <div class="panel-heading"><?php echo _('其它的组');?></div>
                            <div class="panel-body">
                                <foreach name="group_list" item="vo">
                                    <if condition="!in_array($vo['gid'], $user_group)">
                                        <a href="#" class="list-group-item"><i class="fa fa-server"></i> <{$vo.group_name}></a>
                                    </if>
                                </foreach>
                            </div>
                        </div>
                        
                        <div class="panel panel-yellow visible-md visible-lg">
                            <div class="panel-heading"><?php echo _('下载配置');?></div>
                            <div class="panel-body">
                                <p><?php echo _('在此您可以直接下载您可以连接的所有节点的配置文件');?></p>
                            </div>
                        </div>
                    </div>
                
                <div class="col-lg-9  col-xs-12">
                    <div class="panel panel-success">
                        <div class="panel-heading"><?php echo _('下面是您加入的节点组，您可以使用其中的任意节点');?></div>
                    </div>
                    <foreach name="group_list" item="group">
                    <if condition="in_array($group['gid'], $user_group)">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <{$group.group_name}>
                        </div>
                        <div class="panel-body">
                            <if condition="!empty($group['group_info'])">
                                <div class="well"><{$group.group_info}></div>
                            </if>
                            <foreach name="group['node']" item="node_id">
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <{$node_list[$node_id]['node_name']}>
                                </div>
                                <div class="panel-body">
                                    <div class="hidden" id="info-<{$node_id}>" data-address="<{$node_list[$node_id]['address']}>" data-port="<{$userinfo['port']}>" data-passwd="<{$userinfo['passwd']}>" data-method="<{$userinfo['method']}>" data-protocol="<{$userinfo['protocol']}>" data-obfs="<{$userinfo['obfs']}>"></div>
                                    <div class="well">
                                        <{$node_list[$node_id]['node_info']}>
                                    </div>
                                    <hr />
                                    <div class="row text-center">
                                        <small><div class="col-sm-3 col-xs-6"><i class="fa fa-user"></i> <?php echo _('在线人数');?><code>1</code></div>
                                        <div class="col-sm-3 col-xs-6"><i class="fa fa-long-arrow-down"></i> <?php echo _('下载速度');?><code>1</code></div>
                                        <div class="col-sm-3 col-xs-6"><i class="fa fa-long-arrow-up"></i> <?php echo _('上传速度');?><code>1</code></div>
                                        <div class="col-sm-3 col-xs-6"><i class="fa fa-circle-o-notch"></i> <?php echo _('当前负载');?><code>1.5</code></div></small>
                                    </div>
                                </div>
                                <div class="panel-footer">
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <button class="btn btn-info btn-sm show-details" data-nid="<{$node_id}>"><?php echo _('查看详情');?></button>
                                        </div>
                                        <div class="col-xs-6 text-right">
                                            <button class="btn btn-warning btn-sm show-connect-info" data-nid="<{$node_id}>"><?php echo _('连接信息');?></button>
                                            <button class="btn btn-success btn-circle hidden-xs show-qrcode" data-nid="<{$node_id}>"><i class="fa fa-qrcode fa-lg"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <!--/.panel-footer-->
                            </div>
                            <!--/.panel-->
                            </foreach>
                        </div>
                        <!--/.panel-body-->
                    </div>
                    <!--/.panel-red-->
                    </if>
                    </foreach>
                    
                    <div class="panel panel-warning">
                        <div class="panel-heading"><?php echo _('下面是您尚未加入的节点组，再您加入它们之前您不能使用其中的节点');?></div>
                    </div>
                    
                    <foreach name="group_list" item="group">
                    <if condition="!in_array($group['gid'], $user_group)">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <{$group.group_name}>
                        </div>
                        <div class="panel-body">
                            <if condition="!empty($group['group_info'])">
                                <div class="well"><{$group.group_info}></div>
                            </if>
                            <foreach name="group['node']" item="node_id">
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <{$node_list[$node_id]['node_name']}>
                                </div>
                                <div class="panel-body">
                                    <div class="well">
                                        <{$node_list[$node_id]['node_info']}>
                                    </div>
                                    <hr />
                                    <div class="row text-center">
                                        <small><div class="col-sm-3 col-xs-6"><i class="fa fa-user"></i> <?php echo _('在线人数');?><code>1</code></div>
                                        <div class="col-sm-3 col-xs-6"><i class="fa fa-long-arrow-down"></i> <?php echo _('下载速度');?><code>1</code></div>
                                        <div class="col-sm-3 col-xs-6"><i class="fa fa-long-arrow-up"></i> <?php echo _('上传速度');?><code>1</code></div>
                                        <div class="col-sm-3 col-xs-6"><i class="fa fa-circle-o-notch"></i> <?php echo _('当前负载');?><code>1.5</code></div></small>
                                    </div>
                                </div>
                                <div class="panel-footer">
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <button class="btn btn-info btn-sm"><?php echo _('查看详情');?></button>
                                        </div>
                                        <div class="col-xs-6 text-right">
                                            <!--<button class="btn btn-warning btn-sm">连接信息</button>-->
                                            <!--<button class="btn btn-success btn-circle hidden-xs"><i class="fa fa-qrcode fa-lg"></i></button>-->
                                        </div>
                                    </div>
                                </div>
                                <!--/.panel-footer-->
                            </div>
                            <!--/.panel-->
                            </foreach>
                        </div>
                        <!--/.panel-body-->
                    </div>
                    <!--/.panel-red-->
                    </if>
                    </foreach>
                </div>
                <!--/.col-lg-9-->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
    
    
<div class="modal fade" id="connect-info" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
                <h4 class="modal-title" id="connect-info-title">
                   <?php echo _('连接信息');?>
                </h4>
            </div>
            <div class="modal-body" id="connect-info-body">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#ss-info" data-toggle="tab"><?php echo _('连接信息');?></a>
                                </li>
                                <li><a href="#qrcode" data-toggle="tab"><?php echo _('二维码');?></a>
                                </li>
                                <li><a href="#ss-link-info" data-toggle="tab"><?php echo _('ss链接');?></a>
                                </li>
                                <li><a href="#ss-config" data-toggle="tab"><?php echo _('配置文件');?></a>
                                </li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane fade in active" id="ss-info">
                                    <h4><?php echo _('连接信息');?></h4>
                                    <div class="table-responsive">
                                        <table class="table table-striped text-center">
                                            <tbody>
                                                <tr>
                                                    <td><?php echo _('连接地址');?></td>
                                                    <td id="info-connect-address">127.0.0.1</td>
                                                </tr>
                                                <tr>
                                                    <td><?php echo _('端口号');?></td>
                                                    <td id="info-connect-port">1</td>
                                                </tr>
                                                <tr>
                                                    <td><?php echo _('连接密码');?></td>
                                                    <td id="info-connect-passwd">123456</td>
                                                </tr>
                                                <tr>
                                                    <td><?php echo _('加密方式');?></td>
                                                    <td id="info-connect-method">aes-256-cfb</td>
                                                </tr>
                                                <tr>
                                                    <td><?php echo _('协议（仅ssr）');?></td>
                                                    <td id="info-connect-protocol">origin</td>
                                                </tr>
                                                <tr>
                                                    <td><?php echo _('混淆（仅ssr）');?></td>
                                                    <td id="info-connect-obfs">plain</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="tab-pane fade clearfix text-center" id="qrcode">
                                    <div id="switch" data-switch="ss" style="cursor:pointer">
                                        <h4><?php echo _('使用shadowsocks');?> <i class="fa fa-toggle-off fa-lg"></i> <?php echo _('使用shadowsocksR');?></h4>
                                    </div>
                                    <hr />
                                    <div>
                                        <div id="ss-qrcode"></div>
                                        <h3 class="text-center">shadowsocks</h3>
                                    </div>
                                    <div style="display:none;">
                                        <div id="ssr-qrcode"></div>
                                        <h3 class="text-center">shadowsocksR</h3>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="ss-link-info">
                                    <h4><?php echo _('ss链接');?></h4>
                                    <div class="row" style="word-break: break-all; word-wrap:break-word;">
                                        <div class="col-xs-4">shadowsocks:</div>
                                        <div class="col-xs-8"><a href="" id="ss-link"></a></div>
                                        <div class="col-xs-12"><hr /></div>
                                        <div class="col-xs-4">shadowsocksR:</div>
                                        <div class="col-xs-8"><a href="" id="ssr-link"></a></div>
                                        <div class="col-xs-12"><hr /></div>
                                        <div class="col-xs-12"><small>*<?php echo _('安卓上可以直接点击哦');?></small></div>
                                    </div>
                                    
                                </div>
                                <div class="tab-pane fade" id="ss-config">
                                    <h4><?php echo _('配置文件');?></h4>
                                    <div class="row">
                                        <div class="col-md-6 col-xs-12">
                                            <h3  class="text-center">shadowsocks</h3>
                                            <pre class="well" id="ss-config-file" style="min-height:200px"></pre>
                                            <div class="text-center"><button class="btn btn-success btn-sm copy-config" data-clipboard-target="#ss-config-file" data-toggle="tooltip" 
   data-placement="top" title=""> <i class="fa fa-copy"></i> <?php echo _('点我复制');?></button></div>
                                        </div>
                                        <div class="col-md-6 col-xs-12">
                                            <h3  class="text-center">shadowsocksR</h3>
                                            <pre class="well" id="ssr-config-file" style="min-height:200px"></pre>
                                            <div class="text-center"><button class="btn btn-success btn-sm copy-config" data-clipboard-target="#ssr-config-file"> <i class="fa fa-copy"></i> <?php echo _('点我复制');?></button></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-warning" data-dismiss="modal"><i class="fa fa-close"></i> <?php echo _('关闭');?></button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

    <include file="Home@bootstrap/Public/footer" />
    </body>
    <include file="Home@bootstrap/User/js" />
    <script src="__PUBLIC__/js/qrcode/jquery.qrcode.min.js"></script>
    <script src="__PUBLIC__/js/base64/base64.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.5.12/clipboard.min.js"></script>
    <script>
        var base64 = new Base64();
        clipboard = new Clipboard('.copy-config');
        
        clipboard.on('error', function(e) {
            $.alert({title:'失败',content:"复制失败！<br />当前仅支持Chrome 42+、Firefox 41+、IE 9+、Opera 29+浏览器",confirmButton: '好的',confirmButtonClass: 'btn-danger'});
        });
        
        clipboard.on('success', function(e){
            $.alert({title:'成功',content:"复制成功！",confirmButton: '好的',confirmButtonClass: 'btn-success'});
            })
        
        $('.show-connect-info').click(function(){
            nid=$(this).attr('data-nid');
            $('#ss-qrcode').empty();
            $('#ssr-qrcode').empty();
            
            
            address = $('#info-'+nid).attr('data-address');
            method = $('#info-'+nid).attr('data-method');
            passwd = $('#info-'+nid).attr('data-passwd');
            protocol = $('#info-'+nid).attr('data-protocol');
            obfs = $('#info-'+nid).attr('data-obfs');
            port = $('#info-'+nid).attr('data-port');
            
            ss_link = "ss://"+base64.encode(method+':'+passwd+'@'+address+':'+port);
            ssr_link = "ssr://"+base64.encode(address+':'+port+':'+protocol+':'+method+':'+obfs+':'+base64.encode(passwd));
            
            
            
            $('#info-connect-address').html(address);
            $('#info-connect-port').html(port);
            $('#info-connect-passwd').html(passwd);
            $('#info-connect-protocol').html(protocol);
            $('#info-connect-obfs').html(obfs);
            $('#info-connect-method').html(method);

            
            $("#ss-link").attr('href', ss_link);
            $("#ss-link").html('<code>'+ss_link+'</code>');
            $("#ssr-link").attr('href', ssr_link);
            $("#ssr-link").html('<code>'+ssr_link+'</code>');
            
            
            $("#ss-config-file").html(JSON.stringify({server:address, port:parseInt(port), password:passwd, method:method}, null, 4));
            $("#ssr-config-file").html(JSON.stringify({server:address, port:parseInt(port), password:passwd, method:method,
                protocol:protocol,obfs:obfs}, null, 4));
            
            
            //ssr://base64(ip:port:protocol:method:obfs:base64(passwd)/?obfsparam=&remarks=)
            //ss://base64(method:passwd@ip:port)
            
            $('#ss-qrcode').qrcode(ss_link);
            $('#ssr-qrcode').qrcode(ssr_link);
            $('#connect-info').modal('show');
            })
            
            
        $('#switch').click(function(){
            if($('#switch').attr('data-switch') == 'ss'){
                $('#switch').children().children().removeClass('fa-toggle-off');
                $('#switch').children().children().addClass('fa-toggle-on');
                //$('#switch').html('<h3>使用ss <i class="fa fa-toggle-on fa-lg"></i> 使用ssr</h3>');
                $('#switch').attr('data-switch', 'ssr');
                
                $('#ssr-qrcode').parent().show();
                $('#ss-qrcode').parent().hide();
            }else{
                $('#switch').children().children().removeClass('fa-toggle-on');
                $('#switch').children().children().addClass('fa-toggle-off');
                $('#switch').attr('data-switch', 'ss')
                //$('#switch').html('<h3>使用ss <i class="fa fa-toggle-off fa-lg"></i> 使用ssr</h3>');
                
                $('#ss-qrcode').parent().show();
                $('#ssr-qrcode').parent().hide();
            }
        });
    </script>
</html>
