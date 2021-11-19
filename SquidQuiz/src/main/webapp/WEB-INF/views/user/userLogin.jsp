<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/login.css">
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<body>
	<header>
		<jsp:include page="../../../resources/html/header.jsp"/>
	</header>
	<br><hr><br><br><br><br>
    <main>
        <h1 align="center">LOGIN</h1>
        <img align="center" class="myLogo" src="resources/img/myPageLogo.png" />
        <c:if test="${ empty sessionScope.loginUser }">
        <form action="login.ptsd" method="post">
            <div align="center">
                <div class="input-box">
                    <input type="text" id="userId" name="userId" placeholder="아이디">
                    <label for="userId">아이디 </label>
                </div>
                <div class="input-box">
                    <input type="password" id="userPwd" name="userPwd"placeholder="비밀번호">
                    <label for="userPwd">비밀번호 </label>
                </div>
                <div class="link" align="center">
                        <a href="/findIdView.ptsd">ID찾기</a>&nbsp;<a href="/findPwdView.ptsd">PW찾기</a>
                </div>
                <div>
                        <input class="log-btn" type="submit" value="로그인"><br>
                        <button class="join-btn" type="button" onclick="location.href='/join.ptsd';">회원가입</button>
                </div>		  
            </div>
        </form>
        </c:if>
        <c:if test="${ not empty loginUser }">
        	<c:url></c:url>
		</c:if>
    </main>
</body>
</html>