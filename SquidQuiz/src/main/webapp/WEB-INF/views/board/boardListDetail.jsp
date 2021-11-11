<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 상세</title>
</head>
<body>
	<h1 align="center">${board.bNo }번 게시글 상세보기</h1>
	<br><br>
		<input type="hidden" value="${board.bNo }" id="bNo">
		<table align="center" width="500" border="1">
			<tr>
				<td>제목</td>
				<td>${board.bTitle }</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${board.userNo }</td>
			</tr>
			<tr>
				<td>작성날짜</td>
				<td>${board.bCreateDate }</td>
			</tr>
			<tr height="300">
				<td>내용</td>
				<td>${board.bContents }</td>
			</tr>		
			<tr>
				<td>첨부파일</td>
				<td>
					<img src="/resources/buploadFiles/${board.bFileName }">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<c:url var="bModify" value="boardModify.ptsd">
						<c:param name="bNo" value="${board.bNo }"></c:param>
					</c:url>
					<c:url var="bDelete" value="boardDelete.ptsd">
						<c:param name="bNo" value="${board.bNo }"></c:param>
						<c:param name="fileName" value="${board.bFileRename }"></c:param>
					</c:url>
					<a href="${bModify }">수정</a>
					<a href="${bDelete }">삭제</a>
				</td>
			</tr>					
		</table>
</body>
</html>