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
 	.progressTag {
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
        width: 70%;
  		height: 20px;
        border-radius: 7px;
        color: #35495e;
      }
      progress::-webkit-progress-bar {
        background-color: #eee;
        border-radius: 8px;
      }
      progress::-webkit-progress-value {
        background-color: green;
        border-radius: 8px;
      }
      progress::-moz-progress-bar {
        background-color: #eee;
        border-radius: 8px;
      } 
      
      
.carousel {
	margin-bottom: 0;
	padding: 0 40px 30px 40px;
}

.carousel-control {
	left: -12px;
}
.carousel-control.right {
	right: -12px;
}

.carousel-indicators {
	right: 50%;
	top: auto;
	bottom: 0px;
	margin-right: -19px;
}

.carousel-indicators li {
	background: #c0c0c0;
}

.carousel-indicators .active {
background: #333333;
}
</style>
</head>
<body>
	<jsp:include page="../../../resources/html/header.jsp"/>
	<div id="campaign-body">
		<c:url var="cModify" value="campaignModify.ptsd">
			<c:param name="campaignNo" value="${campaign.campaignNo }"></c:param>
		</c:url>
		<c:url var="cDelete" value="campaignRemove.ptsd">
			<c:param name="campaignNo" value="${campaign.campaignNo }"></c:param>
			<c:param name="fileName" value="${campaign.cFileName}"></c:param>
		</c:url>
		<c:url var="cDonate" value="donationPayView.ptsd">
			<c:param name="campaignNo" value="${campaign.campaignNo }"></c:param>
		</c:url>
		<input type="hidden" value="${campaign.campaignNo }">
		<h2>${campaign.campaignTitle }</h2>
		<h4 style="border: 1px solid red; text-align: center;">(${campaign.campaignType })
			<div style="float: right;">
				<button onclick="location.href='${cModify}'">수정하기</button>&nbsp;&nbsp;
				<button onclick="location.href='${cDelete}'">삭제하기</button>
			</div>
		</h4>
		<input type="hidden" id="dday" value="${campaign.cEndDate }">
		<div id="campaign-detail">
			<div style="float: left; background-color:rgb(255, 233, 233); width:1000px; height: 100%;">
				<img src="../../../resources/campaignUpload/${campaign.cFileName }" alt="no img" style="height: 200px; width: 300px;">
				<p>${campaign.campaignContents }</p>
			</div>
			<div style="background-color:rgb(243, 255, 233); width: 300px; height: 100%; float: left;">
				<!-- 소수점 제거 -->
				<fmt:parseNumber var="percent" value="${detail }" integerOnly="true" />
				<h4 class="all-text">
					<progress class="progressTag" value="${percent }" max="100"></progress>
					<!-- 퍼센트 계산 -->
					<br>${percent}%
				</h4>
				<p class="all-text">모금기한 : ${formatDate }<br>
				</p>
				<h3 class="all-text" id="d-day" style="display:;">D-DAY : ${dDay }일</h3>
				<h5 class="all-text">현재 모금액</h5>
				<h4 class="all-text">${campaign.cNowAmount}원</h4>
				<button onclick="location.href='${cDonate}'">기부하기</button><br>
				<p class="all-text">목표금액 : ${campaign.cTargetAmount }원<br><br>
					모금단체정보<br>${campaign.campaignName }<br><br>
					사이트 바로가기<br><a href="${campaign.cLink }">${campaign.campaignName }</a>
				</p><br>
				<div style="border:1px solid black; text-align: center;">
					다른 후원><br>
					<div style="width: 150px; height: 150px; border:1px solid pink; display:inline-block;">
						
					</div>

				</div>
			</div>
		</div>
		<div style="position: absolute; left: 50%; transform: translateX(-50%);">
			<button class="camp-btn" onclick="location.href='${cDonate}'">기부하기</button>&nbsp;&nbsp;
			<button class="camp-btn">목록으로</button>
		</div>
	
	</div>
	
	
	<script>
		$(function(){
			var dday = ${dDay};
			alert(parseInt(dday));
/* 			if(dday>0){
				$("#d-day").style.display="none";
				alert('실go');
			} */
		});


	</script>
</body>
</html>