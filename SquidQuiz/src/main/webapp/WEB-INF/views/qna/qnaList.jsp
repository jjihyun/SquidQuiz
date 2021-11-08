<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의  list test</title>
</head>
<body>
	<h1 align="center">문의 목록보기</h1>
	<br><br>
	<div><button onclick="location.href=''">글쓰기</button></div>
	<br style="clear:both">
	<table align="center" width="600" border="1" cellspacing="0" style="clear:right;">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>올린 날짜</th>
		</tr>
		<c:if test="${empty qList }">
			<tr>
				<td colspan="5" align="center">조회된 정보가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty qList }">
		<c:forEach items="${qList }" var="qna" varStatus="">
			<tr>
				<td align="center">${qna.qnaNo }</td>
				<td align="center">
					<c:url var="qDetail" value="qnaDetailView.ptsd">
						<c:param name="qnaNo" value = "${qna.qnaNo }"></c:param>
					</c:url>
					<a href="${qDetail }">
						${qna.qnaTitle }
					</a>
				</td>
				<td align="center">${qna.qCreateDate }</td>
			</tr>
		</c:forEach>
		</c:if>
		<tr align="center" height="20">
			<td colspan="3">
				<c:url var="before" value="qnaListView.ptsd">
					<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
				</c:url>
				<c:if test="${pi.currentPage <= 1 }">
					[이전]
				</c:if>
				<c:if test="${pi.currentPage > 1 }">
					<a href="${before }">[이전]</a>
				</c:if>
				<c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
					<c:url var="pagination" value="qnaListView.ptsd">
						<c:param name="page" value="${p }"></c:param>
					</c:url>
					<c:if test="${p eq pi.currentPage }">
						<font color="red" size="4">[${p }]</font>
					</c:if>
					<c:if test="${p ne pi.currentPage }">
						<a href="${pagination }">${p }</a>&nbsp;
					</c:if>
				</c:forEach>
				<c:url var="after" value="qnaListView.ptsd">
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