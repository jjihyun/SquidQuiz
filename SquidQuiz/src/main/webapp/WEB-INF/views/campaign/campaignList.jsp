<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠페인 목록</title>
<style type="text/css">
.first{
	width: 1500px;
	position: absolute; 
	left: 50%; 
	transform: translateX(-50%);
}
#nav-type {
	height: 100px;
	border:1px solid red;
	text-align: center;
	display:flex;

}
.campaign-type {
	float: left;
	text-align: center;
	height: 100%;
	width: 50px;
	border:1px solid black;
	flex: 1;
	margin-left:30px;
	cursor: pointer;
}

.container {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	grid-template-rows: repeat(2, 1fr);
	column-gap: 30px;
	row-gap: 30px;
	margin: 30px;
}

#campaign-list {
	background-color: lightgray;
	height: 300px;
	cursor: pointer;
}
</style>
</head>
<body>
	<jsp:include page="../../../resources/html/header.jsp"/>
	<br><hr><br>
	<div class="first">
	<div style="text-align: center;">
		<h2>이번주 퀴즈 참가 모음액</h2>
		<h4>111,111원(임시)</h4>
		누적 모금액<br>
		<h4>222,111,111원(임시)</h4>
		<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBxlH6VeINFz3mZwrKiep8BaOjnfJZ86tP9w&usqp=CAU" alt="img 안뜸">
		<h4>타이틀? 기부제목 적는 란</h4>
		<button onclick="location.href='campaignStaticDetail.ptsd'">자세히 보기</button><br>
		<a href="campaignAllCampaignRecord.ptsd">퀴즈 참여 모금액 후원 내역</a><br>
		<button style="float:right; width:150px; height: 30px;" onclick="location.href='campaignWriteView.ptsd'">캠페인 글 작성</button>
	</div>
	<br><br>
	<div id="nav-type">
		<div class="campaign-type" onclick="campaignType('all')">전체</div>
		<div class="campaign-type" onclick="campaignType('child')">아동, 청소년</div>
		<div class="campaign-type" onclick="campaignType('old')">어르신</div>
		<div class="campaign-type" onclick="campaignType('obstacle')">장애인</div>
		<div class="campaign-type" onclick="campaignType('environment')">환경</div>
		<div class="campaign-type" onclick="campaignType('multicultural')">다문화</div>
		<div class="campaign-type" onclick="campaignType('facility')">시설</div>
		<div class="campaign-type" onclick="campaignType('school')">학교</div>
	</div>
	<hr>

	<div class="container">
		<c:forEach items="${cList }" var="c">
			<c:url var="cDetail" value="campaignDetail.ptsd">
				<c:param name="campaignNo" value="${c.campaignNo }"/>
			</c:url>
			<div align="center" id="campaign-list" onclick="location.href='${cDetail}';">
				<div>
					<img style="width: 100%; height: 50%;" 
					alt="img 안보임" src="../../../resources/campaignUpload/${c.cFileName }">
				</div>
				<div>
					<b>${c.campaignTitle }</b><br>
					${c.cTargetAmount }<br>
				</div>
			</div>
		</c:forEach>
	</div>
	<table align="center">
		<tr align="center" height="20">
				<td colspan="6">
					<c:url var="before" value="campaignList.ptsd">
						<c:param name="page" value="${pi.currentPage-1}"></c:param>
					</c:url>
				</td>
				<c:if test="${pi.currentPage <=1 }">[이전]</c:if>
				<c:if test="${pi.currentPage>1}"><a href="${before }">[이전]</a></c:if>
				<c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
					<c:url var="pagination" value="campaignList.ptsd">
						<c:param name="page" value="${p }"></c:param>
					</c:url>
					<c:if test="${p eq pi.currentPage }">
						<font color="green" size="4">[${p }]</font>
					</c:if>
					<c:if test="${p ne pi.currentPage }">
						<a href="${pagination }">${p }</a>
					</c:if>
				</c:forEach>
				<c:url var="after" value="campaignList.ptsd">
					<c:param name="page" value="${pi.currentPage+1 }"></c:param>
				</c:url>
				<c:if test="${pi.currentPage>=pi.maxPage }">[다음]</c:if>
				<c:if test="${pi.currentPage<pi.maxPage }">
					<a href="${after }">[다음]</a>
				</c:if>
		</tr>
		
	</table>
	
	</div>
	
	<script type="text/javascript">
 		function campaignType(f){
			var type=f;
			$.ajax({
				type:"get",
				url:"campaignList.ptsd",
				data:{"campaignType":type},
				success:function(data){
					//alert("성공!");
					//alert(data);
				},
				error:function(){
					alert("실패!");
				}
			});
			//alert(type);
		}
	</script>
</body>
</html>