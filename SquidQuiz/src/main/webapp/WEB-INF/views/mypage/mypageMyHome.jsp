<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
	<meta name="author" content="AdminKit">
	<meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

	<link rel="preconnect" href="https://fonts.gstatic.com">

	<!-- 사이트 이모티콘 -->
	<link rel="shortcut icon" href="/resources/img/photos/초대.png" />
<title>마이페이지 메인</title>
<link rel="stylesheet" href="/resources/css/app.css">
<link rel="stylesheet" href="/resources/js/app.js">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<style>

.box1{ width:1100px; margin: 0; padding:0;}
.card{width:500px;float:left;margin-left:10px;margin-right:10px;}
.card-body{text-align:left;}
.point1,.point2{pointer-events: none;}

#userPoint,#userGibu{font-size:20px;border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;}

</style>
<body>
	<header>
		<jsp:include page="../../../resources/html/header.jsp" />
	</header>
	<br>
	<div class="wrapper">
		<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="index.html"> <img
					src="/src/img/icons/icon-48x48.png" alt=""> <span
					class="align-middle">MY PAGE</span>
				</a>
				
				<ul class="sidebar-nav">

					<li class="sidebar-header" align="center"><a
						href="/mypageUser.ptsd"><img
							src="/resources/img/userProfile.png" alt="" style="width: 100px;">
							<input type="text" id="my-userId" name="my-userId"
							value="${loginUser.userId }"
							style="text-align: center; font-size: 18px; font-weight: bold; width: 200px; height: 40px; background-color: transparent; border: none; outline: none; pointer-events: none; color: white;">
					</a></li>

					<li class="sidebar-item active"><a class="sidebar-link"
						href="mypageMyHome.ptsd"> <i class="align-middle"
							data-feather="user"></i> <span class="align-middle">MY홈</span>
					</a></li>
					<li class="sidebar-item"><a class="sidebar-link"
						href="mypageDetail.ptsd"> <i class="align-middle"
							data-feather="sliders"></i> <span class="align-middle">활동내역</span>
					</a></li>
					<li class="sidebar-item"><a class="sidebar-link"
						href="mypagePoint.ptsd"> <i class="align-middle"
							data-feather="star"></i> <span class="align-middle">포인트</span>
					</a></li>
					
					<li class="sidebar-item"><a class="sidebar-link"
						href="userDelete.ptsd"> <i class="align-middle"
							data-feather="user-x"></i> <span class="align-middle">회원탈퇴</span>
					</a></li>
				</ul>
				
			</div>
		</nav>

		<div class="main">
			<nav class="navbar navbar-expand navbar-light navbar-bg">
				<a class="sidebar-toggle js-sidebar-toggle"> <i
					class="hamburger align-self-center"></i>
				</a>
			</nav>

			<main class="content">

				<h1 class="h3 mb-3"><strong>MY홈</strong></h1>
				
				<form action="pointAll" id="pointAll" method="post">
					<div align="center" class="box">
						<div class="box1">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col mt-0">
											<h5 class="card-title">보유 포인트</h5>
										</div>

										<div class="col-auto">
											<div class="stat text-primary">
												<i class="align-middle" data-feather="star"></i>
											</div>
										</div>
									</div>
									<h1 class="point1"><input type="text" id="userPoint" name="Point" value="${userPoint }P"></h1>
									<div class="point-btn">
										<button id="check_module" class="btn btn-primary"  onclick = "location.href = '/chargePoint.ptsd' " type="button">충전하기</button>
									</div>
								</div>
							</div>
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col mt-0">
											<h5 class="card-title">총 기부금</h5>
										</div>

										<div class="col-auto">
											<div class="stat text-primary">
												<i class="align-middle" data-feather="users"></i>
											</div>
										</div>
									</div>
									
<%-- 									<c:set var="pointValue" value="${pPoint}"/> --%>
<%-- 									<c:out value="${pPoint }" default="0"/> --%>
									<h1 class="point2">
										<c:if test="${not empty pPoint }">
											<input type="text" id="userGibu" name="Point2" value="${pPoint}원">
										</c:if>
									</h1>
									
									<div class="camp-btn">
										<button type="button" class="btn btn-primary" onclick = "location.href = '/campaignList.ptsd' ">기부하기</button>
										<button type="button" class="btn btn-primary" onclick = "location.href = '/mypageDetail.ptsd' ">기부내역</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					</form>
					<br><br><br><br><br><br><br><br><br><br>
					<hr>
					<br> <br>
					<!-- 게시판 -->
					
					<div align="center">
						<div class="board">
							<div id="card-flex" class="board flex-fill">
									<h5>내가 쓴 게시물</h5>
								<br><br>
								<table class="table table-hover my-0">
									<thead align="center">
										<tr>
											<th>게시글 번호</th>
											<th>제목</th>
											<th>날짜</th>
										</tr>
									</thead>
									<c:if test="${empty bList }">
											<tbody align="center">
												<tr align="center">
													<td colspan="9"><span>작성된 게시글이 없습니다.</span></td>
												</tr>
											</tbody>
										</c:if>
									<c:forEach items="${bList }" var="bList">
									<tbody>
										<tr align="center">
											<td align="center">${bList.bNo }</td>
											<td align="center">
												<c:url var="boardDetail" value="boardDetail.ptsd">
													<c:param name="bNo" value="${bList.bNo }"/>
												</c:url>
												<a href="${boardDetail }">${bList.bTitle }</a>
											</td>
											<td align="center">${bList.bCreateDate }</td>
										</tr>
									</tbody>
									</c:forEach>
									<tr align="center" height="20">
											<td colspan="9">
										<c:url var="before" value="mypageMyHome.ptsd">
											<c:param name="page" value="${bPi.currentPage - 1 }"></c:param>
										</c:url>
										<c:if test="${bPi.currentPage <= 1 }">
											[이전]
										</c:if>
										<c:if test="${bPi.currentPage > 1 }">
											<a id="title-a" href="${before }">[이전]</a>
										</c:if>
										<!-- 검색시 페이징 처리 X -->
										<c:if test="${bPi.startNavi eq null }">
												<font color="black" size="4">[1]</font>
										</c:if>
										<c:if test="${bPi.startNavi ne null }">
										<c:forEach var="p" begin="${bPi.startNavi }" end="${bPi.endNavi }">
											
											<c:url var="pagination" value="mypageMyHome.ptsd">
												<c:param name="page" value="${p }"></c:param>
											</c:url>
											
											<c:if test="${p eq bPi.currentPage }">
												<font color="black" size="4">[${p }]</font>
											</c:if>
											<c:if test="${p ne bPi.currentPage }">
												<a id="title-a" href="${pagination }">${p }</a>&nbsp;
											</c:if>
										</c:forEach>
										
										<c:url var="after" value="mypageMyHome.ptsd">
											<c:param name="page" value="${bPi.currentPage + 1 }"></c:param>
										</c:url>
										<c:if test="${bPi.currentPage >= bPi.maxPage }">
											[다음]
										</c:if>
										<c:if test="${bPi.currentPage < bPi.maxPage }">
											<a id="title-a" href="${after }">[다음]</a>
										</c:if>
										</c:if>
										</td>
										</tr>
								</table>
							</div>
						</div>
					</div>
				</main>
			<br><br>
			<footer class="footer">
				<div class="container-fluid">
					<div class="row text-muted">
						<div class="col-6 text-start">
							<p class="mb-0">
								<a class="text-muted" href="https://adminkit.io/"
									target="_blank"><strong>AdminKit</strong></a> &copy;
							</p>
						</div>
						<div class="col-6 text-end">
							<ul class="list-inline">
								<li class="list-inline-item"><a class="text-muted"
									href="https://adminkit.io/" target="_blank">Support</a></li>
								<li class="list-inline-item"><a class="text-muted"
									href="https://adminkit.io/" target="_blank">Help Center</a></li>
								<li class="list-inline-item"><a class="text-muted"
									href="https://adminkit.io/" target="_blank">Privacy</a></li>
								<li class="list-inline-item"><a class="text-muted"
									href="https://adminkit.io/" target="_blank">Terms</a></li>
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