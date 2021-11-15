<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴바</title>
<link rel="stylesheet" href="/resources/css/header.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="wrap">
        <div class="header">
            <div class="header_logo">
                <div class="logo_detail">
                    <a href="/main.ptsd"><img style="width: 50%; height: 100%;" src="/resources/img/메인로고.png"></a>
                </div>
            </div>
            <div class="header_sub_title">
                <div class="menu_area">
                    <ul class="navi">
                        <li class="menu1"><a href="#">소개</a></li>
                        <li class="menu2"><a href="#">역대오징어</a></li>
                        <li class="menu3"><a href="campaignList.ptsd">기부</a></li>
                        <li class="menu4"><a href="#">자유게시판</a></li>
                        <li class="menu5"><a href="#">공지/문의</a></li>
		                <c:if test="${ empty loginUser }">
		                <li class="menu6"><a href="/login.ptsd"><img style="width: 50px; margin: 5px;" src="/resources/img/myPageLogo.png" alt="마이페이지"></a></li>
		                </c:if>
                        <c:if test="${ not empty loginUser }">
	                    <li class="menu6"><a href="/mypageUser.ptsd">
	                    
	                    <c:choose>
	                    	<c:when test = "${loginUser.userName eq '관리자' }">
	                    		<img style="width: 50px; margin: 5px;" src="/resources/img/adminProfile.png" alt="관리자페이지"></a></li>	 
	                    	</c:when>
	                    	<c:otherwise>
	                    		<img style="width: 50px; margin: 5px;" src="/resources/img/userProfile.png" alt="마이페이지"></a></li>	 
	                    	
	                    	</c:otherwise>
	                    </c:choose>
	                    	<div class="login-btn" style="margin-left:625px;" >
	                    	
	                    	  <c:choose>
	                    	<c:when test = "${loginUser.userName eq '관리자' }">
	                    	<button onclick="location.href='/mypageUser.ptsd';">관리자페이지</button>
	                    	</c:when>
	                    	<c:otherwise>
		                    <button onclick="location.href='/mypageMyHome.ptsd';">마이페이지</button>
	                    	
	                    	</c:otherwise>
	                    	</c:choose>
							<button onclick="location.href='/logout.ptsd';">로그아웃</button>
							</div>
						</c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body>
</html>