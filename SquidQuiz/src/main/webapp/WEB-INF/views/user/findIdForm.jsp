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

	 .links{
        text-align: center;
    }

    a{ 
    	text-decoration: none; 
    }
   
    .myLogo{display : block ; margin : 0 auto ;}
    
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
            <table align="center">
             <p class="text2"> ${findid2}</p>
                <tr>
                    <td>이름 </td>
                    <td><input type="text" name="userName" id="userName" class="form-control" placeholder="이름을 입력 해주세요" required autofocus></td>
                </tr>
                <tr>
                    <td>이메일 </td>
                    <td><input type="email" name="userEmail" id="userEmail" class="form-control" placeholder="가입시 입력한  이메일" required></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                    <p class="check" id="check">${check}</p><br/>
                        <a href="/findPwd.ptsd">PW찾기</a> | <a href="/login.ptsd">로그인</a> | <a href="/join.ptsd">회원가입</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <button type="button" id="check" onclick="location.href='/findId.ptsd';">아이디 찾기</button>
                    </td>
                </tr>		  
            </table>
        </form>
        </c:if>
  <script type="text/javascript">
		
  		
  
  		$("#userName").focusout(function(){
  			
	     if($('#userName').val() == ""){
	   		$('#check').text('이름을 입력해주세요.');
	   	  	$('#check').css('color', 'red');
	   
	     }else{
	    	 $('#check').hide();
	     }
	     });
	     
  		$("#userEmail").focusout(function(){
	     if($('#userEmail').val() == ""){
	   		$('#check').text('이메일을 입력해주세요');
	   	  	$('#check').css('color', 'red');
	     }else{
	    	 $('#check').hide();
	     }
	     });
  
  </script>
  </body>
</html>