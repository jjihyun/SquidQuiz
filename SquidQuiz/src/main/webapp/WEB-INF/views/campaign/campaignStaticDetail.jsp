<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠페인 고정기부처 상세조회</title>
<style>
main{
	width:100%;
}
	#div-money{
		background: #7b4397;  /* fallback for old browsers */
		background: -webkit-linear-gradient(to bottom, #dc2430, #7b4397);  /* Chrome 10-25, Safari 5.1-6 */
		background: linear-gradient(to bottom, #dc2430, #7b4397); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
		width: 60%;
	}
	.ex-img{
		width: 350px;
		height: 250px;
	}
	h4{
		text-align: left;	
	}
	p{
		width:300px;
		word-break:keep-all;
		font-size:14px;
		color: #666666;
		text-align: left;
	}
	#btn{
		cursor: pointer;
		background: #FFAFBD;  /* fallback for old browsers */
		
		border: none;
		width: 200px;
		height: 40px;
	}
</style>
</head>
<body>
	<jsp:include page="../../../resources/html/header.jsp"/><br><br><hr><br><br>
	<main>
	<table align="center" border="1">
		<tr><th colspan="2"><h1 align="center">정기후원</h1></th></tr>
		<tr>
			<td align="center" colspan="2">
				<img  src="../../../resources/campaignStaticImg/정기후원.jpg" alt="img 안뜸" height="350" width="600"><br>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<br><br><br>
				<div id="div-money">
					<br>
					<h1 style="color:white;">${dSumPrice }원</h1>
					<h5>* 퀴즈로 모인 금액에서 상금을 제외한 일부분이 정기후원으로 들어갑니다.</h5>
					<a href="campaignAllCampaignRecord.ptsd" style="color:white;">매회 퀴즈 기부 내역></a>
					<br><br><br>
				</div>			
				<br><br><br>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<iframe width="856" height="438" src="https://www.youtube.com/embed/8Vt6P_keR7U" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				<br><br><br>
			</td>
		</tr>
		<tr>
			<td colspan="2">| 후원금은 이렇게 사용됩니다.</td>
		</tr>
		<tr>
			<td align="center" style="height: 400px;">
				<div style="width: 300px;">
					<img class="ex-img" alt="img" src="../../../resources/campaignStaticImg/주거지원.jpg">
					<h4 style="text-align: left;">주거 지원</h4>
					<p>살 곳이 불안정한 이웃에게 주거 비용을 지원합니다.</p>				
				</div>
			</td>
			<td align="center" style="height: 400px;">
				<div style="width: 300px;">
					<img class="ex-img" alt="img" src="../../../resources/campaignStaticImg/해외아동지원.png"><br>
					<h4>해외아동 지원</h4>
					<p>해외아동이 가난과 질병의 고통에서 벗어나 생애주기에 맞추어 건강하게 성장하고, 어른이 되면 자립할 수 있도록 돕습니다.</p>
				</div>
			</td>
			
		</tr>
		<tr>
			<td align="center" style="height: 400px;">
				<div style="width: 300px;">
					<img class="ex-img" alt="img" src="../../../resources/campaignStaticImg/나눔SOS.jpg">
					<h4>나눔 SOS</h4>
					<p>천재지변이나 각종 재해 등으로 긴급하게 지원이나 도움이 필요한 상황이 발생한 경우 신속하게 지원합니다.</p>
				</div>
			
			</td>
			<td align="center" style="height: 400px;">
				<div style="width: 300px;">
					<img class="ex-img" alt="img" src="../../../resources/campaignStaticImg/해외아동결연.jpg">
					<h4>해외아동결연</h4>
					<p>해외아동들과 결연을 맺고 정서적 교류를 나누며, 지역사회의 교육, 의료, 생계, 시설 지원 등을 통해 아동의 건강한 성장을 돕습니다.</p>
				</div>
			</td>
		</tr>
		<tr style="height: 150px;">
			<td colspan="2" style="background: #FF0099; " align="center">
				<div style=" width: 30%; float: left; height: 100%;">
					<br>
					<button id="btn" onclick="location.href='campaignList.ptsd'">후원하기</button>
				</div>
				<div style="width: 70%; float: left;">
					<h3 style="color: white;">" 당신의 나눔으로 <br>또 하나의 희망이 더해집니다. "</h3>
				</div>
			</td>
		</tr>
	</table>
	</main>
</body>
</html>