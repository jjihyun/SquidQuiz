<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지수정</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/resources/css/app.css">
</head>

<body>
<script>
		//자바스크립트로 헤더 파일 받아오는 소스 
		$(document).ready(function() {
			$('#headerMain').load("/resources/html/header.jsp");
		});
</script>
<div id="headerMain"></div><br><br><br>
<h1 align="center">공지 수정</h1>
	<br><br>
	<main id="main">
		<div class="container">
			<form action="noticeModify.ptsd" method="post">
				<input type="hidden" value="${notice.noticeNo }" name="noticeNo">
				<div class="mb-3">
				  <label for="exampleFormControlInput1" class="form-label" >제목</label>
				  <input type="text" class="form-control" id="exampleFormControlInput1" value="${notice.noticeTitle }"name="noticeTitle" placeholder="제목을 입력해주세요!" pattern=".{1,100}" required>
				</div>
				<div class="mb-3">
				  <label for="exampleFormControlTextarea1" class="form-label" >공지사항 본문</label>
				  <textarea class="form-control" id="exampleFormControlTextarea1" rows="16"   name="noticeContents" >${notice.noticeContents }</textarea>
				</div>
				<section>
					<div id="back-btn">
						<button class="btn btn-primary" type="submit">등록</button>
						<button class="btn btn-secondary" type="reset">취소</button>
					</div>
				</section>
			</form>
		</div>
	</main>
</body>
</html>