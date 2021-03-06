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
                    <a href="/main.ptsd"><img style="width: 45%; height: 130%;" src="/resources/img/main2.png"></a>
                </div>
            </div>
            <div class="header_sub_title">
                <div class="menu_area">
                    <ul class="navi">
                        <li class="menu1"><a href="introduce.ptsd">소개</a></li>
                        <li class="menu2"><a href="rankListView.ptsd">역대오징어</a></li>
                        <li class="menu3"><a href="campaignList.ptsd">기부</a></li>
                        <li class="menu4"><a href="boardList.ptsd">자유게시판</a></li>
                        <li class="menu5"><a href="qnaListView.ptsd">공지/문의</a></li>
		               <c:if test="${ empty loginUser }">
		                <li class="menu6"><a href="/login.ptsd"><img style="width: 50px; margin: 5px;" src="/resources/img/myPageLogo.png" alt="마이페이지"></a></li>
		                </c:if>
                        <c:if test="${ not empty loginUser }">
	                    <li class="menu6">
	                    
	                    <c:choose>
	                    	<c:when test = "${loginUser.userName eq '관리자' }">
	                    		<img class="side-btn" style="width: 50px; margin: 5px;" src="/resources/img/adminProfile.png" alt="관리자페이지"></li>	 
	                    	</c:when>
	                    	<c:otherwise>
	                    		<a href="/mypageUser.ptsd"><img class="side-btn" style="width: 50px; margin: 5px;" src="/resources/img/userProfile.png" alt="마이페이지"></a></li>	 
	                    	
	                    	</c:otherwise>
	                    </c:choose>
	                    	<div class="login-btn" style="margin-left:625px;" >
	                    	
	                    	  <c:choose>
	                    	<c:when test = "${loginUser.userName eq '관리자' }">
	                    	<button class="main-btn" onclick="location.href='/userListView.ptsd';">관리자페이지</button>
	                    	</c:when>
	                    	<c:otherwise>
		                    <button class="main-btn" onclick="location.href='/mypageMyHome.ptsd';">마이페이지</button>
	                    	</c:otherwise>
	                    	</c:choose>
							<button class="main-btn" onclick="location.href='/logout.ptsd';">로그아웃</button>
							</div>
						</c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
// 		$(function(){
// 			$(".side-btn").hover(function(){
// 				$(this).find(".login-btn").fadeIn();
				
// 			})
// 				,function(){
// 				$(this).find(".login-btn").fadeOut();
// 			}
			
// 		})
	</script>
	
</body>
</html>