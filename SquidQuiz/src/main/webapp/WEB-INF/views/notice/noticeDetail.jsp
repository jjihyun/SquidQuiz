<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/resources/css/app.css">
</head>
<style>
	th {
		width:120px;
	}
</style>
<body>
<script>
		//자바스크립트로 헤더 파일 받아오는 소스 
		$(document).ready(function() {
			$('#headerMain').load("/resources/html/header.jsp");
		});
</script>
<div id="headerMain"></div><br><br><br>
	<h1 align="center" style="font-size:44px">공지사항</h1>
	<br><br>
	<main id="main">
		<div class="container">
				<input type="hidden" value="${notice.noticeNo }" name="noticeNo">
 					<div class="row">
						<table class="table">
						  <thead>
						    <tr>
						      <th scope="col">제목</th>
						      <td colspan="3">${notice.noticeTitle }</td>
						    </tr>
						  </thead>
						  <tbody>
						    <tr>
						      <th scope="row">작성일</th>
						      <td >${notice.noticeDate }</td>
						      <td colspan="2">&nbsp;</td>
						    </tr>
						    <tr>
						    	<td>&nbsp;</td>
						       <td colspan="3">
						       	<div style="min-height:300px;">
   								${notice.noticeContents }
   							   </div>
							</td>
						    </tr>
						    <tr>
						     
							
						    </tr>
						  </tbody>
						</table>
					</div>

					<section>
						
						<div id="back-btn">
							<a class="btn btn-secondary btn-lg" href="qnaListView.ptsd" role="button">목록으로</a>
<%-- 							<c:url var="nDelete" value="noticeRemove.ptsd"> --%>
<%-- 								<c:param name="noticeNo" value="${notice.noticeNo }"></c:param> --%>
<%-- 							</c:url> --%>
							<c:url var="nModify" value="noticeModifyView.ptsd">
								<c:param name="noticeNo" value="${notice.noticeNo }"></c:param>
							</c:url>
							<c:if test="${loginUser.adminType eq 'Y'.charAt(0) }">
								<a href="javascript:void(0)" class="btn btn-secondary btn-lg" onclick="deleteNotice();">삭제하기</a>
								<a href="${nModify }" class="btn btn-secondary btn-lg">수정하기</a>
							</c:if>
						</div>
					</section>
		</div>
	</main>
	<footer>
		<jsp:include page="../../../resources/html/footer.html"/>
	</footer>
	<script>
		function deleteNotice(){
			var deleteChk = window.confirm("해당 공지사항을 삭제하시겠습니까?");
			var noticeNo = '${notice.noticeNo}';
			if(deleteChk){
				location.href="noticeRemove.ptsd?noticeNo="+noticeNo;
			}else{
				alert("취소하였습니다.");
			}
		}
	</script>
</body>
</html>