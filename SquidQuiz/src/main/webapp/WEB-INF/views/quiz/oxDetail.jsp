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
				<a class="sidebar-brand" href="#"> <img
					src="/src/img/icons/icon-48x48.png" alt=""> <span
					class="align-middle">관리자 홈 </span>
				</a>

				<ul class="sidebar-nav">
					<li class="sidebar-header">
						목록
					</li>
					<li class="sidebar-item">
					<a class="sidebar-link"
						href="index.html">
						<i class="align-middle"
							data-feather="sliders"></i>
						<span>회원정보수정</span>
						</a>
					</li>
					<li class="sidebar-item">
					<a class="sidebar-link"
						href="pages-profile.html"> 
						<i class="align-middle"
							data-feather="user"></i> 
							<span class="align-middle">퀴즈진행</span>
					</a>
					</li>
					<li class="sidebar-item active"><a class="sidebar-link"
						href="oxList.ptsd"> <i class="align-middle"
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
				<h1 class="h3 mb-3">
					<strong>OX퀴즈 [${ox.oxNo }]번 상세</strong>
				</h1>
					<div class="oxTitle" align="center">
						<!--<h1 align="center">OX퀴즈</h1> -->
					</div>
					<div class="writeArea">
					<input type="hidden" value="${ox.oxNo }" id="xoNo">
							<table class="writeForm" style="">
								<tr>
									<td colspan="3">
									<center><b>제목</b></center>
									<div style="border: 1px solid rgb(219,219,219); height: 20px; border-radius: 20px;">
										${ox.oxTitle }
									</td>
								</tr>
								<tr>
									<td colspan="3" width="150px">
										<center><b>내용</b></center>
										<div style="border: 1px solid rgb(219,219,219); height: 100px; border-radius: 20px">
											${ox.oxContents }
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="3" width="150px">
										<center><b>해설</b></center>
										<div style="border: 1px solid rgb(219,219,219); height: 100px; border-radius: 20px">
											${ox.oxCommentary }
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="3" width="150px" class="imgtd">
										<center><b>OX 이미지</b></center>
										<div class="img_area">
											<img class="poto" id="oxImg" src="/resources/oxuploadFiles/${ox.oxFileName }">
										</div>
									</td>
<!-- 															<td><input type="file" size="50" name="uploadFile"></td> -->
								</tr>
								<tr>
									
									<td colspan="1">
									<center><b>정답</b></center>
									<div style="border: 1px solid rgb(219,219,219); height: px; border-radius: 20px">
										<center>${ox.oxAnswer }</center>
									</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<c:url var="oxModify" value="oxModify.ptsd">
											<c:param name="oxNo" value="${ox.oxNo }"></c:param>
										</c:url>
										<c:url var="oxDelete" value="oxDelete.ptsd">
											<c:param name="oxNo" value="${ox.oxNo }"></c:param>
											<c:param name="oxFileName" value="${ox.oxFileName }"></c:param>
										</c:url>
											<a href="${oxModify }">
												<button class="btn btn-success" style="width: 320px;">수정</button>
											</a>
											<a href="${oxDelete }">
											<button class="btn btn-delete" style="width: 320px; border-color: pink; color:#fff; background: #FF3399">삭제</button>
											</a>
									</td>
								</tr>
							</table>
					</div>
			</main>

			<footer class="footer">
				<div class="container-fluid">
					<div class="row text-muted">
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script src="/resources/js/app.js"></script>
</body>
</html>