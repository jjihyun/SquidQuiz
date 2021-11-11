<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 날짜 jstl -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환전 신청 리스트</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/resources/css/quiz/oxWrite.css">
<link rel="stylesheet" href="/resources/css/app.css">
</head>
<script>
	//자바스크립트로 헤더 파일 받아오는 소스 
	$(document).ready(function() {
		$('#headerMain').load("/resources/html/header.jsp");
	});
</script>
<style>
a:link{color:#495057;	text-decoration: none;} 
a:visited{color:#495057;	text-decoration: none;}
a:hover{color:#495057;	text-decoration: none;}
</style>
<body>
	<div id="headerMain"></div>
	<hr>
	<div class="wrapper">
		<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="index.html"> <img
					src="/src/img/icons/icon-48x48.png" alt=""> <span
					class="align-middle">관리자 홈 </span>
				</a>

				<ul class="sidebar-nav">
					<li class="sidebar-header">목록</li>
					
					<li class="sidebar-item"><a class="sidebar-link"
						href="#"> <i class="align-middle"
							data-feather="sliders"></i> <span>회원정보수정</span>
					</a></li>
					<li class="sidebar-item"><a class="sidebar-link"
						href="pages-profile.html"> <i class="align-middle"
							data-feather="user"></i> <span class="align-middle">퀴즈진행</span>
					</a></li>
					<li class="sidebar-item active"><a class="sidebar-link"
						href="oxList.ptsd"> <i class="align-middle"
							data-feather="user"></i> <span class="align-middle">퀴즈관리</span>
					</a></li>
					<li class="sidebar-item"><a class="sidebar-link"
						href="pages-profile.html"> <i class="align-middle"
							data-feather="user"></i> <span class="align-middle">신고관리</span>
					</a></li>
					<li class="sidebar-item"><a class="sidebar-link"
						href="pages-profile.html"> <i class="align-middle"
							data-feather="user"></i> <span class="align-middle">환전관리</span>
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
				<div class="card flex-fill">
					<div class="card-header">
						<h5 class="card-title mb-0">OX퀴즈</h5>
					</div>
						<button id="" class="btn btn-success" style="opacity: 0.7; color: black;" onclick="location.href='quizWriteView.ptsd';">OX퀴즈등록</button>
					<table class="table table-hover my-0">
						<thead>
							<tr>
								<th>퀴즈번호</th>
								<th class="d-none d-xl-table-cell">제목</th>
								<th class="d-none d-xl-table-cell">내용</th>
								<th>정답</th>
								<th class="d-none d-md-table-cell">등록일</th>
							</tr>
						</thead>
						<c:forEach items="${oxList }" var="ox">
						<tbody>
							<tr>
								<td>${ox.oxNo }</td>
								<td class="d-none d-xl-table-cell">
									<c:url var="oxDetail" value="oxDetail.ptsd">
										<c:param name="oxNo" value="${ox.oxNo }"></c:param>
									</c:url>
									<a href="${oxDetail }">${ox.oxTitle }</a>
								</td>
								<td class="d-none d-xl-table-cell">${ox.oxContents }</td>
								<td><span class="badge bg-success">${ox.oxAnswer }</span></td>
								<td class="d-none d-md-table-cell">
									<fmt:formatDate value="${ox.oxEnrollDate }" pattern="yyyy-MM-dd / HH-mm"/>
								</td>
							</tr>
						</tbody>
						</c:forEach>
						<tr align="center" height="20">
							<td colspan="6">
								<c:url var="before" value="oxList.ptsd">
									<c:param name="page" value="${pd.currentPage - 1 }"></c:param>
								</c:url>
								<c:if test="${pd.currentPage <= 1 }">
									[이전]
								</c:if>
								<c:if test="${pd.currentPage > 1 }">
									<a href="${before }">[이전]</a>
								</c:if>
<!-- 								페이징갯수 -->
								<c:forEach var="p" begin="${pd.startNavi }" end="${pd.endNavi }">
									<c:url var="pagination" value="oxList.ptsd">
										<c:param name="page" value="${p }"></c:param>
									</c:url>
									<c:if test="${p eq pd.currentPage }">
										<font color="red" size="4">[${p }]</font>
									</c:if>
									<c:if test="${p ne pd.currentPage }">
										<a href="${pagination }">${p }</a>&nbsp;
									</c:if>
								</c:forEach>
								<c:url var="after" value="oxList.ptsd">
									<c:param name="page" value="${pd.currentPage + 1 }"></c:param>
								</c:url>
								<c:if test="${pd.currentPage >= pd.maxPage }">
									[다음]
								</c:if>
								<c:if test="${pd.currentPage < pd.maxPage }">
									<a href="${after }">[다음]</a>
								</c:if>
							</td>
						</tr>
					</table>
				</div>
			</main>
		</div>
	</div>
	

	<footer class="footer">
		<div class="container-fluid">
			<div class="row text-muted"></div>
		</div>
	</footer>
	
	<script src="/resources/js/app.js"></script>
</body>
</html>