<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>역대 오징어 랭킹</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#headerMain').load("/resources/html/header.jsp");
});
</script>
<style>
	main{
		width: 100%;
		height: 1080px;
	}
	.rank_first{
		width: 100%;
		position: absolute;
		height: 100%;
		left:50%;
		transform: translateX(-50%);
		background-color: pink;
	}
	.rank_view_1{
		width:1000px;
		height: 100%;
		background: #fff;
		position:absolute;
		left:50%;
		transform: translateX(-50%);
	}
	.rank_view_2{
		width: 650px;
		height: 200px;
		background: pink;
		margin-left: 180px;
	}
	.rank_view_3{
	}
</style>
</head>
<body>
<div id="headerMain"></div>
<br>
	<main>
		<div class="rank_first">
			<div class="rank_view_1">
			<br><br><br><br><br><br>
				<center><h1 style="font-weight: bold;">역대오징어</h1></center>
				<div class="rank_view_2">
					<div class="text_area" style="position: absolute; margin-top: 50px; width: 200px; height: auto; background: #fff;">
						<h2 style="float: left">?</h2>
						<h2 style="float: left; color: #ff4570;">회</h2>
						<h2 style="float: left;">차</h2>
						<h2 style="float: left; color: #ff4570;">오</h2>
						<h2 style="float: left;">징</h2>
						<h2 style="color: #ff4570;">어</h2>
					</div>
					<div class="text_area2" style="position: absolute; margin-top: 20px; margin-left:230px; width: 180px; height: auto; background: #fff;">
						<img alt="오징어왕관" src="/resources/img/squidking.png" style="width: 100px; height: 80px; margin-left: 40px;">
						<center><h2 style="background-color: #e2e2e2;">user01</h2></center>
					</div>
				</div>
				<br><br><br><br><br>
				<div class="rank_view_3">
					<hr>
					
				</div>
			</div>
		</div>
	</main>
</body>
</html>