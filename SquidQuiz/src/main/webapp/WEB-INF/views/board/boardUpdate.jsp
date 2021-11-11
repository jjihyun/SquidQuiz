<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 수정</title>
</head>
<body>
	<h1 align="center">${board.bNo }번 게시글 상세보기</h1>
	<br><br>
	<form action="boardUpdate.ptsd" method="post" enctype="multipart/form-data">
		<input type="hidden" name="bNo" value="${board.bNo }">
		<input type="hidden" name="bFileName" value="${board.bFileName }">
		<input type="hidden" name="bFileRename" value="${board.bFileRename }">
		<table align="center" width="500" border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" name="bTitle" size="50" value="${board.bTitle }"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="userNo" value="${board.userNo }" readonly></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="7" cols="50" name="bContents">${board.bContents }</textarea></td>
			</tr>		
			<tr>
				<td>첨부파일</td>
				<td>
					<input type="file" name="reloadFile">
					${board.bFileName }
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정하기">
				</td>
			</tr>					
		</table>
	</form>
</body>
</html>