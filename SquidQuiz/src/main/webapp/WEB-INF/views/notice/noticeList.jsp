<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지/문의 게시판</title>
</head>
<script>
$(document).ready(function(){
	$('#headerMain').load("/resources/html/header.jsp");
});

</script>
<body>
<h1 align="center">공지글 목록보기</h1>
	<br><br>
	<div><button onclick="location.href='noticeWriteView.kh'">글쓰기</button></div>
	<br style="clear:both">
	<table align="center" width="600" border="1" cellspacing="0" style="clear:right;">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>올린 날짜</th>
		</tr>
		<c:if test="${empty nList }">
			<tr>
				<td colspan="5" align="center">조회된 정보가 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty nList }">
		<c:forEach items="${nList }" var="notice" varStatus="">
			<tr>
				<td align="center">${notice.noticeNo }</td>
				<td align="center">
					<c:url var="nDetail" value="noticeDetail.ptsd">
						<c:param name="noticeNo" value = "${notice.noticeNo }"></c:param>
					</c:url>
					<a href="${nDetail }">
						${notice.noticeTitle }
					</a>
				</td>
				<td align="center">${notice.noticeDate }</td>
			</tr>
		</c:forEach>
		</c:if>
	</table> 
</body>
</html>