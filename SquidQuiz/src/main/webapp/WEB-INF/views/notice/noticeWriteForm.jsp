<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 등록</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/resources/css/app.css">
<!-- <script src="/ckeditor5/ckeditor.js"></script> -->
<script language="javascript" src="/ckeditor/ckeditor.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
<script>
		//자바스크립트로 헤더 파일 받아오는 소스 
		$(document).ready(function() {
			$('#headerMain').load("/resources/html/header.jsp");
		});
</script>
<div id="headerMain"></div><br><br><br>
<h1 align="center" style="font-size:44px">공지 작성</h1>
	<br><br>
	<main id="main">
		<div class="container">
			<form action="noticeRegister.ptsd" method="post">
				<div class="mb-3">
				  <label for="exampleFormControlInput1" class="form-label" >제목</label>
				  <input type="text" class="form-control" id="exampleFormControlInput1" name="noticeTitle" placeholder="제목을 입력해주세요!" pattern=".{1,100}" required>
				</div>
				<div class="mb-3">
				  <label for="exampleFormControlTextarea1" class="form-label" >공지사항 본문</label>
				  <textarea class="form-control" id="exampleFormControlTextarea1" rows="16" name="noticeContents" placeholder="공지사항을 입력해주세요!"></textarea>
				</div>
				<section>
					<div id="back-btn">
						<button class="btn btn-primary" type="submit">등록</button>
<!-- 						<button class="btn btn-secondary" type="reset">취소</button> -->
						<a class="btn btn-secondary" href="qnaListView.ptsd" role="button">목록으로</a>
					</div>
				</section>
			</form>
		</div>
	</main>
	<footer>
		<jsp:include page="../../../resources/html/footer.html"/>
	</footer>
	<script>
		CKEDITOR.replace('noticeContents', {
			align : 'center',
			height : '400px',
		});
	</script>
</body>
</html>