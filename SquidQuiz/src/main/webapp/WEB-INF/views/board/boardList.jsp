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
	<c:forEach items="${bList }" var="board">
			<tr>
				<td>${board.boardNo }</td>
				<td>
					<c:url var="bDetail" value="boardDetail.ptsd">
						<c:param name="boardNo" value="${board.boardNo }"></c:param>
					</c:url>
					<a href="${bDetail }">${board.bTitle }</a>
				</td>
				<td>${board.bWriter }</td>
				<td>${board.bCreateDate }</td>
				<td>
					<c:if test="${!empty board.bFileName }">O</c:if>
					<c:if test="${ empty board.bFileName }">X</c:if>
				</td>
			</tr>
		</c:forEach>
		<tr align="center" height="20">
			<td colspan="6">
				<c:url var="before" value="boardList.kh">
					<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
				</c:url>
				<c:if test="${pi.currentPage <= 1 }">
					[이전]
				</c:if>
				<c:if test="${pi.currentPage > 1 }">
					<a href="${before }">[이전]</a>
				</c:if>
				<c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
					<c:url var="pagination" value="boardList.kh">
						<c:param name="page" value="${p }"></c:param>
					</c:url>
					<c:if test="${p eq pi.currentPage }">
						<font color="red" size="4">[${p }]</font>
					</c:if>
					<c:if test="${p ne pi.currentPage }">
						<a href="${pagination }">${p }</a>&nbsp;
					</c:if>
				</c:forEach>
				<c:url var="after" value="boardList.kh">
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







