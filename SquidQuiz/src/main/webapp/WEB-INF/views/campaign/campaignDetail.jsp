<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠페인 디테일</title>
<style type="text/css">
	#campaign-body{
		background-color: gray; 
		width:1300px; 
		position: absolute; 
		left: 50%; 
		transform: translateX(-50%);
		margin: 30px;
	}
	#campaign-detail{
		height: 700px;
		width: 1300px;
		background-color:rgb(230, 230, 230);
	}
	.all-text{
		text-align: center;
	}
	.camp-btn{
		width: 150px;
		height: 50px;
		margin: 30px;
		border:none;
		cursor: pointer;
	}
</style>
</head>
<body>
	<jsp:include page="../../../resources/html/header.jsp"/>
	<div id="campaign-body">
		<input type="hidden" value="${campaign.campaignNo }">
		<h2>${campaign.campaignTitle }</h2>
		<h4>${campaign.campaignType }</h4>
		<div id="campaign-detail">
			<div style="float: left; background-color:rgb(255, 233, 233); width:1000px; height: 100%;">
				사진, 설명...
			</div>
			<div style="background-color:rgb(243, 255, 233); width: 300px; height: 100%; float: left;">
				<!-- 소수점 제거 -->
				<fmt:parseNumber var="percent" value="${detail }" integerOnly="true" />
				<h4 class="all-text">
					<!-- 퍼센트 계산 -->
					${percent}%
				</h4>
				<p class="all-text">모금기한 : ${formatDate }<br>
					D-(계산해서 적용)
				</p><br>
				<h5 class="all-text">현재 모금액</h5>
				<h4 class="all-text">${campaign.campaignNowAmount}</h4>
				<button>기부하기</button><br>
				<p class="all-text">목표금액 : ${campaign.campaignTargetAmount }원<br>
					모금단체정보<br>${campaign.campaignName }<br>
					<a href="#">사이트 바로가기</a>
				</p><br>
				<div>
					다른 후원><br>
					(다른 후원 보이고 누르면 이동되게)
				</div>
			</div>
		</div>
		<div style="position: absolute; left: 50%; transform: translateX(-50%);">
			<button class="camp-btn">기부하기</button>&nbsp;&nbsp;<button class="camp-btn">목록으로</button>
		</div>
	
	</div>
</body>
</html>