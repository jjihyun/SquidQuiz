<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 회원탈퇴</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
<meta name="author" content="AdminKit">
<meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

<link rel="preconnect" href="https://fonts.gstatic.com">

<!-- 사이트 이모티콘 -->
<link rel="shortcut icon" href="/resources/img/photos/초대.png" />

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/resources/css/app.css">
<script type="text/javascript" src="resources/js/address.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="/resources/js/app.js">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap">

</head>
<style>

input{width:300px;height:40px;margin:5px;}
#userId{pointer-events: none;border:none;text-align:center;font-size:20px;font-weight:normal;background: transparent;}
#userPwd:focus{box-shadow: 1px 3px 10px 3px gray;}
#removeUser{width:300px;height:40px;border-radius: 5px;border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;background-color: rgb(247, 105, 136);font-weight: bold;cursor:pointer;}
#removeUser:hover{background-color: rgb(230, 87, 118);}

</style>

<body>
	<header>
		<jsp:include page="../../../resources/html/header.jsp"/>
	</header>
	<br>
		<div class="wrapper">
		<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="index.html">
					<img src="/src/img/icons/icon-48x48.png" alt="">
          <span class="align-middle">MY PAGE</span>
        </a>
				
				<ul class="sidebar-nav">
					
					<li class="sidebar-header" align="center">
						<a href="/mypageUser.ptsd"><img src="/resources/img/userProfile.png" alt="" style="width: 100px;">
						<input type="text" id="my-userId" name="my-userId" value="${loginUser.userId }"  style="text-align:center;font-size:18px;font-weight:bold;width:200px;height:40px;background-color:transparent;border:none;outline:none;pointer-events: none; color:white;"> 
						</a>
					</li>
				
					<li class="sidebar-item">
						<a class="sidebar-link" href="mypageMyHome.ptsd">
              <i class="align-middle" data-feather="user"></i> <span class="align-middle">MY홈</span>
            </a>
					</li>
					<li class="sidebar-item">
						<a class="sidebar-link" href="mypageDetail.ptsd">
              <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">활동내역</span>
            </a>
					</li>
					<li class="sidebar-item">
						<a class="sidebar-link" href="mypagePoint.ptsd">
              <i class="align-middle" data-feather="star"></i> <span class="align-middle">포인트</span>
            </a>
					</li>
					<li class="sidebar-item active">
						<a class="sidebar-link" href="userDelete.ptsd">
              <i class="align-middle" data-feather="user-x"></i> <span class="align-middle">회원탈퇴</span>
            </a>
					</li>
				</ul>
			</div>
		</nav>

		<div class="main">
			<nav class="navbar navbar-expand navbar-light navbar-bg">
				<a class="sidebar-toggle js-sidebar-toggle">
          <i class="hamburger align-self-center"></i>
        </a>
			</nav>

			<main class="content">
			<div class="container-fluid p-0">

			<h1 class="h3 mb-3"><strong>회원탈퇴</strong> </h1>
			<div align="center">
			
        <br><br><br><br><br><br>
        <c:if test="${ not empty loginUser }">
        <form action="userDelete.ptsd" id="removeForm" method="post">
            <div align="center">
            	<div>
                    <input type="text" id="userId" name="userId" value="${loginUser.userId }">
                </div>
                <div>
                    <input type="password" id="userPwd" name="userPwd" placeholder="비밀번호">
                </div>
              
                <div>
                        <input type="submit" id="removeUser"  value="회원탈퇴"><br>
                </div>		  
            </div>
        </form>
        </c:if>
			</div>
			</div>
			</main>
       		<footer>
				<jsp:include page="../../../resources/html/footer.html"/>
			</footer>
			
			</div>
   
	<script src="/resources/js/app.js"></script>
	
	<script>
	$("#removeForm").on("submit",function(){
		if($("#userPwd").val()==""){
			alert("비밀번호를 입력해주세요");
			$("#userPwd").focus();
			return false;
		}
		
		var point = "${loginUser.point }";
		if(confirm(point+"의 포인트가 남아있습니다. 정말 탈퇴하시겠습니까?")){
			alert("탈퇴되었습니다.");
			return true;
		}else{
			alert("취소되었습니다.");
			return false;
			
		}
	});
	
	</script>
	

</body>
</html>