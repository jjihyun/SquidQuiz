<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠페인 디테일</title>
<!-- slick(슬라이드) 플러그인 추가 -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style type="text/css">
	main{
		height:1300px; width:100%;
	}
	.type{
		text-align:center; font-size: 18px; font-weight:normal;
	}
	#campaign-body{
		width:1350px;  position: absolute; left: 50%;  transform: translateX(-50%); margin: 30px;
	}
	#campaign-detail{
		height: 1100px; width: 100%; padding-top:20px; margin-left:10px;
	}
	.all-text-center{ text-align: center; }
	.all-text-left{ padding-left:30px; }
	#btn-donate{ display:block; margin:0px auto; border:2px solid #22741C; background:white; font-size:20px;
		width: 150px; height: 50px; cursor: pointer; color:#22741C;}
	#btn-donate:hover{border:3px solid rgb(180, 80, 80); color:rgb(180, 80, 80); font-weight: bold;}
	#camp-img{
		height: 550px; width: 670px; display: block; margin: 0px auto; padding:100px;	
	}
	.camp-btn{
		width: 150px; height: 50px; margin: 30px; border:none; cursor: pointer; color:white;
		background-color:rgb(180, 80, 80); font-size:15px; border-radius: 3px; font-weight: bold;
	}
	.admin-btn{
		width: 130px; height: 30px; font-size:15px; color:white; cursor:pointer;
	}
 	.progressTag {
        -webkit-appearance: none; -moz-appearance: none;
        appearance: none; width: 70%; height: 20px; border-radius: 7px;  color: #35495e;
      }
      progress::-webkit-progress-bar {
        background-color: #eee; border-radius: 8px;
      }
      progress::-webkit-progress-value {
        background-color: green; border-radius: 8px;
      }
      progress::-moz-progress-bar {
        background-color: #eee; border-radius: 8px;
      } 
      .fas{
      	color:lightgray; background-color:white; border:none; cursor:pointer; position:relative;
      }
      .slick-prev{
      	right:100px; top:70px;
      }
      .slick-next{
      	left:100px; bottom:150px;    
      }
      
	textarea{
		border:none; cursor: default; font-size: 17px; position: absolute; left:10%; resize:none;
		width: 750px; height:400px; font-family: 'Noto Sans KR', sans-serif; padding: 15px; padding-right: 20px;
  	}
  	textarea::-webkit-scrollbar {
	    width: 8px; height: 8px; background: #ffffff;
	 }
	 textarea::-webkit-scrollbar-thumb {
	    border-radius: 3.5px; background-color: rgb(201, 113, 113);
	}
	 textarea::-webkit-scrollbar-track {
	    background: #ffffff;
  	}
	textarea:focus{ outline:none; }
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
			<h2 align="center">${campaign.campaignTitle }</h2><hr>
			<h4>
				<c:if test="${campaign.campaignType eq 'child'}"><p class="type">아동, 청소년</p></c:if>
				<c:if test="${campaign.campaignType eq 'old'}"><p class="type">어르신</p></c:if>
				<c:if test="${campaign.campaignType eq 'handicap'}"><p class="type">장애인</p></c:if>
				<c:if test="${campaign.campaignType eq 'environment'}"><p class="type">환경</p></c:if>
				<c:if test="${campaign.campaignType eq 'multicultural'}"><p class="type">다문화</p></c:if>
				<c:if test="${campaign.campaignType eq 'facility'}"><p class="type">시설</p></c:if>
				<c:if test="${campaign.campaignType eq 'school'}"><p class="type">학교</p></c:if>
				<div style="float: right; padding-right:45px;">
					<c:if test="${sessionScope.loginUser.adminType eq 'Y'.charAt(0) }">
						<button onclick="location.href='${cModify}'" class="admin-btn" style="background-color:rgb(53,182,44);">수정하기</button>&nbsp;&nbsp;
						<button onclick="location.href='${cDelete}'" class="admin-btn" style="background-color:rgb(204,61,61);">삭제하기</button>
					</c:if>
				</div>
			</h4><br>
			<input type="hidden" id="dday" value="${campaign.cEndDate }">
			<div id="campaign-detail">
				<div style="float: left;  width:1000px; height: 100%; border: 2px solid #EFEFEF; margin-right:3px;">
					<img src="../../../resources/campaignUpload/${campaign.cFileName }" alt="no img" id="camp-img">
					<textarea id="contexts" rows="18" cols="90" wrap="hard" style="overflow-x:hidden; overflow-y:auto;" readonly>${campaign.campaignContents }</textarea>
				</div>
				<div style="width: 300px; height: 100%; float: left;">
					<div style="background-color:rgb(201, 113, 113); color:white;">
						<!-- 소수점 제거 --><br>
						<fmt:parseNumber var="percent" value="${detail }" integerOnly="true" />
						<h4 class="all-text-center">
							<progress class="progressTag" value="${percent }" max="100"></progress>
							<!-- 퍼센트 계산 -->
							<br>${percent}%
						</h4>
						<p class="all-text-center">${enrollDate} ~ ${formatDate }<br>
						</p>
						<h3 class="all-text-center" id="d-day" style="display:;">D-DAY : ${dDay }</h3><br>
						<p class="all-text-left">현재 모금액 : <fmt:formatNumber type="number" value="${campaign.cNowAmount}"/>원</p>
						<p class="all-text-left">목표금액 : <fmt:formatNumber type="number" value="${campaign.cTargetAmount }"/>원<br><br>
							모금단체 : ${campaign.campaignName }<br><br>
							사이트 바로가기> <a href="${campaign.cLink }" style="color: #AFE1FF;" target="_blank">${campaign.campaignName }</a>
						</p><br>
						<c:if test="${sessionScope.loginUser ne null && dDay ge 0}">
							<button onclick="location.href='${cDonate}'" id="btn-donate">기부하기</button><br>
						</c:if>
					</div><br><br>
					<div style="text-align: center;" id="slick-campaign">
						<p style="font-weight: bold; border:2px solid #EFEFEF; width:100px; height:30px; margin-left:100px;">다른 후원</p>
						<div style="width: 150px; height: 150px; display: inline-block;" class="slick-div">
							<c:forEach items="${cList }" var="c">
								<div style="cursor: pointer;" onclick="location.href='campaignDetail.ptsd?campaignNo=${c.campaignNo}'">
									<img alt="이미지없음"
										src="../../../resources/campaignUpload/${c.cFileName }"
										style="display: block; margin: auto; width: 100px; height: 100px;">
									<p style="font-size:14px; font-weight: bold;">"${c.campaignTitle }"</p>
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
				<c:if test="${sessionScope.loginUser ne null && dDay ge 0}">
					<button class="camp-btn" onclick="location.href='${cDonate}'">기부하기</button>&nbsp;&nbsp;
				</c:if>
				<button class="camp-btn" onclick="location.href='campaignList.ptsd'"
				style="	background: #dd3e54; background: -webkit-linear-gradient(to right, #6be585, #dd3e54);
				background: linear-gradient(to right, #6be585, #dd3e54); ">목록으로</button>
			</div>
		</div>
		
	</main>
	<footer>
		<jsp:include page="../../../resources/html/footer.html"/>
	</footer>
	
	<script> 
		$(function(){
			//text=text.replace(/(?:\r\n|\r|\n)/g,'<br/>');
			$('#contexts').val().replace(/\r\n|\n/ , "<br>");
		});
		
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