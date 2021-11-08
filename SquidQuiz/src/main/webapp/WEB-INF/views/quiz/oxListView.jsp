<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/resources/css/quiz/oxWrite.css">
</head>
<script>
	//자바스크립트로 헤더 파일 받아오는 소스 
	$(document).ready(function(){
		$('#headerMain').load("/resources/html/header.jsp");
	});
	
</script>
<body>
	<div id="headerMain"></div>
		<hr>
		<div class="oxArea">
			<div class="sideBar"style="width:20%; height: 100%; background-color: black; float:left;">
			</div>
			<div class="oxTitle">
				<h1 align="center">OX퀴즈</h1>
			</div>
			<div class="writeArea">
			<form action="oxRegitser.ptsd" method="post" enctype="multipart/form-data">
				<table class="writeForm" aling="center">
					<tr>
						<th>제목</th>
						<td><input type="text" size="50" name="oxTitle"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><input type="text" size="50" name="oxContents"></td>
					</tr>
					<tr>
						<th>해설</th>
						<td><textarea rows="7" cols="50" name="oxCommentary"></textarea></td>
					</tr>
					<tr>
						<td colspan="3" width="150px" class="imgtd">
							<div class="img_area">
								<input id="oxFile" name="uploadFile" type="file" style="display:none"onchange="readURL(this,'oxImg')">
								<img class="preview" id="oxImg" src="/resources/img/poto.png" onclick="javascript:$('#oxFile').click();">
							</div>
							<center><b>OX 이미지</b></center>
						</td>
<!-- 						<td><input type="file" size="50" name="uploadFile"></td> -->
					</tr>
					<tr>
						<th>정답</th>
						<td colspan="2">
							<input type="radio" name="oxAnswer" value="O">O
							<input type="radio" name="oxAnswer" value="x">X
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="등록">
							<input type="reset" value="취소">
						</td>
					</tr>
				</table>
			</form>
			</div>
		</div>
</body>
</html>