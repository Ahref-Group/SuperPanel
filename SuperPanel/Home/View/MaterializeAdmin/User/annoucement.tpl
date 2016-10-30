<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<title><?php echo _('用户面板');?> -<{$site_name}></title>
		<include file="Home@MaterializeAdmin/Public/source" />
		<include file="Home@MaterializeAdmin/User/source" />
		<link href="__PUBLIC__/MaterializeAdmin/js/plugins/prism/prism.css" type="text/css" rel="stylesheet" media="screen,projection">
		<link href="__PUBLIC__/MaterializeAdmin/js/plugins/perfect-scrollbar/perfect-scrollbar.css" type="text/css" rel="stylesheet" media="screen,projection">
		<link href="__PUBLIC__/MaterializeAdmin/js/plugins/chartist-js/chartist.min.css" type="text/css" rel="stylesheet" media="screen,projection">
		<script type="text/javascript" src="__PUBLIC__/MaterializeAdmin/js/plugins/chartjs/chart.min.js"></script>
	</head>
	<body>
		<include file="Home@MaterializeAdmin/User/header" />
		<!-- Start Page Loading -->
		<include file="Home@MaterializeAdmin/Public/pageloading" />
		<!-- End Page Loading -->
		<!-- START MAIN -->
		<div id="main">
			<!-- START WRAPPER -->
			<div class="wrapper">
				<include file="Home@MaterializeAdmin/User/nav" />
				<section id="content">
					<!--start container-->
					<div class="container">
						<div class="col l10 m12">
							<div class="card-panel blue darken-4">
								<span class="white-text"><?php echo _('欢迎回来，');?><{$userinfo['username']}></span>
							</div>
						</div>
						<div class="row">
							<div class="col m6 s12">
								<div class="card accent-1 hoverable">
									<div class="card-content">
										<span class="card-title"><?php echo _( '公告');?></span>
										<p>
											Balabalabalabalabalabalabalabalabala
											<br>Balabalabalabalabalabalabalabalabala
											<br>Balabalabalabalabalabalabalabalabala
										</p>
									</div>
								</div>
								<div class="card accent-1 hoverable">
									<div class="card-content">
										<span class="card-title"><?php echo _( '安全');?></span>
										<p>
											<?php echo _( '登录IP：');?><{$ip}><br>
											<?php echo _( '登录地点：');?>中国 北京市 北京<br>
											<?php echo _( '安全等级：');?>7/10
										</p>
									</div>
								</div>
							</div>
							<div class="col m6 s12">
							    <div class="card accent-1 hoverable">
									<div class="card-content">
										<span class="card-title"><?php echo _( '流量信息');?></span>
										<div class="progress">
										    <div class="determinate" style="width: 70%"></div>
										</div>
										<canvas id="transferChart"></canvas>
										
									</div>
								</div>
								<div class="card accent-1 hoverable">
									<div class="card-content">
										<span class="card-title"><?php echo _( '金融信息');?></span>
										<p>
											Balabalabalabalabalabalabalabalabala
											<br>Balabalabalabalabalabalabalabalabala
											<br>Balabalabalabalabalabalabalabalabala
										</p>
									</div>
								</div>
								<div class="card accent-1 hoverable">
									<div class="card-content">
										<span class="card-title"><?php echo _( '账户信息');?></span>
										<p>
											Balabalabalabalabalabalabalabalabala
											<br>Balabalabalabalabalabalabalabalabala
											<br>Balabalabalabalabalabalabalabalabala
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</body>
	<script>
	var ctx = document.getElementById("transferChart");
	var transferChart = new Chart(ctx, {
	    type: 'bar',
	    data: {
        labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
        datasets: [{
            label: '# of Votes',
            data: [12, 19, 3, 5, 2, 3],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255,99,132,1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero:true
                }
            }]
        }
    }
});
</script>
<include file="Home@MaterializeAdmin/Public/footer" />