<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<script>
	//헤더
	$(document).ready(function(){
		$('#headerMain').load("/resources/html/header.jsp");
	});
</script>
<body>
    <main>
        <h1  align="center">LOGIN</h1>
        <c:if test="${ empty sessionScope.loginUser }">
        <form action="login.ptsd" method="post">
            <table align="center">
                <tr>
                    <td>아이디 </td>
                    <td><input type="text" id="userId" name="userId"></td>
                </tr>
                <tr>
                    <td>비밀번호 </td>
                    <td><input type="password" id="userPwd" name="userPwd"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <a href="#">ID찾기</a>&nbsp;<a href="#">PW찾기</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="로그인"><br>
                        <button onclick="location.href='/join.ptsd';">회원가입</button>
                    </td>
                </tr>		  
            </table>
        </form>
        </c:if>
        <c:if test="${ not empty loginUser }">
			<table align="center">
				<tr>
					<td><button>마이페이지</button></td>
					<td><button onclick="location.href='/logout.ptsd';">로그아웃</button></td>
				</tr>
			</table>
		</c:if>
    </main>

</body>
</html>