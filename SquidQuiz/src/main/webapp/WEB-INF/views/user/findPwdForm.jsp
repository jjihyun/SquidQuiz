<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
    <title>비밀번호 찾기</title>
  </head>
    <style>

	

    a{ 
    	text-decoration: none; 
    }
   
    .myLogo{display : block ; margin : 0 auto ;}
    
    </style>
  <body>
	<header>
		<jsp:include page="../../../resources/html/header.jsp"/>
	</header>
	<br><hr><br><br><br><br>
        <h1 align="center">PW찾기</h1>
        <img align="center" class="myLogo" src="resources/img/myPageLogo.png" />
        <c:if test="${ empty sessionScope.loginUser }">
        <form action="findPwd.ptsd" class="form-signin"  method="post">
            <table align="center">
                <tr>
                    <td>아이디 </td>
                    <td><input type="text" name="userId" id="userId" class="form-control" placeholder="ID를 입력 해주세요" required autofocus></td>
                </tr>
                <tr>
                    <td>이메일 </td>
                    <td><input type="email" name="userEmail" id="userEmail" class="form-control" placeholder="가입시 입력한  이메일" required></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <a href="/findIdView.ptsd">ID찾기</a> | <a href="/login.ptsd">로그인</a> | <a href="/join.ptsd">회원가입</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="이메일 전송">
                    </td>
                </tr>		  
            </table>
        </form>
        </c:if>

  </body>
</html>