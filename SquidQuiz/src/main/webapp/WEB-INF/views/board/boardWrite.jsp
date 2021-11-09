<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글쓰기</title>
</head>
<body>
<jsp:include page="../common/errorPage.jsp"></jsp:include>
	<br style="clear:both">
	<h1 align="center">게시글 등록</h1>
	<br><br>
	<form action="boardRegister.ptsd" method="post" enctype="multipart/form-data">
		<table align="center" border="1">
			<tr>
				<th>제목</th>
				<td><input type="text" size="50" name="boardTitle"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" size="50" name="boardTitle"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="7" cols="50" name="boardContents"></textarea>
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