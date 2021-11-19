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
				<label for="title">글쓴이</label>
				<input type="text" name="userId"  value="${loginUser.userId }" readonly>
			</div> 
			<div >
				<textarea name="bContents" id="bContents" placeholder="내용을 입력하세요."></textarea>
			</div>
			<tr>
				<th>첨부파일</th>
				<td><input type="file" name="uploadFile"></td>
			</tr>
				<input  type="submit" value="등록"  >
				<input type="reset" value=" 취소" onclick="loaction.href='${bList}'">
	</form>
</div>

	<script> 
	
// 	var result = "${msg}";
// 	if(result == "regSuccess") {
// 		alert("게시글 등록이 완료되었습니다.");
// 	}
	
	
	CKEDITOR.replace( 'bContents',  {
		 width:'100%',
         height:'400px',
	filebrowserImageUploadUrl: "${path}/boardck.ptsd" 
	}); 
	
	
// 	CKEDITOR.on('dialogDefinition', function( ev ){
//         var dialogName = ev.data.name;
//         var dialogDefinition = ev.data.definition;
     
//         switch (dialogName) {
//             case 'image': //Image Properties dialog
//                 //dialogDefinition.removeContents('info');
//                 dialogDefinition.removeContents('Link');
//                 dialogDefinition.removeContents('advanced');
//                 break;
//         }
//     });
    
// });
	</script>
	


<!-- 	   에디터 API -->
<!-- 	   <script>
// 		 ClassicEditor
// 		 .create(document.querySelector('#bContents'),{
// 			 language: {ui:'ko', content:'ko'}
// 		 })
// 		 .then( editor => {
// 			 window.editor = editor;
// 		 })
// 		 .catch( error => {
// 			 console.error(error);
// 		 });
	</script> -->
</body>
</html>