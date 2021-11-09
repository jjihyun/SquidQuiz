<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
	<meta name="author" content="AdminKit">
	<meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

	<link rel="preconnect" href="https://fonts.gstatic.com">
	
	<!-- 사이트 이모티콘 -->
	<link rel="shortcut icon" href="/resources/img/photos/초대.png" />

	<title>마이페이지 활동내역</title>
	<link rel="stylesheet" href="/resources/css/app.css">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
</head>

<body>
	<header>
		<jsp:include page="../../../resources/html/header.jsp"/>
	</header>
	<div class="wrapper">
		<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="index.html">
					<img src="/src/img/icons/icon-48x48.png" alt="">
          <span class="align-middle">MY PAGE</span>
        </a>

				<ul class="sidebar-nav">
					<li class="sidebar-header">
						<img src="img/photos/회원이미지.png" alt="" style="width: 100px; margin-left: 50px;">
						
					</li>

					<li class="sidebar-item ">
						<a class="sidebar-link" href="index.html">
              <i class="align-middle" data-feather="user"></i> <span class="align-middle">MY홈</span>
            </a>
					</li>
					<li class="sidebar-item active">
						<a class="sidebar-link" href="pages-profile.html">
              <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">활동내역</span>
            </a>
					</li>
					<li class="sidebar-item">
						<a class="sidebar-link" href="pages-profile.html">
              <i class="align-middle" data-feather="star"></i> <span class="align-middle">포인트</span>
            </a>
					</li>
					<li class="sidebar-item">
						<a class="sidebar-link" href="pages-profile.html">
              <i class="align-middle" data-feather="user-x"></i> <span class="align-middle">회원탈퇴</span>
            </a>

			</nav>

			<main class="content">
				<div class="container-fluid p-0">

					<h1 class="h3 mb-3"><strong>활동내역</strong> </h1>

					<div class="tab_menu">
						<ul class="list">
						  <li class="is_on">
							<a href="#tab1" class="btn">전체 내역</a>
						  </li>
						  <li>
							<a href="#tab2" class="btn">캠페인 내역</a>
						  </li>
						  <li>
							<a href="#tab3" class="btn">퀴즈 내역</a>
						  </li>
						</ul>
						
						
						<div class="cont_area">
						  <div id="tab1" class="cont">
							<br><br><br>
							<!-- 게시판 -->
							<div class="row">
								<div class="col-12 col-lg-8 col-xxl-9 d-flex">
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
							</div>
						  </div>
						  <div id="tab2" class="cont">
							<br><br><br>
							<!-- 게시판 -->
							<div class="row">
								<div class="col-12 col-lg-8 col-xxl-9 d-flex">
									<div class="card flex-fill">
										<table class="table table-hover my-0">
											<thead>
												<tr>
													<th>Name</th>
													<th class="d-none d-xl-table-cell">Start Date</th>
													<th class="d-none d-xl-table-cell">End Date</th>
													<th>Status</th>
													<th class="d-none d-md-table-cell">Assignee</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>Project Apollo</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td><span class="badge bg-success">Done</span></td>
													<td class="d-none d-md-table-cell">Vanessa Tucker</td>
												</tr>
												<tr>
													<td>Project Fireball</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td><span class="badge bg-danger">Cancelled</span></td>
													<td class="d-none d-md-table-cell">William Harris</td>
												</tr>
												<tr>
													<td>Project Hades</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td><span class="badge bg-success">Done</span></td>
													<td class="d-none d-md-table-cell">Sharon Lessman</td>
												</tr>
												<tr>
													<td>Project Nitro</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td><span class="badge bg-warning">In progress</span></td>
													<td class="d-none d-md-table-cell">Vanessa Tucker</td>
												</tr>
												<tr>
													<td>Project Phoenix</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td><span class="badge bg-success">Done</span></td>
													<td class="d-none d-md-table-cell">William Harris</td>
												</tr>
												<tr>
													<td>Project X</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td><span class="badge bg-success">Done</span></td>
													<td class="d-none d-md-table-cell">Sharon Lessman</td>
												</tr>
												<tr>
													<td>Project Romeo</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td><span class="badge bg-success">Done</span></td>
													<td class="d-none d-md-table-cell">Christina Mason</td>
												</tr>
												<tr>
													<td>Project Wombat</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td><span class="badge bg-warning">In progress</span></td>
													<td class="d-none d-md-table-cell">William Harris</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						  </div>
						  </div>
						  <div id="tab3" class="cont">
							<!-- 게시판 -->
							<div class="row">
								<div class="col-12 col-lg-8 col-xxl-9 d-flex">
									<div class="card flex-fill">
										<table class="table table-hover my-0">
											<thead>
												<tr>
													<th>Name</th>
													<th class="d-none d-xl-table-cell">Start Date</th>
													<th class="d-none d-xl-table-cell">End Date</th>
													<th>Status</th>
													<th class="d-none d-md-table-cell">Assignee</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>Project Apollo</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td><span class="badge bg-success">Done</span></td>
													<td class="d-none d-md-table-cell">Vanessa Tucker</td>
												</tr>
												<tr>
													<td>Project Fireball</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td><span class="badge bg-danger">Cancelled</span></td>
													<td class="d-none d-md-table-cell">William Harris</td>
												</tr>
												<tr>
													<td>Project Hades</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td><span class="badge bg-success">Done</span></td>
													<td class="d-none d-md-table-cell">Sharon Lessman</td>
												</tr>
												<tr>
													<td>Project Nitro</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td><span class="badge bg-warning">In progress</span></td>
													<td class="d-none d-md-table-cell">Vanessa Tucker</td>
												</tr>
												<tr>
													<td>Project Phoenix</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td><span class="badge bg-success">Done</span></td>
													<td class="d-none d-md-table-cell">William Harris</td>
												</tr>
												<tr>
													<td>Project X</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td><span class="badge bg-success">Done</span></td>
													<td class="d-none d-md-table-cell">Sharon Lessman</td>
												</tr>
												<tr>
													<td>Project Romeo</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td><span class="badge bg-success">Done</span></td>
													<td class="d-none d-md-table-cell">Christina Mason</td>
												</tr>
												<tr>
													<td>Project Wombat</td>
													<td class="d-none d-xl-table-cell">01/01/2021</td>
													<td class="d-none d-xl-table-cell">31/06/2021</td>
													<td><span class="badge bg-warning">In progress</span></td>
													<td class="d-none d-md-table-cell">William Harris</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						  </div>
						  </div>
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

	<script src="js/app.js"></script>
</body>
<script>
	const tabList = document.querySelectorAll('.tab_menu .list li');
	const contents = document.querySelectorAll('.tab_menu .cont_area .cont')
	let activeCont = ''; // 현재 활성화 된 컨텐츠 (기본:#tab1 활성화)
  
	for(var i = 0; i < tabList.length; i++){
	  tabList[i].querySelector('.btn').addEventListener('click', function(e){
		e.preventDefault();
		for(var j = 0; j < tabList.length; j++){
		  // 나머지 버튼 클래스 제거
		  tabList[j].classList.remove('is_on');
  
		  // 나머지 컨텐츠 display:none 처리
		  contents[j].style.display = 'none';
		}
  
		// 버튼 관련 이벤트
		this.parentNode.classList.add('is_on');
  
		// 버튼 클릭시 컨텐츠 전환
		activeCont = this.getAttribute('href');
		document.querySelector(activeCont).style.display = 'block';
	  });
	}
  </script>

</html>