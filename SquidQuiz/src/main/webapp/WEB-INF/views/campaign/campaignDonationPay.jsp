<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠페인 기부 결제페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<style>
	#first{
		position: absolute; 
		left: 50%; 
		transform: translateX(-50%);
		border: 1px solid gray;
		text-align: center;
		height: 700px;
		width: 1000px;
	}
		#pointValue{
			border:none;
			text-align: right;
			font-size:23px;
		}
		#etc-btn{
			border:none;
			background-color: gray;
		}
		#donate-btn{
			border: none;
			background-color:rgb(201, 113, 113);
			color:white;
			width: 200px;
			height: 50px;
			font-size: 21px;
			font-weight: bold;
		}

</style>
<body>
	<jsp:include page="../../../resources/html/header.jsp"/><br><hr><br><br>
	<div id="first">
		<form action="donateCampaign.ptsd" method="post">
			<input type="hidden" value="${loginUser.userId }" name="userId">
			<%-- 보유하고 있는 포인트 : ${point } --%>
			<input type="hidden" value="${campaign.campaignNo }" name="campaignNo">
			<input type="hidden" value="${campaign.campaignName }" name="campaignName">
			
			<h1 align="center">${campaign.campaignTitle }</h1>
			<h4>${campaign.campaignTitle }</h4>
			<img src="../../../resources/campaignUpload/${campaign.cFileName }" alt="사진 없음"  align="center"
			 	style="height: 300px; width: 450px;">
			<h3>"투명한 운영으로 보답하겠습니다."</h3>
			<div>
				결제 포인트 : <input type="text" name="cRecordPoint" id="pointValue" value="0" size="5px;" readonly>&nbsp;&nbsp;&nbsp;POINT<br>
				<pre>*충전해두신 POINT에서 차감됩니다.</pre>
				<div class="btn-group" role="group" aria-label="...">
					<button type="button" class="btn btn-default" onclick="money(10000)">1만원</button>
					<button type="button" class="btn btn-default" onclick="money(20000)">2만원</button>
					<button type="button" class="btn btn-default" onclick="money(30000)">3만원</button>
					<button type="button" class="btn btn-default" onclick="money(50000)">5만원</button>
					<button type="button" class="btn btn-default" onclick="money(100000)">10만원</button>
				</div>
				<br><br>
				<label><input type="checkbox" class="check"> 약관 동의(필수)</label><br>
				<a href="#" id="etc-btn" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">약관보기></a><br>			
				<!-- <br><label><input type="checkbox" class="check">약관 동의(선택)</label><br> -->
				<br><br><button id="donate-btn" type="submit">기부하기</button>
			</div>
		</form>
	
	</div>
	<div style=" width: 100%; height: 200px;  border: 1px solid blue; margin-top: 800px;"> 
		(footer 자리)
	</div>

	<!-- Small modal(모달창) -->
	<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-sm">
	  	<div class="modal-content">
	  	<div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">약관확인</h4>
	    </div>
	    <div class="modal-body">
	      ...
	    </div>
	    <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
	    </div>
	  </div>
	  </div>
	</div>
	
	
	<script type="text/javascript">
		
		function money(a){
			console.log(a);
			//$("#pointValue").value="a";
			document.getElementById("pointValue").value=a;
		}
		
		$('#myModal').on('shown.bs.modal', function () {
			  $('#myInput').focus()
		});
		
	</script>
</body>
</html>