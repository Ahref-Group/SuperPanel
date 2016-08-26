<!DOCTYPE html>
<html lang="<{:cookie('locale')}>">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>修改<{$single_announcement['introduction']}>公告 - <{$site_name}></title>
    
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
                        <h1 class="page-header">
                        <?php echo $is_edit?_('修改公告').' <small> - '.$single_announcement['introduction'].'</small>':_('添加公告');?>
                        </h1>
                    </div>
                    <!-- /.col-lg-12 -->
                    <div class="col-md-4 col-xs-12">
                        <div class="panel panel-green">
                            <div class="panel-body">

                                <form class="form-horizontal" role="form">
                                   <div class="form-group">
                                      <label for="firstname" class="col-sm-3 control-label">名称</label>
                                      <div class="col-sm-9">
                                         <input type="text" class="form-control" id="introduction" placeholder="请输入名称" value="<{$is_edit?$single_announcement['introduction']:''}>">
                                      </div>
                                   </div>
                                   <div class="form-group">
                                      <label for="lastname" class="col-sm-3 control-label">标识符</label>
                                      <div class="col-sm-9">
                                         <input type="text" class="form-control" id="item" placeholder="请输入标识符" value="<{$is_edit?$single_announcement['item']:''}>">
                                      </div>
                                   </div>
                                </form>
                                <div class="panel panel-yellow">
                                    <div class="panel-body">
                                        <p><strong>公告名称</strong>是显示在后台菜单中的公告名称，便于区分各个公告</p>
                                        <p><strong>公告标识符</strong>是程序用于区分各个公告的标识符，标识符仅允许由26个字母、数字和下划线组成
组成，长度小于16个字符，且各公告间不能除非使用</p>
                                    </div>
                                </div>
                                <!--/.panel-->
                                <button class="btn btn-warning pull-right" id="send"><i class="fa fa-paper-plane"></i> 提交</button>
                            </div>
                        </div>
                        
                    </div>
                    
                    
                    
                    <div class="col-md-8 col-xs-12">
<div id="editor">
<?php echo $is_edit?$single_announcement['text']:_('请输入公告内容');?>
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
        introduction = $('#introduction').val();
        item = $('#item').val();
        $.post("<{:U('Home/AdminAction/announcement')}>", {'item':item,'introduction':introduction,text:text},function(data){
            
        });
    });
    
  </script>
</html>
