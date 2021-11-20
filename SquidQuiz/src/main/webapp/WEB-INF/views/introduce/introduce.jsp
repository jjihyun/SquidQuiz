<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소개</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
<script>
		$(document).ready(function() {
			$('#headerMain').load("/resources/html/header.jsp");
		});
	</script>
	<style>
		*{
			margin: 0;
			padding: 0;
			box-sizing: border-box;
		}
		.main{
			
		}
		.box{
			width:400px;
			margin: 50px auto;
			max-height: 400px;
			padding : 75px 20px;
			text-align : center;
			font-size: 3em;
		}
		.stairs{
			margin-top:0px;
			padding-top:100px;
			width:86%;
			
			align:
		}
		.eachrows{
			margin-bottom: 200px;
		}
		.first{
			padding-top:100px;
/* 			margin-bottom: 100px; */
			height:80vh;
		}
		
		.second {
			
			
		}
		.third{
		
		}
		.back-black{
			background: black;
		}
		.back-black p {
			font: white;
		}
		.title{
			color: white;
		}
		.subtitle{
			color: white;
			font-size: 20px;
		}
		.ptext{
			color: white;
			font-size: 30px;
		}
		.img{
			width:80%;
		}
	</style>
</head>
<body>
	<div id="headerMain"></div>
	<script>
		AOS.init(
		
		);
	</script>
	<div class="main"> 
	<br><br><br><br><br><br><br>
		<section class="container">
		
		</section>
	<!-- 1행 -->
		<section class="container first">
			<h1 data-aos="flip-down" data-aos-delay="300" data-aos-duration="1000"align="center">SQUID QUIZ</h1>
				<div class=""data-aos="fade-up" data-aos-delay="500" data-aos-duration="3000">
					<p style="font-size:40px"align="center">오징어 퀴즈에 방문하신 여러분을 환영합니다!</p>
				</div>
		</section>
		<div class="back-black">
	<!-- 2행 -->
		<div class="row eachrows second">
			<div class="col-md-1 visible"></div>
			
			<div class="col-md-10 second">
				<div align="center" data-aos="fade-up" data-aos-delay="400" data-aos-duration="2800" data-aos-offset="300" >
					<img class="stairs" alt="이미지 로드 실패" src="https://www.gannett-cdn.com/presto/2021/10/01/USAT/5aa751ff-b2a0-4dde-9fb8-d5e5d0e6d379-SquidGame_Unit_101_001.jpeg">
				</div>
			</div>
			<div class="col-md-1 visible"></div>
		</div>
	
	<!-- 3행 -->
		<div class="row eachrows third">
			<div class="col-md-1 visible"></div>
			<!-- 좌50 -->
			<div class="col-md-5">
				<h1 class="title" data-aos="fade-right" data-aos-duration="1000" data-aos-delay="300"align="center" style="padding-right: 50px" >QUIZ</h1><br>
				<div align ="center" data-aos="flip-up" data-aos-duration="1000" data-aos-delay="350">
					<p class="subtitle">   OX 퀴즈에 참여하고 상금을 획득하세요 !</p><br><br><br>
					<p class="ptext"align="center" >
						'최후의 1인'이 남을 때까지 끝없이 이어지는 퀴즈에 참가해보세요. 참가자들이 지불한  POINT로 이루어진 상금은 오직 단 한 사람에게만  주어집니다. 
					</p>
				</div>
			</div>
			<!-- 우50 -->
			<div class="col-md-5">
			<!-- style="padding-top:200px" -->
				<div  class="img" align="center" data-aos="fade-up-left" data-aos-delay="400" data-aos-duration="2000" data-aos-offset="400">
					<img  alt="이미지 로드 실패" src="https://ichef.bbci.co.uk/news/976/cpsprodpb/D497/production/_120732445_-3.jpg">
				</div>
			</div>
			<div class="col-md-1 visible"></div>
		</div>
	<!-- 4행 -->
		<div class="row eachrows fourth">
			<div class="col-md-1 visible"></div>
			<!-- 좌50 -->
			<div class="col-md-5">
				<div class="img" data-aos ="fade-up-right" data-aos-offset="500" data-aos-duration="1000">
				<!-- 돼지저금통 -->
					<img class="prize" alt="로드실패" src="https://mblogthumb-phinf.pstatic.net/MjAyMTA5MThfMTIz/MDAxNjMxOTM5NTQyNTE5.hD-Q_P5VIjsrpP4khne3wERfQWEvK_J8VlA8EQKTol8g.6HU3X2kSUzoP4edagRtJAnxwBYj56n7JLCLr9OMw9rYg.PNG.gram89526/SE-e70cfd19-2091-49bf-9f76-3bbcfafcaf5b.png?type=w800">
				</div>
			</div>
			<!-- 우50 -->
			<div class="col-md-5">
				<h1 class="title" data-aos="fade-up" data-aos-duration="1000" data-aos-delay="600"align="center">탈락...?</h1><br>
				<div  data-aos="flip-up" data-aos-duration="1600" data-aos-delay="350">
					<p class="ptext"align="center" >
						혹여나 탈락하더라도 너무 상심하지 마세요.<br> 참가비의 일부는 <strong>기부</strong>되어 꼭 필요한 곳에 의미있게 사용되니까요. 매 퀴즈 참가비의 일부는 <strong>사랑의열매</strong> 사회복지공통모금회에 전달됩니다.
					</p>
				</div>
			</div>
			<div class="col-md-1 visible"></div>
		</div>
	<!-- 5행 -->
		<div class="row eachrows fifth">
			<div class="col-md-1 visible"></div>
			<!-- 좌50 -->
			<div class="col-md-5">
			</div>
			<!-- 우50 -->
			<div class="col-md-5">
			
			</div>	
			<div class="col-md-1 visible"></div>
		</div>
		<!-- ?행 -->
		<section class="container first">
			<div class="" data-aos="fade-up">
<!-- 				 <img class="card" src="https://img.koreatimes.co.kr/upload/newsV2/images/202110/1817e945ab0246eb9a69eb20984ac321.jpg/dims/resize/740/optimize"> -->
			</div>
		</section>
	</div>
	</div>

	

	<!-- 명함 -->
	
	
	<div></div>
	<div></div>
</body>
</html>