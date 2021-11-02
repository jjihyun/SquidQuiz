<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<script>
	//헤더
	$(document).ready(function(){
		$('#headerMain').load("/resources/html/header.jsp");
	});
</script>
<body>
<jsp:include page="../user/userJoin.jsp"></jsp:include>
	<main>
        <header>
            <h1>회원가입</h1>
        </header>
        <form action="join.ptsd" method="post">
            <table style="margin: auto;">
                <tr>
                    <td>아이디</td>
                    <td>
                        <input type="text" id="userId" name="userId" placeholder="아이디입력(5~11자)">
                        <input type="button" id="id-check" onclick="openIdChk();" value="중복확인"><br>
                    </td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td>
                        <input type="password" id="userPwd" name="userPwd" placeholder="비밀번호(숫자,영문,특수문자(!,@,#,%,&) 조합) 최소8자">
                    </td>
                </tr>
                <tr>
                    <td>비밀번호 확인</td>
                    <td>
                        <input type="password"  id="userRePwd" name="userRePwd" placeholder="비밀번호 확인">
                    </td>
                </tr>
                <tr>
                    <td>이름</td>
                    <td><input type="text" id="userName" name="userName"></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td><input type="email" id="userEmail" name="userEmail"></td>
                </tr>
                <tr>
                    <td>전화번호</td>
                    <td><input type="text" id="userPhone" name="userPhone"></td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td><input type="text" id="userAddr" name="userAddr"></td>
                </tr>
                <tr>
                    <td>은행명</td>
                    <td><input type="text" id="bankName" name="bankName"></td>
                </tr>
                <tr>
                    <td>계좌번호</td>
                    <td><input type="number" id="bankAccount" name="bankAccount"><br><br></td>
                </tr>
                
                <tr>
					<td colspan="2" align="center">
						<input type="submit" value="회원가입"><br>
                        <a href="#"><input type="reset" value="돌아가기"></a>
					</td>
				</tr>	
            </table>
        </form>
    </main>
</body>
</html>