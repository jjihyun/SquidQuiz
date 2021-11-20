<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠페인 목록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
main{
	width: 100%;
	height:2500px;
}
h4{color:#4B4B4B;}
.first{
	width: 1300px;
	position: absolute; 
	left: 50%; 
	transform: translateX(-50%);
}
.static-div{ 
	border: 2px solid rgb(234, 234, 234);
	width: 700px;
	margin-left: 300px;
}
#nav-type {
	height: 120px;
	text-align: center;
	display:flex;

}
.btn{
	border: none; background-color:rgb(200, 113, 113); color:white;
	width: 200px; height: 50px; font-size: 21px; font-weight: bold;
}
	.btn:hover{
		color:white;
	}
.campaign-type {
	float: left; text-align: center; height: 100%; width: 50px;
	border:1px solid rgb(220, 113, 113); flex: 1; margin-left:40px;
	cursor: pointer; border-radius: 20px; color:rgb(220, 113, 113);
}
	.campaign-type:hover{
		background-color:rgb(220, 113, 113); color:white;
	}

.container {
	width:100%;
}
#container-1 {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	grid-template-rows: repeat(2, 1fr);
	column-gap: 50px;
	row-gap: 50px;
	margin: 30px;
}

#campaign-list {
	border: 1px solid rgb(234, 234, 234);
	padding:10px;
	height: 360px;
	cursor: pointer;

}
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
	<header>
		<jsp:include page="../../../resources/html/header.jsp"/>
	</header>
	<main>
	<br><hr><br>
	<div class="first">
		<div style="text-align: center;">
			<h4 style="">이번주 퀴즈 기부금액</h4>
			<h2 id="quizThisCount">${dPrice }</h2><br>
			<h4 style="">퀴즈 전체 기부금액</h4>
			<h2 id="quizAllCount">${dSumPrice }</h2><br>
			<hr><br>
			<div class="static-div"><br><br>
				<h4 style="color:#4B4B4B; font-weight: bold;">정기후원</h4><br>
				<img src="../../../resources/campaignStaticImg/정기후원.jpg" alt="img 안뜸"><br><br>
				<h3 style="color:#4B4B4B; font-weight: bold;">"작은 후원이 큰 힘이 됩니다"</h3><br><br><br>
				<button class="btn" onclick="location.href='campaignStaticDetail.ptsd'">자세히보기</button><br><br>
				<a href="campaignAllCampaignRecord.ptsd" style="float:right;">퀴즈 참여 모금액 후원 내역>&nbsp;&nbsp;</a><br><br>
			</div><br><br><br>
			<c:if test="${sessionScope.loginUser ne null }">
				<c:if test="${sessionScope.loginUser.adminType eq 'Y'.charAt(0) }">
					<button class="btn" style="float:right; background-color:rgb(230, 113, 113);" onclick="location.href='campaignWriteView.ptsd'">캠페인 글 작성</button><br>
				</c:if>
			</c:if>
		</div>
		<br><br><br><br><br>
		<input type="hidden" name="campaignType" value="${type }">
		<div id="nav-type">
			<span class="campaign-type" onclick="location.href='campaignList.ptsd'"><br><i class="fa fa-home fa-4x" aria-hidden="true"></i><br><br><b>전체</b></span>
			<span class="campaign-type" onclick="campaignType('child')"><br><i class="fa fa-child fa-4x" aria-hidden="true"></i><br><br><b>아동, 청소년</b></span>
			<span class="campaign-type" onclick="campaignType('old')"><br><i class="fa fa-male fa-4x" aria-hidden="true"></i><br><br><b>어르신</b></span>
			<span class="campaign-type" onclick="campaignType('handicap')"><br><i class="fa fa-wheelchair fa-4x" aria-hidden="true"></i><br><br><b>장애인</b></span>
			<span class="campaign-type" onclick="campaignType('environment')"><br><i class="fa fa-leaf fa-4x" aria-hidden="true"></i><br><br><b>환경</b></span>
			<span class="campaign-type" onclick="campaignType('multicultural')"><br><i class="fa fa-globe fa-4x" aria-hidden="true"></i><br><br><b>다문화</b></span>
			<span class="campaign-type" onclick="campaignType('facility')"><br><i class="fa fa-building fa-4x" aria-hidden="true"></i><br><br><b>시설</b></span>
			<span class="campaign-type" onclick="campaignType('school')"><br><i class="fa fa-graduation-cap fa-4x" aria-hidden="true"></i><br><br><b>학교</b></span>
		</div><br><br>
		<hr><br><br>
		<div class="container">
			<div id="container-1">
				<c:forEach items="${cList }" var="c">
					<c:url var="cDetail" value="campaignDetail.ptsd">
						<c:param name="campaignNo" value="${c.campaignNo }"/>
					</c:url>
					<div align="center" id="campaign-list" onclick="location.href='${cDetail}';">
						<div id="img-container">
							<img style="width: 100%; height: 180px;" 
							alt="img 안보임" src="../../../resources/campaignUpload/${c.cFileName }">
						</div>
						<div><br>
							<b style="font-size: 16px; word-break:keep-all;">${c.campaignTitle }</b><br>
							${c.campaignName }<br>
							<fmt:parseNumber var="percent" value="${c.getcNowAmount()/c.getcTargetAmount()*100}" integerOnly="true" />
							<div class="progress">
							  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="${percent}" aria-valuemin="0" aria-valuemax="100" style="width: ${percent}%;">
							    ${percent}%
							  </div>
							</div>
							<b>목표금액 : <fmt:formatNumber type="number" value="${c.cTargetAmount }"/>원</b>
						</div>
					</div>
				</c:forEach>
			</div>
		</div><br><br>
		<table align="center">
			<tr align="center" height="20">
					<td colspan="6" id="td-1">
						<c:url var="before" value="campaignList.ptsd">
							<c:param name="page" value="${pi.currentPage-1}"></c:param>
							<c:param name="type" value="${campaignType }"></c:param>
						</c:url>
						<c:if test="${pi.currentPage <=1 }"><font class="font-str">이전</font></c:if>
						<c:if test="${pi.currentPage>1}"><a href="${before }"><font class="font-str">이전</font></a></c:if>
						<c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
							<c:url var="pagination" value="campaignList.ptsd">
								<c:param name="page" value="${p }"></c:param>
								<c:param name="type" value="${campaignType }"></c:param>
							</c:url>
							<c:if test="${p eq pi.currentPage }">
								<font size="4" id="current-font" class="font-num">${p }</font>
							</c:if>
							<c:if test="${p ne pi.currentPage }">
								<a href="${pagination }" class="font-num" style="color:rgb(201, 113, 113);">${p }</a>
							</c:if>
						</c:forEach>
						<c:url var="after" value="campaignList.ptsd">
							<c:param name="page" value="${pi.currentPage+1 }"></c:param>
							<c:param name="type" value="${campaignType }"></c:param>
						</c:url>
						<c:if test="${pi.currentPage>=pi.maxPage }"><font class="font-str">다음</font></c:if>
						<c:if test="${pi.currentPage<pi.maxPage }">
							<a href="${after }"><font class="font-str">다음</font></a>
						</c:if>
					</td>
			</tr>
			
		</table>
	</div>
	</main>
	<footer>
		<div style="width: 100%; height: 200px; float:left; border: 1px solid blue;"> 
			(footer 자리)
		</div>	
	</footer>
	
	<script type="text/javascript">
		var memberCountConTxt1 = ${dPrice };
		var memberCountConTxt2= ${dSumPrice };
		
		$({ val : 0 }).animate({val : memberCountConTxt1 }, {
		   duration: 1000,
		  step: function() {
		    var num = numberWithCommas(Math.floor(this.val));
		    $("#quizThisCount").text(num);
		  },
		  complete: function() {
		    var num = numberWithCommas(Math.floor(this.val));
		    $("#quizThisCount").text(num);
		  }
		}), $({ val : 0 }).animate({val : memberCountConTxt2 }, {
			   duration: 1000,
				  step: function() {
				    var num = numberWithCommas(Math.floor(this.val));
				    $("#quizAllCount").text(num);
				  },
				  complete: function() {
				    var num = numberWithCommas(Math.floor(this.val));
				    $("#quizAllCount").text(num);
			}
		});
		//숫자에 ,을 추가해주는 함수(3자리마다 , 추가)
		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	
	
	
  		function campaignType(f){
			var type=f;
			//alert(type);
			var page=${pi.currentPage};
			console.log("현재페이지"+page);
 			$.ajax({
				type:"get",
				url:"campaignListJSON.ptsd",
				data:{"campaignType":type, "page": page}, 
				dataType:"json",
				success:function(data){
					var str = "";
					var str2 = "";
					$("#container-1").empty();
					$("#td-1").empty();
					//console.log("pi : "+JSON.stringify(data.pi));
					
					for(var i =0;i<data.cList.length;i++){
						var cPercent = Math.floor(data.cList[i].cNowAmount/data.cList[i].cTargetAmount*100);
						var cTargetAmount = data.cList[i].cTargetAmount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
						str += "<div align='center' id='campaign-list' onclick='location.href=\"campaignDetail.ptsd?campaignNo="+data.cList[i].campaignNo+"\";'>";
						str += "<div><img style='width: 100%; height: 180px;' alt='img 안보임' src='../../../resources/campaignUpload/"+data.cList[i].cFileName+"'></div>";
						str += "<div><br><b style='font-size: 16px; word-break:keep-all;'>"+data.cList[i].campaignTitle+"</b><br>"+data.cList[i].campaignName+"<br>";
						str += "<div class='progress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='"+cPercent+"' aria-valuemin='0' aria-valuemax='100' style='width: "+cPercent+"%;'>"+cPercent+"%</div></div>";
						str += "<b>목표금액 : "+cTargetAmount+"원</b></div></div>";
					}
					//console.log("pi 들어갈 차례");
					if(data.pi.currentPage<=1){
						str2+="<font class='font-str'>이전</font>";
						console.log("이전");
					}else if(data.pi.currentPage>1){
						str2+="<a href='campaignList.ptsd?type="+type+"&page="+(parseInt(data.pi.currentPage)-1)+"'><font class='font-str'>이전</font></a>";
					}
					for(var p = 1;p<=data.pi.endNavi;p++){
						if(p == data.pi.currentPage){
							str2+="<font size='4' id='current-font' class='font-num'>"+p+"</font>";
						} else if(p != data.pi.currentPage){
							str2+="<a href='campaignList.ptsd?type="+type+"&page="+p+"' class='font-num' style='color:rgb(201, 113, 113);'>"+p+"</a>";
						}
					}
					if(data.pi.currentPage>=data.pi.maxPage){
						str2+="<font class='font-str'>다음</font>";
					} else if(data.pi.currentPage<data.pi.maxPage){
						str2+="<a href='campaignList.ptsd?type="+type+"&page="+(data.pi.currentPage+1)+"'><font class='font-str'>다음</font></a>";
					}
					
					$("#container-1").html(str);
					$("#td-1").html(str2);
				},
				error:function(){
					alert("실패!");
				}
			});
		}

	</script>
</body>
</html>