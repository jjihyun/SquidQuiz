<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글쓰기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<jsp:include page="../../../resources/html/header.jsp"/>
<link rel="stylesheet" type="text/css" href="/static/css/bootsrap.min.css">
<script src="/ckeditor5/ckeditor.js"></script>
	<style>
		.ck-editor_editable{
			height:300px;
		}
	</style>

</head>
<body>
	<br style="clear:both">
	<h1 align="center">게시글 작성</h1>
	<br><br>
	<div class="container">
	<form action="boardRegister.ptsd" method="post" enctype="multipart/form-data">
			<div>
				<label for="title">제목</label>
				<input type="text" name="bTitle"  placeholder="제목을 입력하세요.">
			</div>
			<div>
				<label for="title">작성자</label>
<%-- 				 ${sessionScope.loginUser.userId } --%>
				<input type="text" name="userId"  value="${User.userId }">
			</div>
			<div >
				<textarea name="bContents" id="bContents" placeholder="내용을 입력하세요."></textarea>
			</div>
			<tr>
				<th>첨부파일</th>
				<td><input type="file" name="uploadFile"></td>
			</tr>
				<input  type="submit" value="등록"  >
				<input type="reset" value="취소" onclick="loaction.href='${bList}'">
	</form>
</div>
	   <!--에디터 API -->
	   <script>
		 ClassicEditor
		 .create(document.querySelector('#bContents'),{
			 language: {ui:'ko', content:'ko'}
		 })
		 .then( editor => {
			 window.editor = editor;
		 })
		 .catch( error => {
			 console.error(error);
		 });
		</script>
</body>
</html>