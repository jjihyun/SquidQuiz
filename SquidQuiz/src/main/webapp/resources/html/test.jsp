<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/resources/css/quiz/oxWrite.css">
<link rel="stylesheet" href="/resources/css/app.css">
</head>
<script>
	//자바스크립트로 헤더 파일 받아오는 소스 
	$(document).ready(function() {
		$('#headerMain').load("/resources/html/header.jsp");
	});
</script>
<style>
</style>
<body>
	<div id="headerMain"></div>
	<hr>
	<div class="wrapper">
		<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="index.html"> <img
					src="/src/img/icons/icon-48x48.png" alt=""> <span
					class="align-middle">관리자 홈 </span>
				</a>

				<ul class="sidebar-nav">
					<li class="sidebar-header">목록</li>
					
					<li class="sidebar-item"><a class="sidebar-link"
						href="#"> <i class="align-middle"
							data-feather="sliders"></i> <span>회원정보수정</span>
					</a></li>
					<li class="sidebar-item"><a class="sidebar-link"
						href="pages-profile.html"> <i class="align-middle"
							data-feather="user"></i> <span class="align-middle">퀴즈진행</span>
					</a></li>
					<li class="sidebar-item active"><a class="sidebar-link"
						href="pages-profile.html"> <i class="align-middle"
							data-feather="user"></i> <span class="align-middle">퀴즈관리</span>
					</a></li>
					<li class="sidebar-item"><a class="sidebar-link"
						href="pages-profile.html"> <i class="align-middle"
							data-feather="user"></i> <span class="align-middle">신고관리</span>
					</a></li>
					<li class="sidebar-item"><a class="sidebar-link"
						href="pages-profile.html"> <i class="align-middle"
							data-feather="user"></i> <span class="align-middle">환전관리</span>
					</a></li>
				</ul>
			</div>
		</nav>

		<div class="main">
			<nav class="navbar navbar-expand navbar-light navbar-bg">
				<a class="sidebar-toggle js-sidebar-toggle"> <i
					class="hamburger align-self-center"></i>
				</a>
			</nav>

			<main class="content">
				<div class="card flex-fill">
					<div class="card-header">

						<h5 class="card-title mb-0">Latest Projects</h5>
					</div>
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
	</main>

	<footer class="footer">
		<div class="container-fluid">
			<div class="row text-muted"></div>
		</div>
	</footer>
	</div>
	</div>
	<script src="/resources/js/app.js"></script>

</body>
</html>