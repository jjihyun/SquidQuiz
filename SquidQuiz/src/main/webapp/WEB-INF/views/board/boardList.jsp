<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 목록</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <link rel="stylesheet" href="/resources/css/app.css"> -->
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
	<h1 align="center">게시글 목록보기</h1>
	<br><br>
	<table align="center" width="600" border="1" cellspacing="0" style="clear:right;">
	<tr>
		<th align="center">번호</th>
		<th align="center" width="300">제목</th>
		<th align="center">작성자</th>
		<th align="center">날짜</th>
		<th align="center">첨부파일</th>
	</tr>
		<c:forEach items="${bList }" var="board">
			<tr>
				<td align="center">${board.bNo }</td>
				
				<td align="center">
					<c:url var="boardDetail" value="boardDetail.ptsd">
						<c:param name="bNo" value="${board.bNo }"/>
					</c:url>
					<a href="${boardDetail }">${board.bTitle }</a>
				</td>
				
				<td align="center">${board.userId }</td>
				
				<td align="center">${board.bCreateDate }</td>
				<td align="center">
					<c:if test="${!empty board.bFileName }">O</c:if>
					<c:if test="${ empty board.bFileName }">X</c:if>
				</td>
			</tr>
		</c:forEach>
		    <tr>
		    	<td align="center" colspan="5">
					<a href="boardWrite.ptsd">글쓰기</a>
				</td>
			</tr>
		
	
		<tr align="center" height="20">
			<td colspan="6">
				<c:url var="before" value="boardList.ptsd">
					<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
				</c:url>
				<c:if test="${pi.currentPage <= 1 }">
					[이전]
				</c:if>
				<c:if test="${pi.currentPage > 1 }">
					<a href="${before }">[이전]</a>
				</c:if>
				<c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
					<c:url var="pagination" value="boardList.ptsd">
						<c:param name="page" value="${p }"></c:param>
					</c:url>
					<c:if test="${p eq pi.currentPage }">
						<font color="red" size="4">[${p }]</font>
					</c:if>
					<c:if test="${p ne pi.currentPage }">
						<a href="${pagination }">${p }</a>&nbsp;
					</c:if>
				</c:forEach>
				<c:url var="after" value="boardList.ptsd">
					<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
				</c:url>
				<c:if test="${pi.currentPage >= pi.maxPage }">
					[다음]
				</c:if>
				<c:if test="${pi.currentPage < pi.maxPage }">
					<a href="${after }">[다음]</a>
				</c:if>
			</td>
		</tr>
	</table>
</body>
</html>







