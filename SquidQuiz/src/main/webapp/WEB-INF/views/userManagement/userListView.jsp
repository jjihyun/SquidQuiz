<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 날짜 jstl -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
					
					<li class="sidebar-item active"><a class="sidebar-link"
						href="userListView.ptsd"> <i class="align-middle"
							data-feather="sliders"></i> <span>회원관리</span>
					</a></li>
					<li class="sidebar-item"><a class="sidebar-link"
						href="quizStart.ptsd"> <i class="align-middle"
							data-feather="user"></i> <span class="align-middle">퀴즈진행</span>
					</a></li>
					<li class="sidebar-item"><a class="sidebar-link"
						href="oxList.ptsd"> <i class="align-middle"
							data-feather="user"></i> <span class="align-middle">퀴즈관리</span>
					</a></li>
					<li class="sidebar-item"><a class="sidebar-link"
						href="reportListView.ptsd"> <i class="align-middle"
							data-feather="user"></i> <span class="align-middle">신고관리</span>
					</a></li>
					<li class="sidebar-item"><a class="sidebar-link"
						href="exchangeListView.ptsd"> <i class="align-middle"
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
						<h5 class="card-title mb-0">회원 관리</h5>
					</div>
					<!-- 아이디 검색창 -->
					<div align="center">
						<form action="userSearchListView.ptsd" method="get">
							<select name="searchCondition">
								<option value="all" <c:if test="${search.searchCondition == 'all' }">selected</c:if>>전체</option>
								<option value="userId" <c:if test="${search.searchCondition == 'userId' }">selected</c:if>>아이디</option>
								<option value="userName" <c:if test="${search.searchCondition == 'userName' }">selected</c:if>>이름</option>
								<option value="userAddr" <c:if test="${search.searchCondition == 'userAddr' }">selected</c:if>>주소</option>
							</select>
							<input type="hidden" name="page" value="1">
							<input type="text" name="searchValue" value="${search.searchValue }">
							<input type="submit" value="검색">
						</form>
				</div><br><br>
					<table class="table table-hover my-0" >
						<thead align="center">
							<tr>
								<th>회원 No</th>
								<th>아이디</th>
								<th>이름</th>
								<th>주소</th>
								<th>이메일</th>
								<th>전화번호</th>
								<th>포인트</th>
								<th>은행</th>
								<th>계좌번호</th>
								<th>회원 탈퇴</th>
								
							</tr>
						</thead>
						<c:if test="${uList eq null }">
							<tbody align="center">
								<tr align="center">
									<td colspan="10">
										<span>조회된 회원 정보가 없습니다.</span>	
									</td>
								</tr>
							</tbody>
						</c:if>
						<c:forEach items="${uList }" var="uList">
						<tbody align="center">
							<tr>
								<td>${uList.userNo }</td>
								<td>${uList.userId }</td>
								<td>${uList.userName }</td>
								<td>${uList.userAddr}</td>
								<td>${uList.userEmail }</td>
								<td>${uList.userPhone }</td>
								<td>${uList.point }</td>
								<td>${uList.bankName }</td>
								<td>${uList.bankAccount }</td>
								<td>
									<input type="hidden" value="${uList.userNo }">
									<button class="btn btn-danger" onclick="deleteUser(this);">삭제</button>
								</td>
							</tr>
						</tbody>
						</c:forEach>
						
							<tr align="center" height="20">
							<!-- 전체 리스트 페이징 -->
							<c:if test="${search.searchValue eq null }">
								<td colspan="9">
								<c:url var="before" value="userListView.ptsd">
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
								
								<c:url var="pagination" value="userListView.ptsd">
									<c:param name="page" value="${p }"></c:param>
								</c:url>
								
								<c:if test="${p eq pi.currentPage }">
									<font color="black" size="4">[${p }]</font>
								</c:if>
								<c:if test="${p ne pi.currentPage }">
									<a id="title-a" href="${pagination }">${p }</a>&nbsp;
								</c:if>
							</c:forEach>
							
							<c:url var="after" value="userListView.ptsd">
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
							</c:if>
							<!-- /전체 리스트 페이징 -->
							<!-- 검색시 페이징 -->
							<c:if test="${search.searchValue ne null }">
							<td colspan="9">
								<c:url var="before" value="userSearchListView.ptsd">
								<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
								<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
									<c:param name="searchValue" value="${search.searchValue }"></c:param>
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
								
								<c:url var="pagination" value="userSearchListView.ptsd">
									<c:param name="page" value="${p }"></c:param>
									<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
									<c:param name="searchValue" value="${search.searchValue }"></c:param>
								</c:url>
								
								<c:if test="${p eq pi.currentPage }">
									<font color="black" size="4">[${p }]</font>
								</c:if>
								<c:if test="${p ne pi.currentPage }">
									<a id="title-a" href="${pagination }">${p }</a>&nbsp;
								</c:if>
							</c:forEach>
							
							<c:url var="after" value="userSearchListView.ptsd">
								<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
								<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
									<c:param name="searchValue" value="${search.searchValue }"></c:param>
							</c:url>
							<c:if test="${pi.currentPage >= pi.maxPage }">
								[다음]
							</c:if>
							<c:if test="${pi.currentPage < pi.maxPage }">
								<a id="title-a" href="${after }">[다음]</a>
							</c:if>
							</c:if>
							</td>
							</c:if>
							<!-- /검색시 페이징 -->
							</tr>
					</table>
				</div>
			</main>
		</div>
	</div>
	

<!-- 	<footer class="footer"> -->
<!-- 		<div class="container-fluid"> -->
<!-- 			<div class="row text-muted"></div> -->
<!-- 		</div> -->
<!-- 	</footer> -->
	<footer>
		<jsp:include page="../../../resources/html/footer.html"/>
	</footer>
	<script>
		function deleteUser(obj){

			var userNo =$(obj).parent().find("input").val();
			var deleteUserChk = window.confirm("회원을 탈퇴시키겠습니까?");
			if(deleteUserChk){
				location.href="userRemove.ptsd?userNo=" + userNo  ;
			}else{
				window.alert("취소하였습니다.");
			}
		}
	</script>
	<script src="/resources/js/app.js"></script>
</body>
</html>