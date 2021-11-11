<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠페인 목록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
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
/*  border:1px solid red; */
	text-align: center;
	display:flex;

}
button{
	border: none;
	background-color:rgb(201, 113, 113);
	color:white;
	width: 200px;
	height: 50px;
	font-size: 21px;
	font-weight: bold;
}

.campaign-type {
	float: left;
	text-align: center;
	height: 100%;
	width: 50px;
	border:1px solid rgb(201, 113, 113);
	flex: 1;
	margin-left:40px;
	cursor: pointer;
	border-radius: 20px;
	color:rgb(201, 113, 113);
}
	.campaign-type:hover{
		background-color:rgb(201, 113, 113);
		color:white;
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
	height: 300px;
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

</style>
</head>
<body>
	<jsp:include page="../../../resources/html/header.jsp"/>
	<br><hr><br>
	<div class="first">
	<div style="text-align: center;">
		<h3 style="font-weight: bold;">이번주 퀴즈 참가 모음액</h3>
		<h2>${dPrice }원</h2><br>
		<h3 style="font-weight: bold;">누적 모금액</h3>
		<h2>${dSumPrice }원</h2><br>
		<hr>
		<div class="static-div"><br>
			<h3 style="color:rgb(0, 34, 102); font-weight: bold;">정기후원</h3><br>
			<img src="../../../resources/campaignStaticImg/정기후원.png" alt="img 안뜸">
			<h2 style="color:rgb(0, 34, 102); font-weight: bold;">"세계 어린이 돕기"</h2><br>
			<button onclick="location.href='campaignStaticDetail.ptsd'">자세히보기</button><br><br>
			<a href="campaignAllCampaignRecord.ptsd" style="float:right;">퀴즈 참여 모금액 후원 내역>&nbsp;&nbsp;</a><br><br>
		</div><br><br><br>
		<button style="float:right;" onclick="location.href='campaignWriteView.ptsd'">캠페인 글 작성</button>
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
						<img style="width: 100%; height: 200px;" 
						alt="img 안보임" src="../../../resources/campaignUpload/${c.cFileName }">
					</div>
					<div>
						<b>${c.campaignTitle }</b><br>
						<progress class="progressTag" value="${c.getcNowAmount()/c.getcTargetAmount()*100} " max="100"></progress>
						<br>${c.getcNowAmount()/c.getcTargetAmount()*100}%<br>
						목표금액 : ${c.cTargetAmount }원<br>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<table align="center">
		<tr align="center" height="20">
				<td colspan="6" id="td-1">
					<c:url var="before" value="campaignList.ptsd">
						<c:param name="page" value="${pi.currentPage-1}"></c:param>
					</c:url>
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
				</td>
		</tr>
		
	</table>
		<br><br>
		<div style="width: 100%; height: 200px; float:left; border: 1px solid blue;"> 
			(footer 자리)
		</div>
	</div>
	
	<script type="text/javascript">
  		function campaignType(f){
			var type=f;
			var page=${pi.currentPage};
			console.log(page);
 			$.ajax({
				type:"get",
				url:"campaignListJSON.ptsd",
				data:{"campaignType":type, "page": page}, 
				dataType:"json",
				success:function(data){
					console.log(data);
					var str = "";
					var str2 = "";
					$("#container-1").empty();
					$("#td-1").empty();
					
					var startPage = ${pi.startNavi};
					var endPage = ${pi.endNavi};
					console.log(startPage);
					console.log(endPage);
					
					//$("#container-1").html(data[0].campaignName); 
					for(var i =0;i<data.length;i++){
						//console.log($("#container-1").html(data[0].cFileName));
						var result = parseInt(data[i].cNowAmount)/parseInt(data[i].cTargetAmount)*100;
						str += "<div align='center' id='campaign-list' onclick='location.href=\"campaignDetail.ptsd?campaignNo="+data[i].campaignNo+"\";'>";
						str += "<div><img style='width: 100%; height: 200px;' alt='img 안보임' src='../../../resources/campaignUpload/"+data[i].cFileName+"'></div>";
						str += "<div><b>"+data[i].campaignTitle+"</b><br><progress class='progressTag' value='"+result+"' max='100'></progress><br>"+result+"%<br>목표금액 : "+data[i].cTargetAmount+"원<br></div></div>";
					}
						
						//str2+="<c:url var='before' value='campaignList.ptsd'><c:param name='page' value='"+${pi.currentPage-1}+"'></c:param></c:url>";
						//str2+="<c:if test='"+${pi.currentPage <=1 }+"'>[이전]</c:if><c:if test='"+${pi.currentPage>1}+"'><a href='${before }'>[이전]</a></c:if>";
						//str2+="<c:forEach var='p' begin='${pi.startNavi }' end='${pi.endNavi }'><c:url var='pagination' value='campaignList.ptsd'><c:param name='page' value='${p }'></c:param></c:url>";
					    //str2+="<c:if test='"+${p eq pi.currentPage }+"'><font color='green' size='4'>[${p }]</font></c:if><c:if test='"+${p ne pi.currentPage }+"'><a href='${pagination }'>${p }</a></c:if></c:forEach>";
						//str2+="<c:url var='after' value='campaignList.ptsd'><c:param name='page' value='"+${pi.currentPage+1 }+"'></c:param></c:url>";
						//str2+="<c:if test='"+${pi.currentPage>=pi.maxPage }+"'>[다음]</c:if><c:if test='"+${pi.currentPage<pi.maxPage }+"'><a href='${after }'>[다음]</a></c:if>";
					$("#container-1").html(str);
					$("#td-1").html(str2);
					/* console.log(data);
					console.log(data[0].campaignName);
					console.log(data[0].campaignTitle); */
					
					//alert("성공!");
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