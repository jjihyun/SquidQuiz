<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<!-- 최신부트스트랩 -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

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
	background: #f8f9fa;
	padding: 15px;
}

.tab-content.current{
	display: inherit;
}
.point-btn{width:400px;height:50px;}
.box{width:600px; height:200px;background-color:white; margin:0 auto;border-radius: 5px;box-shadow: 0px 0px 20px rgba(197, 196, 196, 0.933);}
.box b{font-size:30px;}
.point-box{width:500px;height:50px;margin-top:30px;text-align:center;background-color:transparent;border:none;pointer-events: none;}
#point-in{font-size:35px;}

#charge-btn,#exchange-btn{background-color: rgb(247, 105, 136);border:none;border-radius: 5px;}
#charge-btn:hover,#exchange-btn:hover{background-color: rgb(230, 87, 118);}

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
						<input type="button" id="charge-btn" class="point-btn" value="포인트 충전" onclick="location.href='/chargePoint.ptsd'"> 
						<button type="button" id="exchange-btn" class="point-btn" data-bs-toggle="modal" data-bs-target="#exampleModal">
						  포인트 환전
						</button>
					</div>
					<!-- 모달 테스트 -->
						<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">환전 신청</h5>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						          <form class="was-validated" action="exchangeRegister.ptsd" method="post" id="exchangeForm">
						          	  <input type="hidden" name="userId" value="${loginUser.userId }">
							           <div class="mb-3">
							          	<label for="validationCustom04" class="form-label">은행</label>
										    <select class="form-select" id="validationCustom04" name="exchangeBank" required>
										      <option selected disabled value="nothing">은행명</option>
										      <option value="국민" <c:if test="${loginUser.bankName == '국민' }">selected</c:if>>국민</option>
										      <option value="KDB산업" <c:if test="${loginUser.bankName == 'KDB산업은행' }">selected</c:if>>KDB산업은행</option>
										      <option value="IBK기업" <c:if test="${loginUser.bankName == 'IBK기업은행' }">selected</c:if>>IBK기업은행</option>
										      <option value="수협" <c:if test="${loginUser.bankName == '수협' }">selected</c:if>>수협</option>
										      <option value="NH농협" <c:if test="${loginUser.bankName == 'NH농협' }">selected</c:if>>NH농협</option>
										      <option value="지역농협" <c:if test="${loginUser.bankName == '지역농협' }">selected</c:if>>지역농협</option>
										      <option value="우리" <c:if test="${loginUser.bankName == '우리' }">selected</c:if>>우리</option>
										      <option value="SC제일" <c:if test="${loginUser.bankName == 'SC제일' }">selected</c:if>>SC제일</option>
										      <option value="씨티" <c:if test="${loginUser.bankName == '씨티' }">selected</c:if>>씨티</option>
										      <option value="하나" <c:if test="${loginUser.bankName == '하나' }">selected</c:if>>하나</option>
										      <option value="신한" <c:if test="${loginUser.bankName == '신한' }">selected</c:if>>신한</option>
										      <option value="대구" <c:if test="${loginUser.bankName == '대구' }">selected</c:if>>대구</option>
										      <option value="부산" <c:if test="${loginUser.bankName == '부산' }">selected</c:if>>부산</option>
										      <option value="광주" <c:if test="${loginUser.bankName == '광주' }">selected</c:if>>광주</option>
										      <option value="제주" <c:if test="${loginUser.bankName == '제주' }">selected</c:if>>제주</option>
										      <option value="전북" <c:if test="${loginUser.bankName == '전북' }">selected</c:if>>전북</option>
										      <option value="경남" <c:if test="${loginUser.bankName == '경남' }">selected</c:if>>경남</option>
										      <option value="케이뱅크" <c:if test="${loginUser.bankName == '케이뱅크' }">selected</c:if>>케이뱅크</option>
										      <option value="카카오뱅크" <c:if test="${loginUser.bankName == '카카오뱅크' }">selected</c:if>>카카오뱅크</option>
										      <option value="토스뱅크" <c:if test="${loginUser.bankName == '토스뱅크' }">selected</c:if>>토스뱅크</option>
										    </select>
									 </div> 
							           <div class="mb-3">
							            <label for="recipient-name" class="col-form-label">예금주</label>
							            <input type="text" class="form-control" id="recipient-name" name="userName" value="${loginUser.userName }" required>
							          </div>
							           <div class="mb-3">
							            <label for="recipient-name" class="col-form-label">계좌번호</label>
							            <input type="text" class="form-control" id="recipient-name" name="account" value="${loginUser.bankAccount }" required>
							          </div>
							           <div class="mb-3">
							            <label for="recipient-name" class="col-form-label">환전 신청 금액</label>
							            <input type="number" class="form-control is-valid" id="recipient-name" name="exchangeMoney" min="1000" max="${loginUser.point }" placeholder="환전할 POINT를 입력해주세요." required><br>
							            <span>환전 가능 POINT : ${loginUser.point }P </span>
							          </div>
						      </form>
							        
						      </div>
						      <div class="modal-footer">
						        <button type="submit" id="modalSubmit" class="btn btn-primary" form="exchangeForm">신청하기</button>
						        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						      </div>
						    </div>
						  </div>
						</div>
					<!-- /모달 테스트 -->
					<br>
					<div align="center">
							<div class="box">
								<br> <b>보유 포인트</b><br> <input type="text" id="point-in" name="Point" class="point-box" value="${userPoint }P">
							</div>
					</div>
					<br><br>
					<div align="center" class="container">

							<ul class="tabs">
								<li class="tab-link current" data-tab="tab-1" onclick="location.href='/mypagePoint.ptsd'">충전 내역</li>
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
										<c:if test="${empty cList }">
											<tbody align="center">
												<tr align="center">
													<td colspan="9"><span>충전 내역이 없습니다.</span></td>
												</tr>
											</tbody>
										</c:if>
										<c:forEach items="${cList }" var="c" varStatus="num">
											<c:set var="i" value="${totalCount - (((cPi.currentPage-1) * cPi.boardLimit + num.index)) }"/>
										<tbody>
											<tr align="center">
												<td>${i }</td>
												<td>${c.chargePoint }</td>
												<td>
													<fmt:formatDate value="${c.pointDate }" pattern="yyyy-MM-dd"/>
												</td>
											</tr>
										</tbody>
										</c:forEach>
										<tr align="center" height="20">
											<td colspan="9">
											<c:url var="before" value="mypagePoint.ptsd">
											<c:param name="page" value="${cPi.currentPage - 1 }"></c:param>
										</c:url>
										<c:if test="${cPi.currentPage <= 1 }">
											[이전]
										</c:if>
										<c:if test="${cPi.currentPage > 1 }">
											<a id="title-a" href="${before }">[이전]</a>
										</c:if>
										<!-- 검색시 페이징 처리 X -->
										<c:if test="${cPi.startNavi eq null }">
												<font color="black" size="4">[1]</font>
										</c:if>
										<c:if test="${cPi.startNavi ne null }">
										<c:forEach var="p" begin="${cPi.startNavi }" end="${cPi.endNavi }">
											
											<c:url var="pagination" value="mypagePoint.ptsd">
												<c:param name="page" value="${p }"></c:param>
											</c:url>
											
											<c:if test="${p eq cPi.currentPage }">
												<font color="black" size="4">[${p }]</font>
											</c:if>
											<c:if test="${p ne cPi.currentPage }">
												<a id="title-a" href="${pagination }">${p }</a>&nbsp;
											</c:if>
										</c:forEach>
										
										<c:url var="after" value="mypagePoint.ptsd">
											<c:param name="page" value="${cPi.currentPage + 1 }"></c:param>
										</c:url>
										<c:if test="${cPi.currentPage >= cPi.maxPage }">
											[다음]
										</c:if>
										<c:if test="${cPi.currentPage < cPi.maxPage }">
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
							<div id="card-flex" class="card flex-fill">
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
										<tbody id="exchangeBody">
											<c:forEach items="${eList }" var="e" varStatus="num">
											<c:set var="i" value="${totalEcount - (((ePi.currentPage-1) * ePi.boardLimit + num.index)) }"/>
												<tr align="center">
												
													<td>${i }</td>
													<td>${e.account }</td>
													<td>${e.exchangeMoney }</td>
													
													<td>
														<fmt:formatDate value="${e.exchangeEnrollDate }" pattern="yyyy-MM-dd"/>
													</td>
													<c:if test="${e.exchangeStatus eq 'N' }">
														<td><span class="badge bg-warning">대기중</span></td>
													</c:if>
													<c:if test="${e.exchangeStatus eq 'Y' }">
														<td><span class="badge bg-success">처리완료</span></td>
													</c:if>
												</tr>
											</c:forEach>
										</tbody>
										<tr align="center" height="20">
											<td colspan="9">
											<c:url var="before" value="mypagePoint.ptsd">
											<c:param name="page" value="${ePi.currentPage - 1 }"></c:param>
										</c:url>
										<c:if test="${ePi.currentPage <= 1 }">
											[이전]
										</c:if>
										<c:if test="${ePi.currentPage > 1 }">
											<a id="title-a" href="${before }">[이전]</a>
										</c:if>
										<!-- 검색시 페이징 처리 X -->
										<c:if test="${ePi.startNavi eq null }">
												<font color="black" size="4">[1]</font>
										</c:if>
										<c:if test="${ePi.startNavi ne null }">
										<c:forEach var="p" begin="${ePi.startNavi }" end="${ePi.endNavi }">
											
											<c:url var="pagination" value="mypagePoint.ptsd">
												<c:param name="page" value="${p }"></c:param>
											</c:url>
											
											<c:if test="${p eq ePi.currentPage }">
												<font color="black" size="4">[${p }]</font>
											</c:if>
											<c:if test="${p ne ePi.currentPage }">
												<a id="title-a" href="${pagination }">${p }</a>&nbsp; <!-- href="#" onclick="pagination();" -->
											</c:if>
										</c:forEach>
										
										<c:url var="after" value="mypagePoint.ptsd">
											<c:param name="page" value="${ePi.currentPage + 1 }"></c:param>
										</c:url>
										<c:if test="${ePi.currentPage >= ePi.maxPage }">
											[다음]
										</c:if>
										<c:if test="${ePi.currentPage < ePi.maxPage }">
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

			<footer>
				<jsp:include page="../../../resources/html/footer.html"/>
			</footer>
		</div>
	</div>

	<script src="/resources/js/app.js"></script>

<script>

$('ul.tabs li').click(function(){
	
	var tab_id = $(this).attr('data-tab');
	
	$('ul.tabs li').removeClass('current');
	$('.tab-content').removeClass('current');

	$(this).addClass('current');
	$("#"+tab_id).addClass('current');


});


//function pagination() {
//	$.ajax({
//		url : "",
//		type : "get",
//		data : {},
//		success : function(data) {
//			$("#exchangeBody").empty();
//			var $tr = $("<tr align='center'>");
//			var $td;
//			var tdStr;
//			var page = data.Page;
			
// 			for(var i in data) {
				
// 			}
// 			for(var i = 0 ; i < 10; i++) {
// 				tdStr += "<tr align='center'><td>data[i].exchangeNo</td><td>계정명</td><td>환전금액</td><td>날짜</td><td>상태</td></tr>";
// 			}
//			$("#exchangeBody").html(tdStr);
//		},
//		error : function() {
//			console.log("관리자에게 문의해주세요.");
//		}
//	})
// }

</script>
</body>
</html>