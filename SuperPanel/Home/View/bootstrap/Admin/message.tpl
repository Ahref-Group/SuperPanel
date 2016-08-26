<!DOCTYPE html>
<html lang="<{:cookie('locale')}>">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>站内消息 - <{$site_name}></title>
    
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
                        <h1 class="page-header">发送新的站内消息</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="col-lg-12 col-sm-12">
                    <div class="col-lg-7 col-sm-12">
                        <div id="editor"></div>
                    </div>
                    <div class="col-lg-5 col-sm-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                发送对象
                            </div>
                            <div class="panel-body">
                                <div class="form-group">
                                    <label>范围选择方式</label>
                                    <select class="form-control">
                                        <option>组</option>
                                        <option>流量</option>
                                        <option>日期</option>
                                    </select>
                                </div>
                                <foreach name="group_list" item="vo">
                                    <label class="checkbox-inline">
                                        <input type="checkbox"> <{$vo.group_name}>
                                    </label>
                                </foreach>
                            </div>
                            <div class="panel-footer">
                                <span class="pill-left">推送后无法删除，请注意</span>
                                <span class="btn btn-warning pull-right" id="send"><i class="fa fa-paper-plane"></i>发送</span>
                                <div class="clearfix"></div>
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
        <script src ="__PUBLIC__/js/base64/base64.js"></script>
    <script src='//cdn.tinymce.com/4/tinymce.min.js'></script>
  <script>
    tinymce.init({
        selector: '#editor',
        height : 300,
        language_url:'__PUBLIC__/bootstrap/vendor/TinyMCE/zh_CN.js',
        plugins: [
    'advlist autolink lists link image charmap print preview hr anchor pagebreak',
    'searchreplace wordcount visualblocks visualchars code fullscreen',
    'insertdatetime media nonbreaking save table contextmenu directionality',
    'emoticons template paste textcolor colorpicker textpattern imagetools'
  ],
  toolbar1: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
  toolbar2: 'preview media | forecolor backcolor emoticons | code',
        
        schema: 'html5',
        menubar: 'edit insert view format table tools'
    });
    
    
    $('#send').click(function(){
        base64 = new Base64();
        text = base64.encode(tinymce.get('editor').getContent());
        item = $('#item').val();
        $.post("<{:U('Home/AdminAction/send_message')}>", {'send_to':send_to,text:text},function(data){
            
        });
    });
    
  </script>
</html>
