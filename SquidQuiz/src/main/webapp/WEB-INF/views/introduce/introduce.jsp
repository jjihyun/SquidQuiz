<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

</head>
<body>
	<script>
		$(document).ready(function() {
			$('#headerMain').load("/resources/html/header.jsp");
		});
	</script>
	<div id="headerMain"></div>
	<h1 data-aos="flip-down" data-aos-delay="300" data-aos-duration="1000">테스트</h1>
	
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	<script>
		AOS.init();
	</script>
</body>
</html>