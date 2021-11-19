<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    
    <title>아이디 찾기</title>
    <style>
	.input-box{ position:relative; margin:10px 700px; }
	.input-box > input{ background:transparent; border:none; border-bottom: solid 1px #ccc; padding:20px 0px 5px 0px; font-size:14pt; width:100%; }
	input::placeholder{ color:transparent; }
	input:placeholder-shown + label{ color:#aaa; font-size:14pt; top:15px; }
	input:focus + label, label{ color:#8aa1a1; font-size:10pt; pointer-events: none; position: absolute; left:0px; top:0px; transition: all 0.2s ease ; -webkit-transition: all 0.2s ease; -moz-transition: all 0.2s ease; -o-transition: all 0.2s ease; }
	input:focus, input:not(:placeholder-shown){ border-bottom: solid 1px #8aa1a1; outline:none; }
	

    a{ 
    	text-decoration: none; color:#aaa;
    }
   
    .myLogo{display : block ; margin : 0 auto ;}
    
    #sid-btn{margin:10px;width:500px;height:40px;border-radius: 5px;border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;background-color: rgb(247, 105, 136);font-weight: bold;cursor:pointer;color:white;}
    #sid-btn:hover{background-color: rgb(230, 87, 118);}
    
    </style>
  </head>
  <body>
	<header>
		<jsp:include page="../../../resources/html/header.jsp"/>
	</header>
	<br><hr><br><br><br><br>
        <h1 align="center">ID찾기</h1>
        <img align="center" class="myLogo" src="resources/img/myPageLogo.png" />
        <c:if test="${ empty sessionScope.loginUser }">
        <form action="findId.ptsd" class="form-signin"  method="post">
            <div align="center">
                <div class="input-box">
                    <input type="text" name="userName" id="userName" class="form-control" placeholder="이름을 입력 해주세요" >
                    <label for="userName">이름 </label>
                </div>
                <div class="input-box">
                    <input type="email" name="userEmail" id="userEmail" class="form-control" placeholder="가입시 입력한  이메일" >
                    <label for="userEmail">이메일 </label>
                </div>
                <p id="id-value"><br>
                <div>
                    <div align="center">
                        <a href="/findPwdView.ptsd">PW찾기</a> | <a href="/login.ptsd">로그인</a> | <a href="/join.ptsd">회원가입</a>
                    </div>
                </div>
                <div>
                        <input type="submit" id="sid-btn" value="아이디 찾기">
                    </div>
                </div>		  
            </div>
        </form>
        </c:if>
  <script type="text/javascript">

//   		$("#check").on("click",function(){
  			
// 	     if($('#userName').val() == ""){
// 	   		$('#check').text('이름을 입력해주세요.');
// 	   	  	$('#check').css('color', 'red');
	   
// 	     }else{
// 	    	 $('#check').hide();
// 	     }
// 	     });
	     
//   		s
  		
  		
//   		$(document).on('click','#check',function(){
//   			var name =$('#userName').val();
//   			var email =$('#userEmail').val();
  			
//   			var postData = {'userName' : name, 'userEmail' : email};
  			
//   			$.ajax({
//   				url : '/findId.ptsd',
//   				data : postData,
//   				dataType : "JSON",
  				
//   				success : function(data){
//   					if(data == 0){
//   						$('#id-value').text("회원정보를 확인 해주세요");
  						
//   					}else{
//   				       alert("아이디찾기 실패");
//                     }
//                  },
//                  error : function(){
//                     alert("AJAX 통신 오류! 관리자에게 문의하세요")
//                  },
  					
//                  complete : function(){
//                  }
  
  </script>
  </body>
</html>