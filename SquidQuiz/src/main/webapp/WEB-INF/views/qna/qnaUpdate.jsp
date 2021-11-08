<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 답변</title>
</head>
<body>
	<form action="qnaModify.ptsd" method="post" >
		<input type="hidden" name="qnaNo" value="${qna.qnaNo }">
		<table align="center" border="1">
			<tr>
				<td>제목</td>
				<td>
					<input type="text" size="50" 
						name="qnaTitle" value="${qna.qnaTitle }" readonly>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="7" cols="50" name="qnaContents" readonly>${qna.qnaContents }</textarea>
				</td>
			</tr>
			<tr>
				<td>답변</td>
				<td>
					<input type="text" size="300" 
						name="qnaAnswer" value="${qna.qnaAnswer }" >
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="답변하기">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>