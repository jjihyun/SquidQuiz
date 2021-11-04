<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠페인 목록</title>
<style type="text/css">
	#nav-type{
		height: 100px;
		background-color: yellow;
		text-align:center;
	}
		.campaign-type{
			float:left;
			text-align:center;
			height: 100%;
			width: 100px;
			background-color: gray;
		}
	.container{
		display: grid;
		grid-template-columns: repeat(4, 1fr);
		grid-template-rows: repeat(2, 1fr);
		column-gap: 30px;
		row-gap: 30px;
		background-color: lightgray;
		margin:30px;
	}
		#campaign-list{
			background-color:gray;
			height: 300px;
			cursor: pointer;
			
		}
</style>
</head>
<body>
	<jsp:include page="../../../resources/html/header.jsp"/>
	<h2 align="center">이번주 퀴즈 참가 모음액</h2>
	<h4>???,???원</h4>
	누적 모금액<br>
	<h4>??,???,???원</h4>
	<div>
		<img src="">
	</div>
	<div id="nav-type">
		<div class="campaign-type" onclick="location.href='??.ptsd;'" value="">아동, 청소년</div>
		<div class="campaign-type" onclick="location.href='??.ptsd;'" value="">어르신</div>
		<div class="campaign-type" onclick="location.href='??.ptsd;'" value="">장애인</div>
		<div class="campaign-type" onclick="location.href='??.ptsd;'" value="">환경</div>
		<div class="campaign-type" onclick="location.href='??.ptsd;'" value="">다문화</div>
		<div class="campaign-type" onclick="location.href='??.ptsd;'" value="">시설</div>
		<div class="campaign-type" onclick="location.href='??.ptsd;'" value="">학교</div>
	</div>
	<hr>

	<div class="container">
		<c:forEach items="${cList }" var="c">
			<c:url var="cDetail" value="campaignDetail.ptsd">
				<c:param name="campaignNo" value="${c.campaignNo }"/>
			</c:url>
			<div align="center" id="campaign-list" onclick="location.href='${cDetail}';">
				${c.campaignTitle }<br>
				${c.campaignTargetAmount }
			</div>
		</c:forEach>
	</div>

</body>
</html>