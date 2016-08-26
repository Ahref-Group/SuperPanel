<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><{$site_name}></title>

    <!-- Bootstrap Core CSS -->
    <link href="__PUBLIC__/bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="//cdn.bootcss.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>

    <!-- Plugin CSS -->
    <link href="__PUBLIC__/bootstrap/vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

    <!-- Theme CSS -->
    <link href="__PUBLIC__/bootstrap/css/creative.min.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> 菜单 <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top"><{$site_name}></a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a class="page-scroll" href="#services">服务</a>
                    </li>
                    <li>
                        <a href="<{:U('Home/Auth/login')}>">登录</a>
                    </li>
                    <li>
                        <a href="<{:U('Home/Auth/register')}>">注册</a>
                    </li>
                    <if condition="C('REQUIRE_INVITE_CODE') eq 1">
                    <li>
                        <a href="<{:U('Home/Index/invite_code')}>">邀请码</a>
                    </li>
                    </if>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <header>
        <div class="header-content">
            <div class="header-content-inner">
                <h1 id="homeHeading"><{$site_name}></h1>
                <hr>
                <p><{$announcement['index']}></p>
                <a href="<{:U('Home/Auth/login')}>" class="btn btn-primary btn-xl page-scroll">登录</a>&nbsp;&nbsp;&nbsp;
                <a href="<{:U('Home/Auth/register')}>" class="btn btn-primary btn-xl page-scroll">注册</a>
                <br /><br /><br />
                <a href="#services" class="btn btn-default btn-xl page-scroll"><i class="fa fa-angle-double-down fa-lg"></i>&nbsp;&nbsp;查看更多</a>
            </div>
        </div>
    </header>

    <section id="services">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">我们的服务</h2>
                    <hr class="primary">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-diamond text-primary sr-icons"></i>
                        <h3>稳定</h3>
                        <p class="text-muted">Our templates are updated regularly so they don't break.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-paper-plane text-primary sr-icons"></i>
                        <h3>极速</h3>
                        <p class="text-muted">基于socks5协议、异步IO与事件驱动，给您带来急速体验</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-lock text-primary sr-icons"></i>
                        <h3>安全</h3>
                        <p class="text-muted">使用AES等高强度加密算法，最大程度保障您的通信安全</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-cubes text-primary sr-icons"></i>
                        <h3>跨平台</h3>
                        <p class="text-muted">支持Windows，OS X，Android和iOS系统和路由器（OpenWrt）</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <aside class="bg-dark">
        <div class="container text-center">
            <div class="call-to-action">
                <h2>加入我们，享受这一切！</h2>
                <a href="<{:U('Home/Auth/register')}>" class="btn btn-default btn-xl sr-button">注册</a>
            </div>
        </div>
    </aside>

    <div style="padding:50px;background-color:rgb(34,34,34);color:white">
        <p style="float:left"><i class="fa fa-copyright"></i> 2016 <{$site_name}>. All rights reserved.</p>
        <p style="float:right">Powered by SuperPanel.</p>
    </div>

    <!-- jQuery -->
    <script src="__PUBLIC__/bootstrap/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="__PUBLIC__/bootstrap/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="__PUBLIC__/bootstrap/vendor/scrollreveal/scrollreveal.min.js"></script>
    <script src="__PUBLIC__/bootstrap/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

    <!-- Theme JavaScript -->
    <script src="__PUBLIC__/bootstrap/js/creative.min.js"></script>

</body>

</html>
