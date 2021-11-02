<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PTSD Main Page</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/resources/css/main.css">
</head>

<script>
	//자바스크립트로 헤더 파일 받아오는 소스 
	$(document).ready(function(){
		$('#headerMain').load("/resources/html/header.jsp");
	});
</script>
<body>
<div id="headerMain"></div>
	 <div class="content">
		 <div class="row" style="background-color:; margin: 30px 0px 50px 0px;">
	        <div class="video_con">
	<!--         음속어 muted="muted" -->
	            <video id="vid" muted="muted" autoplay controls loop style="pointer-events: none;">
	                <source src="/resources/video/오징어게임.mp4" type="video/mp4">
	            </video>
				<script>
					document.getElementById('vid').play(); //동영상 자동재생 하기 위한 스크립트 언어
				</script>
	        </div>
	        <div class="btn-con">
	        	<button class="Game-btn" style="color: black;">○   △   □ </button>
	        </div>
	      </div>
    </div>
</body>
</html>