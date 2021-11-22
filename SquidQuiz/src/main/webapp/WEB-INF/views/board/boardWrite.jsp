<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글쓰기</title>
<jsp:include page="../../../resources/html/header.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="/static/css/bootsrap.min.css">
<!-- <script src="/ckeditor5/ckeditor.js"></script> -->
<script language="javascript" src="/ckeditor/ckeditor.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
<!-- 최신부트스트랩 -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<link href="/resources/css/footer.css" rel="stylesheet" />
</head>
<body>
	<br style="clear: both">
	<br>
	<br>
	<br>
	<br>
	<h1 align="center">게시글 작성</h1>
	<br>
	<br>
	<div style="color: pink; align: center;">
		<form action="boardRegister.ptsd" method="post"
			enctype="multipart/form-data" align="center" display="inline"
			float="left">
			<div float="left" display="inline" word-break="break-all">
				<label for="title">제목</label> <input type="text" name="bTitle"
					placeholder="제목을 입력하세요.">
			</div>
			<div float="left">
				<label for="title">글쓴이</label> <input type="text" name="userId"
					value="${loginUser.userId }" readonly>
			</div>
			<div align="center">
				<textarea name="bContents" id="bContents" placeholder="내용을 입력하세요."></textarea>
			</div>
			<tr>
				<th></th>
				<td><input type="hidden" name="uploadFile"></td>
			</tr>
			<div class="btn btn-primary">
				<input type="submit" value="등록" class="btn btn-primary"> <input
					type="button" value=" 취소"
					OnClick="window.location='boardList.ptsd'" class="btn btn-primary">
			</div>
		</form>
	</div>
	<!-- 푸터 -->
	<footer>
		<jsp:include page="../../../resources/html/footer.html" />
	</footer>
	<script>
		CKEDITOR.replace('bContents', {
			width : '50%',
			align : 'center',
			height : '400px',
			filebrowserImageUploadUrl : "${path}/boardck.ptsd"
		});
	</script>
</body>
</html>