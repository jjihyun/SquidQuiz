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
<link rel="stylesheet" href="/resources/css/app.css">
<link rel="stylesheet" href="/resources/js/app.js">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap">
</head>
<body>
	<header>
		<jsp:include page="../../../resources/html/header.jsp"/>
	</header>
		<div class="wrapper">
		<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="index.html">
					<img src="/src/img/icons/icon-48x48.png" alt="">
          <span class="align-middle">MY PAGE</span>
        </a>

				<ul class="sidebar-nav">
					<li class="sidebar-header">
						<img src="/resources/img/userProfile.png" alt="" style="width: 100px; margin-left: 50px;">
						<input type="text" id="my-userId" name="my-userId" style="margin-left: 10px;"> 
						
					</li>

					<li class="sidebar-item active">
						<a class="sidebar-link" href="index.html">
              <i class="align-middle" data-feather="user"></i> <span class="align-middle">MY홈</span>
            </a>
					</li>
					<li class="sidebar-item">
						<a class="sidebar-link" href="pages-profile.html">
              <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">활동내역</span>
            </a>
					</li>
					<li class="sidebar-item">
						<a class="sidebar-link" href="pages-profile.html">
              <i class="align-middle" data-feather="star"></i> <span class="align-middle">포인트</span>
            </a>
					</li>
					<li class="sidebar-item">
						<a class="sidebar-link" href="pages-profile.html">
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
			<form action="memberModify.ptsd" method="post">
			<table width="650" cellspacing="5">
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="userId" value="${loginUser.userId }" readonly>
					</td>
				</tr>
				<tr>
					<td>기존 비밀번호</td>
					<td>
						<input type="password" name="userPwd" value="">
					</td>
				</tr>
				<tr>
					<td>새 비밀번호</td>
					<td>
						<input type="password" name="userPwd" value="">
					</td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td>
						<input type="password" name="userPwd" value="">
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" name="userName" value="" readonly>
					</td>
				</tr>				
				<tr>
					<td>이메일</td>
					<td>
						<input type="text" name="userEmail" value="">
					</td>
				</tr>	
				<tr>
					<td>전화번호</td>
					<td>
						<input type="text" name="userPhone" value="">
					</td>
				</tr>
				<c:forTokens items="${loginUser.userAddr }" delims="," var="addr" varStatus="status">
					<c:if test="${status.index eq 0 }">
						<tr>
							<td>우편번호</td>
							<td>
								<input type="text" name="post" 
										class="postcodify_postcode5" size="6" value=${addr }>
								<button type="button" id="postcodify_search_button">검색</button>
							</td>
						</tr>
					</c:if>
					<c:if test="">
						<tr>
							<td>도로명 주소</td>
							<td>
								<input type="text" name="address1" 
								class="postcodify_address" value="${addr }">
							</td>
						</tr>
					</c:if>
					<c:if test="">
						<tr>
							<td>상세 주소</td>
							<td>
								<input type="text" name="address2" 
								class="postcodify_extra_info" value="${addr }">
							</td>
						</tr>
					</c:if>
				</c:forTokens>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="수정하기">
					</td>
				</tr>						
			</table>
		</form>
					
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


</body>
</html>