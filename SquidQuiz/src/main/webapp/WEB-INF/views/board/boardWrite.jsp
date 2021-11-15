<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글쓰기</title>
<jsp:include page="../../../resources/html/header.jsp"/>
<link rel="stylesheet" type="text/css" href="/static/css/bootsrap.min.css">
<script src="/ckeditor5/ckeditor.js"></script>
	<style>
		.ck-editor_editable{
			min-height:300px;
		}
	</style>

</head>
<body>
	<br style="clear:both">
	<h1 align="center">게시글 등록</h1>
	<br><br>
	<div class="container">
	<form action="boardRegister.ptsd" method="post" enctype="multipart/form-data">
			<div>
				<label for="title">제목</label>
				<input type="text" name="bTitle" class="form-control" placeholder="제목을 입력하세요">
			</div>
			<div>
				<label for="title">작성자</label>
				<input type="text" name="userId" class="form-control">
			</div>
			<div >
				<textarea name="bContents" id="bContents" class="form-control"></textarea>
			</div>
			<tr>
				<th>첨부파일</th>
				<td><input type="file" name="uploadFile"></td>
			</tr>
				<input  type="submit" value="등록" >
				<input type="button" value="취소" onclick="loaction.href='${bList}'">
	</form>
</div>
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