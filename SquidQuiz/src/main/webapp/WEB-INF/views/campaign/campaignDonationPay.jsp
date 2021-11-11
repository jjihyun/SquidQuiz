<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠페인 기부 결제페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<style>
	#first{
		position: absolute; 
		left: 50%; 
		transform: translateX(-50%);
		border: 1px solid gray;
		text-align: center;	
	}

</style>
<body>
	<jsp:include page="../../../resources/html/header.jsp"/><br><hr>
	<div id="first">
		<h1 align="center">(후원 제목)</h1>
		<h4>(단체명)</h4>
		<img src="" alt="사진 없음"  align="center">
		<p>"투명한 운영으로 보답하겠습니다."</p>
		<div>
			결제 포인트 <input type="text"> POINT<br>
			<pre>*충전해두신 POINT에서 차감됩니다.</pre>
			<select name="">
				<option>1만원</option>
				<option>2만원</option>
				<option>3만원</option>
				<option>5만원</option>
				<option>10만원</option>
			</select><br>
			<label style="border: 1px solid black;"><input type="checkbox" class="check">약관 동의(필수)</label>
			&nbsp;&nbsp;&nbsp;<a href="#" style="float:right;">약관보기></a>
			<br><label><input type="checkbox" class="check">약관 동의(선택)</label><br>
			<button>기부하기</button>
		</div>
	
	</div>
<!-- 	<!-- Small modal -->
<!-- 
	<div id="test" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="false">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	      ...
	    </div>
	  </div>
	</div> -->
	
	<script type="text/javascript">
/*  		$('#myModal').click(function(e){
			e.preventDefault();
			$("#test").modal("show");
		}); */
	</script>
</body>
</html>