<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
</head>
<body>

<table align="center" width="450" border="1">
		<tr>
			<td>번호</td>
			<td>${notice.noticeNo }</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${notice.noticeTitle }</td>
		</tr>
		<tr>
			<td>작성날짜</td>
			<td>${notice.noticeDate }</td>
		</tr>
		<tr height="300">
			<td>내용</td>
			<td>${notice.noticeContents }</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<c:url var="nModify" value="noticeModifyView.ptsd">
					<c:param name="noticeNo" value="${notice.noticeNo }"></c:param>
				</c:url>
				<c:url var="nDelete" value="noticeRemove.ptsd">
					<c:param name="noticeNo" value="${notice.noticeNo }"></c:param>
				</c:url>
				<a href="${nModify }">수정페이지로 이동</a>
				<a href="${nDelete }">삭제하기</a>
			</td>
		</tr>
	</table>
	<br><br><br><br><br>
</body>
</html>