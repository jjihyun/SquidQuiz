<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퀴즈 후원 내역</title>
<style>
.font-num{
	margin: 5px;
}
.font-str{
	color:rgb(201, 113, 113);
	/* border:2px solid rgb(201, 113, 113); */
	padding: 7px;
	border-radius: 3px;
	padding-left: 15px;
	padding-right: 15px;
	margin:20px;
	size:10px;
}
.font-str:hover{
	color:white;
	background-color: rgb(201, 113, 113);
}
</style>
</head>
<body>
	<jsp:include page="../../../resources/html/header.jsp"/>
	<h2 align="center">퀴즈 후원 내역</h2>
	<table align="center" border="1">
		<tr>
			<th>NO</th><th>후원금액</th><th>후원처</th><th>후원일자</th>
		</tr>
		<c:forEach item="${dRList }" var="d">
			<tr>
				<td>${d.campaignNo }</td>
				<td>${d.cTargetAmount }</td>
				<td>사랑의 재단</td>
				<td>${d.cEnrollDate }</td>
			</tr>
		</c:forEach>
		<tr>
			<td>2</td><td>102000원</td><td>사랑의 열매 재단</td><td>2021-11-09</td>
		</tr>
		<tr>
			<td>1</td><td>52000원</td><td>사랑의 열매 재단</td><td>2021-11-08</td>
		</tr>
		<tr align="center">
			<td colspan="4">
				<button style="width: 80px; background-color: green; color:white; border:none;">목록으로</button>
			</td>
		</tr>

		<tr align="center" height="20">
			<td colspan="4" id="td-1">
				<c:url var="before" value="campaignList.ptsd">
					<c:param name="page" value="${pi.currentPage-1}"></c:param>
				</c:url> 
				<c:if test="${pi.currentPage <=1 }">
					<font class="font-str">이전</font>
				</c:if> 
				<c:if test="${pi.currentPage>1}">
					<a href="${before }"><font class="font-str">이전</font></a>
				</c:if> 
				<c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
					<c:url var="pagination" value="campaignStaticDetail.ptsd">
						<c:param name="page" value="${p }"></c:param>
					</c:url>
					<c:if test="${p eq pi.currentPage }">
						<font size="4" id="current-font" class="font-num">${p }</font>
					</c:if>
					<c:if test="${p ne pi.currentPage }">
						<a href="${pagination }" class="font-num" style="color: rgb(201, 113, 113);">${p }</a>
					</c:if>
				</c:forEach> 
				<c:url var="after" value="campaignStaticDetail.ptsd">
					<c:param name="page" value="${pi.currentPage+1 }"></c:param>
				</c:url> <c:if test="${pi.currentPage>=pi.maxPage }">
					<font class="font-str">다음</font>
				</c:if> 
				<c:if test="${pi.currentPage<pi.maxPage }">
					<a href="${after }"><font class="font-str">다음</font></a>
				</c:if>
			</td>
		</tr>

	</table>
	<div>
		(페이지 자리)
	</div>
</body>
</html>