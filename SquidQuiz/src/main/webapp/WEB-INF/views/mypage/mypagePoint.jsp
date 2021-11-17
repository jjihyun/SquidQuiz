<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
	<meta name="author" content="AdminKit">
	<meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

	<link rel="preconnect" href="https://fonts.gstatic.com">
	
	<!-- 사이트 이모티콘 -->
	<link rel="shortcut icon" href="/resources/img/photos/초대.png" />

	<title>마이페이지 활동내역</title>
	<link rel="stylesheet" href="/resources/css/app.css">
	<link rel="stylesheet" href="/resources/js/app.js">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<style>

.container{
	width: 500px;
	margin: 0 auto;
}

ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
}
ul.tabs li{
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current{
	background: #ededed;
	color: #222;
}

.tab-content{
	display: none;
	background: #ededed;
	padding: 15px;
}

.tab-content.current{
	display: inherit;
}
.point-btn{width:400px;height:50px;}
.box{width:600px; height:200px;background-color:pink; margin:0 auto;}
.box b{font-size:30px;}
.point-box{width:500px;height:50px;margin-top:30px;text-align:center;}

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

					<li class="sidebar-item "><a class="sidebar-link"
						href="mypageMyHome.ptsd"> <i class="align-middle"
							data-feather="user"></i> <span class="align-middle">MY홈</span>
					</a></li>
					<li class="sidebar-item"><a class="sidebar-link"
						href="mypageDetail.ptsd"> <i class="align-middle"
							data-feather="sliders"></i> <span class="align-middle">활동내역</span>
					</a></li>
					<li class="sidebar-item active"><a class="sidebar-link"
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

				<h1 class="h3 mb-3">
					<strong>포인트</strong>
				</h1>
				<div class="container-fluid p-0">
					<div align="center">
						<input type="button" class="point-btn" value="포인트 충전" onclick="location.href='/chargePoint.ptsd'"> 
						<input type="button" class="point-btn" value="포인트 환전">
					</div>
					<br>
					<div align="center">
							<div class="box">
								<br> <b>보유 포인트</b><br> <input type="text" name="Point" class="point-box" value="${userPoint }">
							</div>
					</div>
					<br><br>
					<div align="center" class="container">

							<ul class="tabs">
								<li class="tab-link current" data-tab="tab-1">충전 내역</li>
								<li class="tab-link" data-tab="tab-2">환전 내역</li>
							</ul>
							<br>
						</div>
					<input type="hidden" name="userNo" value="">	
					<div id="tab-1" class="tab-content current">
					<hr>
					<!-- 게시판 -->
					<div align="center">
						<div class="board">
							<div class="card flex-fill">
								<table class="table table-hover my-0">
									<thead>
										<tr align="center">
											<th>충전 번호</th>
											<th class="d-none d-xl-table-cell">충전 금액</th>
											<th class="d-none d-xl-table-cell">날짜</th>
										</tr>
									</thead>
										<c:if test="${cList eq null }">
											<tbody align="center">
												<tr align="center">
													<td colspan="9"><span>조회된 충전 내역이 없습니다.</span></td>
												</tr>
											</tbody>
										</c:if>
										<c:forEach items="${cList }" var="cList">
										<tbody >
											<tr align="center">
												<td>${cList.pointNo }</td>
												<td>${cList.chargePoint }</td>
												<td>
													<fmt:formatDate value="${cList.pointDate }" pattern="yyyy-MM-dd"/>
												</td>
											</tr>
										</tbody>
										</c:forEach>
										<tr align="center" height="20">
											<td colspan="9">
											<c:url var="before" value="mypagePoint.ptsd">
											<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
										</c:url>
										<c:if test="${pi.currentPage <= 1 }">
											[이전]
										</c:if>
										<c:if test="${pi.currentPage > 1 }">
											<a id="title-a" href="${before }">[이전]</a>
										</c:if>
										<!-- 검색시 페이징 처리 X -->
										<c:if test="${pi.startNavi eq null }">
												<font color="black" size="4">[1]</font>
										</c:if>
										<c:if test="${pi.startNavi ne null }">
										<c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
											
											<c:url var="pagination" value="mypagePoint.ptsd">
												<c:param name="page" value="${p }"></c:param>
											</c:url>
											
											<c:if test="${p eq pi.currentPage }">
												<font color="black" size="4">[${p }]</font>
											</c:if>
											<c:if test="${p ne pi.currentPage }">
												<a id="title-a" href="${pagination }">${p }</a>&nbsp;
											</c:if>
										</c:forEach>
										
										<c:url var="after" value="mypagePoint.ptsd">
											<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
										</c:url>
										<c:if test="${pi.currentPage >= pi.maxPage }">
											[다음]
										</c:if>
										<c:if test="${pi.currentPage < pi.maxPage }">
											<a id="title-a" href="${after }">[다음]</a>
										</c:if>
										</c:if>
										</td>
										</tr>
								</table>
							</div>
						</div>
					</div>
					</div>
					<input type="hidden" name="userId" value="">
					<div id="tab-2" class="tab-content">
					<hr>
					<!-- 게시판 -->
					<div align="center">
						<div class="board">
							<div class="card flex-fill">
								<table class="table table-hover my-0">
									<thead>
										<tr align="center">
											<th>환전 번호</th>
											<th class="d-none d-xl-table-cell">계좌 정보</th>
											<th class="d-none d-xl-table-cell">환전 금액</th>
											<th class="d-none d-md-table-cell">신청날짜</th>
											<th>상태</th>
										</tr>
									</thead>
										<c:if test="${eList eq null }">
											<tbody align="center">
												<tr align="center">
													<td colspan="9"><span>조회된 환전 신청 내역이 없습니다.</span></td>
												</tr>
											</tbody>
										</c:if>
										<c:forEach items="${eList }" var="eList">
										<tbody>
											<tr align="center">
											
												<td>${eList.exchangeNo }</td>
												<td>${eList.account }</td>
												<td>${eList.exchangeMoney }</td>
												
												<td>
													<fmt:formatDate value="${eList.exchangeEnrollDate }" pattern="yyyy-MM-dd"/>
												</td>
												<td>${eList.exchangeStatus }</td>
											</tr>
										</tbody>
										</c:forEach>
										<tr align="center" height="20">
											<td colspan="9">
											<c:url var="before" value="mypagePoint.ptsd">
											<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
										</c:url>
										<c:if test="${pi.currentPage <= 1 }">
											[이전]
										</c:if>
										<c:if test="${pi.currentPage > 1 }">
											<a id="title-a" href="${before }">[이전]</a>
										</c:if>
										<!-- 검색시 페이징 처리 X -->
										<c:if test="${pi.startNavi eq null }">
												<font color="black" size="4">[1]</font>
										</c:if>
										<c:if test="${pi.startNavi ne null }">
										<c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
											
											<c:url var="pagination" value="mypagePoint.ptsd">
												<c:param name="page" value="${p }"></c:param>
											</c:url>
											
											<c:if test="${p eq pi.currentPage }">
												<font color="black" size="4">[${p }]</font>
											</c:if>
											<c:if test="${p ne pi.currentPage }">
												<a id="title-a" href="${pagination }">${p }</a>&nbsp;
											</c:if>
										</c:forEach>
										
										<c:url var="after" value="mypagePoint.ptsd">
											<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
										</c:url>
										<c:if test="${pi.currentPage >= pi.maxPage }">
											[다음]
										</c:if>
										<c:if test="${pi.currentPage < pi.maxPage }">
											<a id="title-a" href="${after }">[다음]</a>
										</c:if>
										</c:if>
										</td>
										</tr>
								</table>
							</div>
						</div>
					</div>
					</div>
					
				</main>
		

		<footer class="footer">
			<div class="container-fluid">
				<div class="row text-muted">
					<div class="col-6 text-start">
						<p class="mb-0">
							<a class="text-muted" href="https://adminkit.io/" target="_blank"><strong>AdminKit</strong></a>
							&copy;
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

<script>

$(document).ready(function(){
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})

})

</script>
</body>
</html>