<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퀴즈 후원 내역</title>
<style>
#current-font{
	background-color: rgb(201, 113, 113);
	color:white;
	border-radius: 3px;
	padding: 5px;
	padding-left: 8px;
	padding-right: 8px;
}
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
tr{
	text-align:center;
	height: 30px;
}
#list-btn{
	width: 100px; height:25px; background-color: green; color:white; border:none; cursor: pointer;
}
</style>
</head>
<body>
	<jsp:include page="../../../resources/html/header.jsp"/>
	<br><br><br><br>
	<h2 align="center" style="color:rgb(250, 113, 50);">퀴즈 후원 내역</h2>
	<table align="center">
		<tr style="background-color:rgb(201, 113, 113); color:white;" >
			<th>NO</th><th>후원금액</th><th>후원처</th><th>후원일자</th>
		</tr>
		<c:forEach items="${dRList }" var="d">
			<tr>
				<td width="100px;">${d.donationNo }</td>
				<td width="200px;">${d.donationPrice }원</td>
				<td width="150px;">사랑의 재단</td>
				<td width="120px;"><fmt:formatDate pattern="yyyy-MM-dd" value="${d.donationDate }"/></td>
			</tr>
		</c:forEach>
		<br>
		<tr style="height: 130px;">
			<td colspan="4">
				<button id="list-btn" onclick="location.href='campaignList.ptsd'">목록으로</button>
			</td>
		</tr>
		<tr>
			<td colspan="4" id="td-1">
				<c:url var="before" value="campaignAllCampaignRecord.ptsd">
					<c:param name="page" value="${pi.currentPage-1}"></c:param>
				</c:url> 
				<c:if test="${pi.currentPage <=1 }">
					<font class="font-str">이전</font>
				</c:if> 
				<c:if test="${pi.currentPage>1}">
					<a href="${before }"><font class="font-str">이전</font></a>
				</c:if> 
				<c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
					<c:url var="pagination" value="campaignAllCampaignRecord.ptsd">
						<c:param name="page" value="${p }"></c:param>
					</c:url>
					<c:if test="${p eq pi.currentPage }">
						<font size="4" id="current-font" class="font-num">${p }</font>
					</c:if>
					<c:if test="${p ne pi.currentPage }">
						<a href="${pagination }" class="font-num" style="color: rgb(201, 113, 113);">${p }</a>
					</c:if>
				</c:forEach> 
				<c:url var="after" value="campaignAllCampaignRecord.ptsd">
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

</body>
</html>