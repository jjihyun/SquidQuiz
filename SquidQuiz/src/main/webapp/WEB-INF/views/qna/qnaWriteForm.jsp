<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 작성 (임시 )</title>
</head>
<body>
	<h1 align="center">문의글 등록 페이지</h1>
	<br><br>
	<form action="qnaRegister.ptsd" method="post">
		<table align="center" border="1" cellspacing="0">
			<tr>
				<td>제목</td>
				<td><input type="text" size="50" name="qnaTitle"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="7" cols="50" name="qnaContents"></textarea></td>
			</tr>
		
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록">
					<input type="reset" value="취소">
				</td>
			</tr>
			
		</table>
	
	</form>
</body>
</html>