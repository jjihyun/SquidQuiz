<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
	<meta name="author" content="AdminKit">
	<meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

	<link rel="preconnect" href="https://fonts.gstatic.com">
	
	<!-- 사이트 이모티콘 -->
	<link rel="shortcut icon" href="/resources/img/photos/초대.png" />

	<title>마이페이지 활동내역</title>
	<link rel="stylesheet" href="/resources/css/app.css">
	<link rel="stylesheet" href="/resources/js/app.js">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<style>

.container{
	width: 500px;
	margin: 0 auto;
}

ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
}
ul.tabs li{
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current{
	background: #ededed;
	color: #222;
}

.tab-content{
	display: none;
	background: #ededed;
	padding: 15px;
}

.tab-content.current{
	display: inherit;
}
.box{text-align: center; width:825px; margin: 0; padding:0;}
.box1{text-align: center; width:410px; margin: 0; padding:0;}
.gibu-box,.quiz-box1{float:left;list-style:none;}
.gibu-box b,.quiz-box1 b{font-size:18px;}
.gibu-box input, .quiz-box1 input{width:400px;height:50px;margin-top:10px;}
</style>
<body>
	<header>
		<jsp:include page="../../../resources/html/header.jsp"/>
	</header>
	<br>
	<div class="wrapper">
		<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="index.html">
					<img src="/src/img/icons/icon-48x48.png" alt="">
          <span class="align-middle">MY PAGE</span>
        </a>
	
				<ul class="sidebar-nav">
					
					<li class="sidebar-header" align="center">
						<a href="/mypageUser.ptsd"><img src="/resources/img/userProfile.png" alt="" style="width: 100px;">
						<input type="text" id="my-userId" name="my-userId" value="${loginUser.userId }"  style="text-align:center;font-size:18px;font-weight:bold;width:200px;height:40px;background-color:transparent;border:none;outline:none;pointer-events: none; color:white;"> 
						</a>
					</li>

					<li class="sidebar-item ">
						<a class="sidebar-link" href="mypageMyHome.ptsd">
              <i class="align-middle" data-feather="user"></i> <span class="align-middle">MY홈</span>
            </a>
					</li>
					<li class="sidebar-item active">
						<a class="sidebar-link" href="mypageDetail.ptsd">
              <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">활동내역</span>
            </a>
					</li>
					<li class="sidebar-item">
						<a class="sidebar-link" href="mypagePoint.ptsd">
              <i class="align-middle" data-feather="star"></i> <span class="align-middle">포인트</span>
            </a>
					</li>
					<li class="sidebar-item">
						<a class="sidebar-link" href="userDelete.ptsd">
              <i class="align-middle" data-feather="user-x"></i> <span class="align-middle">회원탈퇴</span>
            </a>
					</li>
				</ul>
			</div>
		</nav>
		
		
			<div class="main">
				<nav class="navbar navbar-expand navbar-light navbar-bg">
					<a class="sidebar-toggle js-sidebar-toggle">
	          		<i class="hamburger align-self-center"></i>
	        	</a>
				</nav>
			

			<main class="content">
				<div class="container-fluid p-0">

					<h1 class="h3 mb-3"><strong>활동내역</strong> </h1>
				</div>
					<div align="center" class="container">

							<ul class="tabs">
								<li class="tab-link current" data-tab="tab-1">전체 내역</li>
								<li class="tab-link" data-tab="tab-2">캠페인 내역</li>
								<li class="tab-link" data-tab="tab-3">퀴즈 내역</li>
							</ul>
							<br><br><br>
							
						
						</div>
						
						<div align="center">
							<div id="tab-1" class="tab-content current">
							<hr>
							<!-- 게시판 -->
							
									<div class="card flex-fill">
										<table class="table table-hover my-0">
											<thead>
												<tr>
													<th>번호</th>
													<th class="d-none d-xl-table-cell">콘텐츠</th>
													<th class="d-none d-xl-table-cell">금액</th>
													<th>날짜</th>
												
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>Project Apollo</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td><span class="badge bg-success">Done</span></td>
													
												</tr>
												<tr>
													<td>Project Fireball</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td><span class="badge bg-danger">Cancelled</span></td>
													
												</tr>
												<tr>
													<td>Project Hades</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td><span class="badge bg-success">Done</span></td>
													
												</tr>
												<tr>
													<td>Project Nitro</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td><span class="badge bg-warning">In progress</span></td>
												
												</tr>
												<tr>
													<td>Project Phoenix</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td><span class="badge bg-success">Done</span></td>
													
												</tr>
												<tr>
													<td>Project X</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td><span class="badge bg-success">Done</span></td>
													
												</tr>
												<tr>
													<td>Project Romeo</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td><span class="badge bg-success">Done</span></td>
													
												<tr>
													<td>Project Wombat</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td><span class="badge bg-warning">In progress</span></td>
													
												</tr>
											</tbody>
										</table>
									</div>
								</div>
						 <div id="tab-2" class="tab-content">
						 <div class="gibu">
						 <form action="">
							<ul class="box">
								<li class="gibu-box"> <b>후원단체</b><br> <input type="text"class="point-box"></li>
								<li class="gibu-box"><div class="vr" style="height:100px;margin-left:10px;margin-right:10px;"></div></li>
								<li class="gibu-box"> <b>총 기부금액</b><br>  <input type="text"class="point-box"></li><br><br><br><br>
								
							</ul>
						</form>
						</div>
						<br>
						 <hr>
						 <br>
							<!-- 게시판 -->
							
									<div class="card flex-fill">
										<table class="table table-hover my-0">
											<thead>
												<tr>
													<th>번호</th>
													<th class="d-none d-xl-table-cell">단체 명</th>
													<th class="d-none d-xl-table-cell">금액</th>
													<th class="d-none d-md-table-cell">날짜</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>Project Apollo</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td class="d-none d-md-table-cell">Vanessa Tucker</td>
												</tr>
												<tr>
													<td>Project Fireball</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td class="d-none d-md-table-cell">William Harris</td>
												</tr>
												<tr>
													<td>Project Hades</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td class="d-none d-md-table-cell">Sharon Lessman</td>
												</tr>
												<tr>
													<td>Project Nitro</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td class="d-none d-md-table-cell">Vanessa Tucker</td>
												</tr>
												<tr>
													<td>Project Phoenix</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td class="d-none d-md-table-cell">William Harris</td>
												</tr>
												<tr>
													<td>Project X</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td class="d-none d-md-table-cell">Sharon Lessman</td>
												</tr>
												<tr>
													<td>Project Romeo</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td class="d-none d-md-table-cell">Christina Mason</td>
												</tr>
												<tr>
													<td>Project Wombat</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td class="d-none d-md-table-cell">William Harris</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
						  <div id="tab-3" class="tab-content">
						   <div class="gibu">
						 <form action="">
							<ul class="box">
								<li class="quiz-box1"> <b>총 참여수</b><br> <input type="text"class="point-box"></li>
								<li class="quiz-box1"><div class="vr" style="height:100px;margin-left:10px;margin-right:10px;"></div></li>
								<li class="quiz-box1"> <b>누적 기부금액</b><br>  <input type="text"class="point-box"></li><br><br><br><br>
								
							</ul>
						</form>
						</div>
						<br>
						 <hr>
						 <br>
						 	<div class="box1">
						 		<div class="quiz-box1" > <b>누적 참여금액</b><br> <input type="text" class="point-box"> </div> 
						 	</div>
						 <br><br><br><br><br>
						  <hr>
						  <br>
							<!-- 게시판 -->
									<div class="card flex-fill">
										<table class="table table-hover my-0">
											<thead>
												<tr>
													<th>회차 번호</th>
													<th class="d-none d-xl-table-cell">문제 통과 카운트</th>
													<th class="d-none d-xl-table-cell">참가 금액</th>
													<th class="d-none d-md-table-cell">날짜</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>Project Apollo</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td class="d-none d-md-table-cell">Vanessa Tucker</td>
												</tr>
												<tr>
													<td>Project Fireball</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td class="d-none d-md-table-cell">William Harris</td>
												</tr>
												<tr>
													<td>Project Hades</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td class="d-none d-md-table-cell">Sharon Lessman</td>
												</tr>
												<tr>
													<td>Project Nitro</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td class="d-none d-md-table-cell">Vanessa Tucker</td>
												</tr>
												<tr>
													<td>Project Phoenix</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td class="d-none d-md-table-cell">William Harris</td>
												</tr>
												<tr>
													<td>Project X</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td class="d-none d-md-table-cell">Sharon Lessman</td>
												</tr>
												<tr>
													<td>Project Romeo</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td class="d-none d-md-table-cell">Christina Mason</td>
												</tr>
												<tr>
													<td>Project Wombat</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td class="d-none d-md-table-cell">William Harris</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
					</div>
			</main>
			

			<footer class="footer">
				<div class="container-fluid">
					<div class="row text-muted">
						<div class="col-6 text-start">
							<p class="mb-0">
								<a class="text-muted" href="https://adminkit.io/" target="_blank"><strong>AdminKit</strong></a> &copy;
							</p>
						</div>
						<div class="col-6 text-end">
							<ul class="list-inline">
								<li class="list-inline-item">
									<a class="text-muted" href="https://adminkit.io/" target="_blank">Support</a>
								</li>
								<li class="list-inline-item">
									<a class="text-muted" href="https://adminkit.io/" target="_blank">Help Center</a>
								</li>
								<li class="list-inline-item">
									<a class="text-muted" href="https://adminkit.io/" target="_blank">Privacy</a>
								</li>
								<li class="list-inline-item">
									<a class="text-muted" href="https://adminkit.io/" target="_blank">Terms</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</footer>
		</div>
		</div>
	
	

	<script src="/resources/js/app.js"></script>
</body>
<script>

$(document).ready(function(){
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})

})

</script>

</html>