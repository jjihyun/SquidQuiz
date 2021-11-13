<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 날짜 jstl -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 관리</title>
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
a:link{color:#495057;	text-decoration: none;} 
a:visited{color:#495057;	text-decoration: none;}
a:hover{color:#495057;	text-decoration: none;}
	.nav nav-pills{
		align-content: center;
	}
	.tap{
		text-align: center;
	}
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
						href="oxList.ptsd"> <i class="align-middle"
							data-feather="user"></i> <span class="align-middle">퀴즈관리</span>
					</a></li>
					<li class="sidebar-item"><a class="sidebar-link"
						href="#"> <i class="align-middle"
							data-feather="user"></i> <span class="align-middle">신고관리</span>
					</a></li>
					<li class="sidebar-item"><a class="sidebar-link"
						href="exchangeListView.ptsd"> <i class="align-middle"
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
						
						<h3 class="card-title mb-0">게시물 관리</h3>
						<!-- 아래로탭 -->
					<div align="center" class="tap">
					
					
					<ul class="nav nav-pills nav-justified">
						<c:if test="${pageType eq 'board'}">
						  <li  class="nav-item">
						    <a class="nav-link active" data-toggle="tab" href="#report">게시물</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link" data-toggle="tab" href="#reportreply">댓글</a>
						  </li>
						</c:if>
							<c:if test="${pageType eq 'reply'}">
						  <li  class="nav-item">
						    <a class="nav-link " data-toggle="tab" href="#report">게시물</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link active" data-toggle="tab" href="#reportreply">댓글</a>
						  </li>
						</c:if>
						</ul>
						  
					
						<div class="tab-content">
						 <c:if test="${pageType eq 'board'}">
						<!-- 첫번째 탭 -->
						  <div class="tab-pane fade show active" id="report">
						   <p>게시물</p>
						   <c:import url="/reportListView.ptsd"></c:import>
						  </div>
						  <!-- 첫번째 탭 끝 -->
						  
						  <!-- 두번째 탭 -->
						 
						  <div class="tab-pane fade" id="reportreply">
						    <p>댓글</p>
						    <c:import url="/replyReportListView.ptsd"></c:import>
						  </div>
						  <!-- 두번째 탭 끝 -->
						   </c:if>
						   <c:if test="${pageType eq 'reply'}">
						   <!-- 첫번째 탭 -->
						  <div class="tab-pane fade" id="report">
						   <p>1111111111</p>
						    <c:import url="reportListView.ptsd"></c:import>
						  </div>
						  <!-- 첫번째 탭 끝 -->
						  
						  <!-- 두번째 탭 -->
						 
						  <div class="tab-pane fade show active" id="reportreply">
						    <p>22222222222</p>
						    <c:import url="replyReportListView.ptsd"></c:import>
						  </div>
						  <!-- 두번째 탭 끝 -->
						  </c:if>
						</div>
					</div>
					<!-- 위로탭 -->
					</div>
					
					
					
				</div>
			</main>
		</div>
	</div>
	

	<footer class="footer">
		<div class="container-fluid">
			<div class="row text-muted"></div>
		</div>
	</footer>
	<script>

	
	</script>
	<!-- 탭 동작용 부트스트랩 4 cdn... -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<script src="/resources/js/app.js"></script>
</body>
</html>