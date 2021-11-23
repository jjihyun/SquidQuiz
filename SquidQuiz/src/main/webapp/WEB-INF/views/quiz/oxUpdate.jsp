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
	//선택 input:file 태그연결
	function fnFileChange(input) {
		$(input).closest('div').find('input:file').click();
	}
	//파일 읽어서 등록 이미지에 뿌려주기
	function readURL(input, id) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#" + id).attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
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
					<strong>OX퀴즈 [${ox.oxNo }]번 수정</strong>
				</h1>
					<div class="oxTitle" align="center">
						<!--<h1 align="center">OX퀴즈</h1> -->
					</div>
					<div class="writeArea">
						<form action="oxUpdate.ptsd" method="post"
							enctype="multipart/form-data">
							<input type="hidden" name="oxNo" value="${ox.oxNo }">
							<input type="hidden" name="oxFileName" value="${ox.oxFileName }">
							<table class="writeForm">
								<tr>
									<th>제목</th>
									<td><input type="text" size="50" name="oxTitle" value="${ox.oxTitle}"></td>
								</tr>
								<tr>
									<th>내용</th>
									<td><input type="text" size="50" name="oxContents" value="${ox.oxContents }"></td>
								</tr>
								<tr>
									<th>해설</th>
									<td><textarea rows="7" cols="50" name="oxCommentary">${ox.oxCommentary }</textarea></td>
								</tr>
								<tr>
									<td colspan="3" width="150px" class="imgtd">
										<div class="img_area">
											<input id="oxFile" name="reloadFile" type="file"
												style="display: none" onchange="readURL(this,'oxImg')">
											<img class="preview" id="oxImg" src="/resources/uploadFiles/${ox.oxFileName }"
												onclick="javascript:$('#oxFile').click();">
										</div>
										<center><b>OX 이미지</b></center>
									</td>
<!-- 															<td><input type="file" size="50" name="uploadFile"></td> -->
								</tr>
								<tr>
									<th>정답</th>
									<td colspan="2"><input type="radio" name="oxAnswer"
										value="O">O<input type="radio" name="oxAnswer"
										value="x">X</td>
								</tr>
								<tr>
									<td colspan="2"><input type="submit" value="수정">
									 <input type="reset" value="취소"></td>
								</tr>
							</table>
						</form>
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
	<footer>
		<jsp:include page="../../../resources/html/footer.html"/>
	</footer>
	<script src="/resources/js/app.js"></script>
	<script>
		function showRegister(){
			location.href="oxList.ptsd";
		}
	</script>
</body>
</html>