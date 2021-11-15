<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠페인 디테일</title>
<!-- slick(슬라이드) 플러그인 추가 -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<style type="text/css">
main{
	height:1300px;
	width:100%;
	border:1px solid black;
}
	#campaign-body{
		border: 1px solid gray; 
		width:1300px; 
		position: absolute; 
		left: 50%; 
		transform: translateX(-50%);
		margin: 30px;
	}
	#campaign-detail{
		height: 800px;
		width: 1300px;
	}
	.all-text{
		text-align: center;
	}
	#camp-img{
		height: 400px;
		width: 550px;
		display: block; margin: 0px auto; padding:100px;	
	}
	.camp-btn{
		width: 150px;
		height: 50px;
		margin: 30px;
		border:none;
		cursor: pointer;
	}
	.admin-btn{
		width: 130px;
		height: 30px;
		font-size:15px;
		color:white;
		border: none;
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
      
      .fas{
      	color:lightgray;
      	background-color:white;
      	border:none;
      	cursor:pointer;
      	position:relative;
      }
      .slick-prev{
      	right:80px;
      	top:70px;
      }
      .slick-next{
      	left:80px;
      	bottom:90px;    
      }
      
      
</style>
</head>
<body>
	<jsp:include page="../../../resources/html/header.jsp"/><br><br><br>
	<main>
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
			<h2>${campaign.campaignTitle }</h2><hr>
			<h4>(${campaign.campaignType })
				<div style="float: right;">
					<button onclick="location.href='${cModify}'" class="admin-btn" style="background-color:rgb(53,182,44);">수정하기</button>&nbsp;&nbsp;
					<button onclick="location.href='${cDelete}'" class="admin-btn" style="background-color:rgb(204,61,61);">삭제하기</button>
				</div>
			</h4><br><br>
			<input type="hidden" id="dday" value="${campaign.cEndDate }">
			<div id="campaign-detail">
				<div style="float: left;  width:1000px; height: 100%;">
					<img src="../../../resources/campaignUpload/${campaign.cFileName }" alt="no img" id="camp-img">
					<p style="text-align:center;">${campaign.campaignContents }</p>
				</div>
				<div style="width: 300px; height: 100%; float: left;">
					<div style="background-color:rgb(201, 113, 113); color:white;">
						<!-- 소수점 제거 --><br>
						<fmt:parseNumber var="percent" value="${detail }" integerOnly="true" />
						<h4 class="all-text">
							<progress class="progressTag" value="${percent }" max="100"></progress>
							<!-- 퍼센트 계산 -->
							<br>${percent}%
						</h4>
						<p class="all-text">${enrollDate} ~ ${formatDate }<br>
						</p>
						<h3 class="all-text" id="d-day" style="display:;">D-DAY : ${dDay }</h3>
						<p class="all-text">현재 모금액 : ${campaign.cNowAmount}원</p>
						<c:if test="${sessionScope.loginUser ne null }">
							<button onclick="location.href='${cDonate}'" style="display:block; margin:0px auto;">기부하기</button><br>
						</c:if>
						<p class="all-text">목표금액 : ${campaign.cTargetAmount }원<br><br>
							모금단체정보<br>${campaign.campaignName }<br><br>
							사이트 바로가기<br><a href="${campaign.cLink }">${campaign.campaignName }</a>
						</p><br>
					</div><br><br>
					<div style="border:1px solid black; text-align: center;">
						다른 후원><br>
						<div style="width: 150px; height: 150px; display: inline-block;" class="slick-div">
							<c:forEach items="${cList }" var="c">
								<div>
									<img alt="이미지없음"
										src="../../../resources/campaignUpload/${c.cFileName }"
										style="display: block; margin: auto; width: 100px; height: 100px; border:1px solid red;">
									"${c.campaignTitle }"
								</div>
							</c:forEach>
						</div>
						<!-- 위에 넣으면 slick(슬라이드) 작동을 안해서 여기에 작성  -->
						<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
						<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

					</div>
				</div>
			</div>
			<div style="position: absolute; left: 50%; transform: translateX(-50%);">
				<c:if test="${sessionScope.loginUser ne null }">
					<button class="camp-btn" onclick="location.href='${cDonate}'">기부하기</button>&nbsp;&nbsp;
				</c:if>
				<button class="camp-btn" onclick="location.href='campaignList.ptsd'">목록으로</button>
			</div>
		
		</div>
		
	</main>
	<footer>
		<div style="width: 100%; height: 200px; float:left; border: 1px solid blue;"> 
			(footer 자리)
		</div>
	</footer>
	
	<script> 
	
	$(".slick-div").slick({
		arrows:true, //next, prev 이동버튼
		autoplay:true, //자동넘김 여부
		infinite:true, //반복설정
		speed:300, //슬라이드 속도
		pauseOnHover:true, //마우스 hover시 슬라이드 멈춤
		//화살표 커스텀
		prevArrow : "<button type='button' class='slick-prev fas fa-angle-left fa-2x'></button>", 
		nextArrow : "<button type='button' class='slick-next fas fa-angle-right fa-2x'></button>",  
		slidestoShow:1 //보여질 슬라이드 수
	});

	</script>

</body>
</html>