<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 회원정보</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
<meta name="author" content="AdminKit">
<meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

<link rel="preconnect" href="https://fonts.gstatic.com">

<!-- 사이트 이모티콘 -->
<link rel="shortcut icon" href="/resources/img/photos/초대.png" />

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/resources/css/join.css">
<link rel="stylesheet" href="/resources/css/app.css">
<script type="text/javascript" src="resources/js/address.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="/resources/js/app.js">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap">

</head>
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
					<li class="sidebar-item">
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

			<h1 class="h3 mb-3"><strong>회원정보 수정</strong> </h1>
			<div align="center">
		    <form action="memberModify.ptsd" id="checkAll" method="post">
		            <div class="form-group">
		            <label for="userId">아이디</label><br>
		                    <input type="text" id="userId" name="userId" value="${loginUser.userId }" readonly>
		                    <div class="id-regex"></div>
		               </div>
		            <div class="form-group">
		            <label for="userPwd">비밀번호</label><br>
		                    <input type="password" id="userPwd" name="userPwd" placeholder="기존/새로운 비밀번호 입력"><br>
		            </div>
		            <div class="form-group">
		            <label for="userRePwd">비밀번호 확인</label><br>
		                    <input type="password"  id="userRePwd" name="userRePwd" placeholder="비밀번호 확인"><br>
		                    <div class="repw-regex"></div>
		            </div>
		            <div class="form-group">
		            <label for="userName">이름</label><br>
		                <input type="text" id="userName" name="userName" value="${loginUser.userName }" readonly><br>
		                 <div class="name-regex"></div>
		            </div>
		            <div class="form-group">
		            <label for="userEmail">이메일</label><br>
		                <input type="email" id="userEmail" name="userEmail" value="${loginUser.userEmail }"><br>
		                <div class="email-regex"></div>
		            </div>
		            <div class="form-group">
		            <label for="userPhone">전화번호</label><br>
		                <input type="text" id="userPhone" name="userPhone" value="${loginUser.userPhone }"><br>
		                <div class="phone-regex"></div>
		            </div>
		            <c:forTokens items="${loginUser.userAddr }" delims="," var="addr" varStatus="status">
					<c:if test="${status.index eq 0 }">
		            <div class="form-postgroup">
		            <label for="post">우편번호</label><br>
		                <input type="text" id="post" name="post" class="postcodify_postcode5" value="${addr }" readonly>
		                <button type="button" id="postcodify_search_button" onclick="execPostCode();">검색</button>
		            </div><br>
			</c:if>
			<c:if test="${status.index eq 1 }">
		            <div class="form-group">
		            <label for="address1">도로명</label><br>
		                <input type="text" name="address1" class="postcodify_address" value="${addr }" readonly>
		            </div>
			</c:if>
			<c:if test="${status.index eq 2 }">
		            <div class="form-group">
		            <label for="address2">상세 주소</label><br>
		                <input type="text" name="address2" class="postcodify_extra_info"value="${addr }">
		            </div>
			</c:if>
			</c:forTokens>
		            <div class="form-group">
		            <label for="bankName">은행명</label><br>
		                <input type="text" id="bankName" name="bankName" value="${loginUser.bankName }">
		            </div>
		            <div class="form-group">
		            <label for="bankAccount">계좌번호</label><br>
		                <input type="text" id="bankAccount" name="bankAccountValue" value="${loginUser.bankAccount }">
		            </div><br>
		            <div class="form-btn" align="center">
		                    <input type="submit" id="signupbtn" name="signup" value="수정하기"><br>
		                  
		            </div>	
		    	</form>
    			</div>
					
			</main>

			<footer class="footer">
				<div class="container-fluid">
					<div class="row text-muted">
						<div class="col-6 text-start">
							<p class="mb-0">
								<a class="text-muted" href="https://adminkit.io/" target="_blank"><strong>AdminKit</strong></a> &copy;
							</p>
						</div>
						<div class="col-6 text-end">
							<ul class="list-inline">
								<li class="list-inline-item">
									<a class="text-muted" href="https://adminkit.io/" target="_blank">Support</a>
								</li>
								<li class="list-inline-item">
									<a class="text-muted" href="https://adminkit.io/" target="_blank">Help Center</a>
								</li>
								<li class="list-inline-item">
									<a class="text-muted" href="https://adminkit.io/" target="_blank">Privacy</a>
								</li>
								<li class="list-inline-item">
									<a class="text-muted" href="https://adminkit.io/" target="_blank">Terms</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>

	<script src="/resources/js/app.js"></script>
	 <script type="text/javascript">
    
    
    $(function(){
    	
    	
	//비밀번호 유효성검사
        $("#userPwd").on("input",function(){
            var regex = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$!@#%&\\(\\)\-_=+]).{8,16}$/;
            var result = regex.exec($("#userPwd").val())
            
            if(result != null){
                $(".pw-regex").html("");
            }else{
                $(".pw-regex").html("비밀번호(숫자,영문,특수문자(!,@,#,%,&) 조합) 최소8자");
                $(".pw-regex").css("color","red")
            }
        });
        
       //비밀번호 확인    
           $("#userRePwd").on("keyup",function(){
                if($("#userPwd").val()==$("#userRePwd").val()){
                   $(".repw-regex").html("비밀번호가 일치합니다");
                   $(".repw-regex").css("color","green")
                }else{
                 $(".repw-regex").html("비밀번호가 일치하지않습니다"); 
                 $(".repw-regex").css("color","red")
                }
           })
        
     
        //email유효성 검사
            $("#userEmail").on("input",function(){
                 var regex = /.+@[a-z]+(\.[a-z]+){1,2}$/;
                 var result = regex.exec($("#userEmail").val());
                
                if(result != null){
                   $(".email-regex").html("");  
                }else{
                    $(".email-regex").html("올바른 이메일이 아닙니다");
                    $(".email-regex").css("color","red")
                }
            })
            
                //연락처 유효성검사
            $("#userPhone").on("input",function(){
                 var regex = /^01\d\d{3,4}\d{4}$/;
                 var result = regex.exec($("#userPhone").val());
                
                if(result != null){
                   $(".phone-regex").html("");  
                }else{
                    $(".phone-regex").html("올바른 번호가 아닙니다");
                    $(".phone-regex").css("color","red")
                }
                
            })
            
      //회원가입 버튼 눌렀을 때, 빈칸 있으면 다시 유효성 검사진행    
       $("#signupbtn").on("click",function(){
    	   var pw = $("#userPwd").val();
    	   var email = $("#userEmail").val();
    	   var phone = $("#userPhone").val();
    	   
    	   
    	   var pwregex = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$!@#%&\\(\\)\-_=+]).{8,16}$/;
    	   var emailregex = /.+@[a-z]+(\.[a-z]+){1,2}$/;
    	   var phoneregex = /^01\d\d{3,4}\d{4}$/;
    	   
    	   
    	   var pwregex = pwregex.exec(pw);
    	   if(pwregex == null){
    		   alert("비밀번호양식을 다시 확인해주세요");
    		   retrun;
    	   }
    	
    	   var emailregex = emailregex.exec(email);
    	   if(emailregex == null){
    		   alert("이메일양식을 다시 확인해주세요");
    		   retrun;
    	   }
    	   var phoneregex = phoneregex.exec(phone);
    	   if(phoneregex == null){
    		   alert("연락처양식을 다시 확인해주세요");
    		   retrun;
    	   }
    	
    	   
         //빈칸 없을 때 제출.
    	   $("#checkAll").submit();
        
    	   
       })
    })
       
    
    
    
   	 
    </script>

</body>
</html>