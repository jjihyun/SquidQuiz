<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 수정</title>
<jsp:include page="../../../resources/html/header.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="/static/css/bootsrap.min.css">
<script language="javascript" src="/ckeditor/ckeditor.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
	<br><br>
	<form action="boardUpdate.ptsd" method="post" enctype="multipart/form-data">
		<input type="hidden" name="bNo" value="${board.bNo }">
		<input type="hidden" name="bFileName" value="${board.bFileName }">
		<input type="hidden" name="bFileRename" value="${board.bFileRename }">
		<div class="container">
			<div class="form-group">
				<label for="title">제목</label>
				<input type="text" name="bTitle" class="form-control"  value="${board.bTitle }">
			</div>
			<div class="form-group">
				<label for="title">작성자</label>
				<input type="text" name="userId" class="form-control" value="${board.userId }" readonly>
			</div>
			<div class="form-group">
				<textarea name="bContents" id="bContents" class="form-control">${board.bContents }</textarea>
			</div>
			<tr>
				<th>첨부파일</th>
				<td><input type="file" name="reloadFile">${board.bFileName }</td>
			</tr>
				<input type="submit" value="수정">
				<input type="reset" value="취소">
		</form>
	</div>
	
	
	<script>
	CKEDITOR.replace( 'bContents', {
		 width:'100%',
         height:'400px',
	filebrowserImageUploadUrl: "${path}/boardck.ptsd" 
	}); 
	
	
	
//  <script> 
// 	 ClassicEditor.create(document.querySelector('#bContents'),{
// 		 language: {ui:'ko', content:'ko'}
// 	 })
// 	 .catch(error => {
// 		 console.error(error);
// 	 });

	</script> 
</body>
</html>
