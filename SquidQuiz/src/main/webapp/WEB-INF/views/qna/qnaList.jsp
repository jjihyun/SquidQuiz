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
					<c:url var="qDetail" value="noticeDetail.ptsd">
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
	</table> 
</body>
</html>