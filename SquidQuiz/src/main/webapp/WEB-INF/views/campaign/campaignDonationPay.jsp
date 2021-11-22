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
		height: 850px;
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
		<form action="donateCampaign.ptsd" method="post" onsubmit="return checkJS()">
			<input type="hidden" value="${loginUser.userId }" name="userId">
			<%-- 보유하고 있는 포인트 : ${point } --%>
			<input type="hidden" value="${campaign.campaignNo }" name="campaignNo">
			<input type="hidden" value="${campaign.campaignName }" name="campaignName">
			
			<br><h2 align="center">${campaign.campaignTitle }</h2><br>
			<img src="../../../resources/campaignUpload/${campaign.cFileName }" alt="사진 없음"  align="center"
			 	style="height: 300px; width: 450px;"><br><br>
			<h4>"작은 후원이 큰 힘이 됩니다."</h4><br>
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
				<br><br><br>
				<label><input type="checkbox" id="check" style="zoom:1.2;" > 약관 동의(필수)</label><br>
				<a href="#" id="etc-btn" class="btn btn-primary" data-toggle="modal" data-target="#myModal">약관보기></a><br>			
				<!-- <br><label><input type="checkbox" class="check">약관 동의(선택)</label><br> -->
				<br><br><button id="donate-btn" type="submit">기부하기</button>
			</div>
		</form>
	
	</div>
	<footer style="margin-top:1000px;">
		<jsp:include page="../../../resources/html/footer.html"/>
	</footer>

	<!-- Small modal(모달창) -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	  	<div class="modal-content">
	  	<div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel"></h4>
	    </div>
	    <div class="modal-body">
	    	<h3 align="center"><b>약관확인</b></h3><br>
	    	<b>제 1 조 (목적)</b><br>
			본 이용약관(이하 "약관")은 이용고객(이하 "회원")이 오징어퀴즈 기부 서비스(이하 "오징어퀴즈")를 이용함에 있어 오징어퀴즈과 회원 간의 권리, 의무, 책임 사항과 기타 필요한 사항을 규정함을 목적으로 합니다.
			<br><br><br>
			<b>제 2 조 (정의)</b><br>
			본 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>
			
			1. "오징어퀴즈"이라 함은 오징어퀴즈를 통해 상금을 얻을 수 있고 기부도 할 수 있는 사이트를 말합니다.<br>
			2. "회원"이라 함은 본 약관에 동의하고 서비스를 이용하는 이용자를 말합니다.<br>
			3. "이용계약"이라 함은 본 약관을 포함하여 서비스 이용과 관련하여 오징어퀴즈 회원 간에 체결하는 모든 계약을 말합니다.<br>
			4. "ID(이하 "아이디")"라 함은 회원의 식별 및 서비스 이용을 위하여 회원의 신청에 따라 오징어퀴즈가 회원별로 부여하는 문자와 숫자의 고유한 조합을 말합니다.<br>
			5. "비밀번호"라 함은 아이디로 식별되는 회원의 본인 여부를 검증하기 위하여 회원이 설정하여 등록한 문자(특수문자 포함)와 숫자의 조합을 말합니다.<br>
			6. "탈퇴"라 함은 회원이 이용계약을 해지하는 것을 말합니다.<br>
			7. 본 약관에서 정의하지 않은 용어는 개별서비스에 대한 별도약관 및 이용 규정에서 정의하거나 일반적인 개념에 의합니다.<br>
			<br><br><br>
			<b>제 3 조 (이용약관의 효력 및 변경)</b><br>
			1. 오징어퀴즈는 귀하가 본 약관의 내용에 동의하는 것을 조건으로 서비스를 제공할 것이며, 귀하가 본 약관의 내용에 동의하는 경우 오징어퀴즈의 서비스 제공 행위 및 귀하의 서비스 사용 행위는 본 약관이 우선하여 적용됩니다.<br>
			2. 오징어퀴즈는 관련 법령에 위배되지 않는 범위 안에서 본 약관을 개정할 수 있습니다. 개정된 약관은 정당한 절차에 따라 오징어퀴즈를 통해 공지됨으로써 효력이 발휘됩니다. 회원은 정기적으로 오징어퀴즈를 방문하여 약관의 변경사항을 확인하여야 합니다. 변경된 약관에 대한 정보를 알지 못해 발생하는 회원의 피해는 오징어퀴즈에서 책임지지 않습니다.<br>
			3. 회원은 변경된 약관에 동의하지 않을 경우 회원 탈퇴(해지)를 요청할 수 있습니다.<br>
			<br><br><br>
			<b>제 4 조 (약관 외 준칙)</b><br>
			1. 오징어퀴즈는 필요한 경우 서비스 내의 개별항목에 대하여 개별약관 또는 운영원칙(이하 "서비스별 안내")을 정할 수 있습니다.<br>
			2. 본 약관에 명시되지 않은 사항은 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전기통신기본법, 전기통신사업법, 정보통신윤리위원회 심의규정, 정보통신 윤리강령, 프로그램보호법 등 관계 법령과 개인정보 처리방침 및 행정안전부가 별도로 정한 지침 등의 규정에 따릅니다.<br>
	    </div>
	    <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
	    </div>
	  </div>
	  </div>
	</div>
	
	
	<script type="text/javascript">
	
 		function checkJS() {
			if ($("input:checkbox[id='check']").is(":checked")==false) {
				alert("약관동의에 체크해주세요.");
				return false;
			} else if($("#pointValue").val()==0){
				alert("기부금이 0원입니다. 금액을 선택해주세요.");
				return false;
			} else{
				return true;
			}
		}

		function money(a) {
			document.getElementById("pointValue").value = a;
		}

		/*$('#myModal').on('shown.bs.modal', function() {
			$('#myInput').focus()
		});*/
	</script>
</body>
</html>