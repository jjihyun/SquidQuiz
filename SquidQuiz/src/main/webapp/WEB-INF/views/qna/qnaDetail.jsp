<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna 상세 ( 임시 )</title>
</head>
<body>
	<form action="modifyAnswer.ptsd" method="post">
	<table align="center" width="450" border="1">
			
			<tr>
			
				<td>번호<input type="hidden" value="${qna.qnaNo }" name = "qnaNo"></td>
				<td>${qna.qnaNo }</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${qna.qnaTitle }</td>
			</tr>
			<tr>
				<td>작성날짜</td>
				<td>${qna.qCreateDate }</td>
			</tr>
			<tr height="300">
				<td>내용</td>
				<td>${qna.qnaContents }</td>
			</tr>
			<tr>
				
				<td>답변</td>
				<td>${qna.qnaAnswer }</td>
				
			</tr>
			<tr>
				
				<td>답변</td>
				<td><input type="text" name="qnaAnswer"> <input type="submit" value="답변하기"></td>
				
			</tr>
			<tr>
				<td colspan="2" align="center">
				
					<c:url var="qDelete" value="removeQna.ptsd">
						<c:param name="qnaNo" value="${qna.qnaNo }"></c:param>
					</c:url>
					<
					<a href="${qDelete }">삭제하기</a>
					
				</td>
			</tr>
		</table>
		</form>
		<br><br><br><br><br>
</body>
</html>