<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 목록</title>
</head>
<body>
<%-- 	<jsp:include page="../errorPage.jsp"></jsp:include> --%>
	<br style="clear:both">
	<h1 align="center"></h1>
	<br><br><a href="boardWriteView.ptsd">게시글 작성하기</a>
	<br>
	<table align="center" border="1"></table>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>날짜</th>
		<th>첨부파일</th>
	</tr>
	<c:forEach>
		<tr>
			<td>${board.boardNo }</td>
			<td>
				<c:url>
					<c:param name="boardNo" value="${board.boardNo }"></c:param>
				</c:url>
			</td>
		
		
		</tr>
	
	
	
	
	</c:forEach>
	
	
	
	
	
	
	
	
	
</body>
</html>







