<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글쓰기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
<script>
		//자바스크립트로 헤더 파일 받아오는 소스 
		$(document).ready(function() {
			$('#headerMain').load("/resources/html/header.jsp");
		});
</script>
<jsp:include page="../../../resources/html/header.jsp"/>
	<br style="clear:both">
	<h1 align="center">게시글 등록</h1>
	<br><br>
	<form action="boardRegister.ptsd" method="post" enctype="multipart/form-data">
		<table align="center" border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" size="50" name="bTitle"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" size="50" name="userNo"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="7" cols="50" name="bContents"></textarea>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><input type="file" name="uploadFile"></td>
			</tr>
            <tr>
				<td colspan="2">
					<input type="submit" value="등록">
					<input type="reset" value="취소">
				</td>
			</tr>			
		</table>
	</form>
</body>
</html>