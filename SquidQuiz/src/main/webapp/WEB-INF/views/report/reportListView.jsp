<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 날짜 jstl -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 관리</title>
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
	.nav nav-pills{
		align-content: center;
	}
	.tap{
		text-align: center;
	}
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
					<li class="sidebar-item active"><a class="sidebar-link"
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
						<ul class="nav nav-pills nav-justified">
						
						  <li  class="nav-item">
						    <a class="nav-link active" data-toggle="tab" href="#report">게시물</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link" href="replyReportListView.ptsd">댓글</a>
						  </li>
						
						
						</ul>
						
<!-- 						<h1 class="card-title mb-0">게시물 관리</h1> -->
					</div>
					 <!-- 아이디 검색창 -->
					<div align="center">
						<form action="reportSearchView.ptsd" method="get">
							<select name="searchCondition">
								<option value="all" <c:if test="${search.searchCondition == 'all' }">selected</c:if>>전체</option>
								<option value="userId" <c:if test="${search.searchCondition == 'userId' }">selected</c:if>>신고자</option>
								<option value="writer" <c:if test="${search.searchCondition == 'writer' }">selected</c:if>>게시자</option>
								<option value="boardTitle" <c:if test="${search.searchCondition == 'boardTitle' }">selected</c:if>>게시물제목</option>
							</select>
							<input type="hidden" name="page" value="1">
							<input type="text" name="searchValue" value="${search.searchValue }">
							<input type="submit" value="검색">
						</form>
				   </div>
				   <!-- 아이디 검색창 끝 -->
				   <!-- 신고 리스트 테이블 -->
					<table class="table table-hover my-0" >
						<thead align="center">
							<tr>
								<th style="width:10%"> No</th>
								<th style="width:10%">신고자</th>
								<th style="width:35%">제목</th>
								<th style="width:10%">게시자</th>
								<th style="width:15%">신고일</th>
								<th style="width:10%">게시물 삭제</th>
								<th style="width:10%">내역 삭제</th>
								
							</tr>
						</thead>
						<c:if test="${rList eq null }">
							<tbody >
								<tr>
									<td colspan="7" align="center">조회된 내용이 없습니다.</td>
								</tr>
							</tbody>
						</c:if>
						<c:forEach items="${rList }" var="rList">
						<tbody align="center">
							<tr>
							
								<td>${rList.reportNo }</td>
								<td>
									${rList.reportedUserId }
								</td>
								<c:url var="bDetail" value="boardDetail.ptsd">
									<c:param name="bNo" value="${rList.boardNo }"></c:param>
								
								</c:url>
								<td><a href="${bDetail }">${rList.boardTitle}</a></td>
								<td>${rList.boardWriter }</td>
								<td><fmt:formatDate value="${rList.boardReportDate }" pattern="yyyy-MM-dd  HH:mm"/></td>
								
<%-- 								<c:url var="bDelete" value="reportBoardDelete.ptsd"> --%>
<%-- 									<c:param name="boardNo" value="${rList.boardNo }"></c:param> --%>
<%-- 									<c:param name="reportNo" value="${rList.reportNo }"></c:param> --%>
<%-- 								</c:url> --%>
								<td>
									<input type="hidden" value="${rList.boardNo }">
									<input type="hidden" value="${rList.reportNo }">
									<button class="btn btn-warning" onclick="deleteBoard(this);">삭제</button>
								</td>
								
<%-- 								<c:url var="rDelete" value="reportDelete.ptsd"> --%>
<%-- 									<c:param name="reportNo" value="${rList.reportNo }"></c:param> --%>
<%-- 								</c:url> --%>
								<td>
									<input type="hidden" value="${rList.reportNo }">
									<button class="btn btn-warning" onclick="deleteReport(this);">삭제</button>
								</td>
							</tr>
							
						</tbody>
						</c:forEach>
						
							<tr align="center" height="20">
								<!-- search일 경우 페이징 -->
							<c:if test="${search.searchValue ne null }">
								<td colspan="7">
							
							<c:url var="before" value="reportSearchView.ptsd">
								<c:param name="page" value="${pi.currentPage - 1 }"></c:param>
									<!-- search 페이징  -->
									<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
									<c:param name="searchValue" value="${search.searchValue }"></c:param>
									<!-- /search 페이징  -->
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
								
								<c:url var="pagination" value="reportSearchView.ptsd">
									<c:param name="page" value="${p }"></c:param>
									<!-- search 페이징  -->
									<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
									<c:param name="searchValue" value="${search.searchValue }"></c:param>
									<!-- /search 페이징  -->
								</c:url>
								
								<c:if test="${p eq pi.currentPage }">
									<font color="black" size="4">[${p }]</font>
								</c:if>
								<c:if test="${p ne pi.currentPage }">
									<a id="title-a" href="${pagination }">${p }</a>&nbsp;
								</c:if>
							</c:forEach>
							
							<c:url var="after" value="reportSearchView.ptsd">
								<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
									<!-- search 페이징  -->
									<c:param name="searchCondition" value="${search.searchCondition }"></c:param>
									<c:param name="searchValue" value="${search.searchValue }"></c:param>
									<!-- /search 페이징  -->
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
							<!-- /search일 경우 페이징 -->
							<!-- 전체 리스트 페이징 -->
								<c:if test="${search.searchValue eq null }">
								<td colspan="7">
							
							<c:url var="before" value="reportListView.ptsd">
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
								
								<c:url var="pagination" value="reportListView.ptsd">
									<c:param name="page" value="${p }"></c:param>
									
								</c:url>
								
								<c:if test="${p eq pi.currentPage }">
									<font color="black" size="4">[${p }]</font>
								</c:if>
								<c:if test="${p ne pi.currentPage }">
									<a id="title-a" href="${pagination }">${p }</a>&nbsp;
								</c:if>
							</c:forEach>
							
							<c:url var="after" value="reportListView.ptsd">
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
							</tr>
					</table>
					<!-- 신고 리스트 테이블 끝-->
					
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
	//게시물 삭제
	function deleteBoard(obj){
		var deleteBoardChk = confirm("해당 게시물을 삭제하시겠습니까?");
		var boardNo = $(obj).prev().prev().val();
		var reportNo = $(obj).prev().val();
		if(deleteBoardChk){
			location.href="reportBoardDelete.ptsd?boardNo="+ boardNo + "&reportNo=" + reportNo;
		}else{
			alert("게시물 삭제를 취소하였습니다.");
		}
		
	}
	//게시물 신고 내역 삭제
	function deleteReport(obj){
		var deleteReportChk = confirm("해당 신고 내역을 삭제하시겠습니까?");
		var reportNo = $(obj).prev().val();
		if(deleteReportChk){
			location.href="reportDelete.ptsd?reportNo="+ reportNo;
		}else{
			alert("신고 내역 삭제를 취소하였습니다.");
		}
		
	}
	
	
	</script>
	<!-- 탭 동작용 부트스트랩 4 cdn... -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	<script src="/resources/js/app.js"></script>
</body>
</html>