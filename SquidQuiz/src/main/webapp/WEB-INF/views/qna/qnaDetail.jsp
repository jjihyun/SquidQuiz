<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA 상세 페이지</title>
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
	<h1 align="center" style="font-size:44px">문의</h1>
	<br><br>
	<main id="main">
		<div class="container">
			<form action="modifyAnswer.ptsd" method="post">
				<input type="hidden" value="${qna.qnaNo }" name="qnaNo">
				<input type="hidden" value="${qna.userNo }" name="userNo">
 					<div class="row">
						<table class="table">
						  <thead>
						    <tr>
						      <th scope="col">제목</th>
						      <td colspan="3">${qna.qnaTitle }</td>
						    </tr>
						  </thead>
						  <tbody>
						    <tr>
						      <th scope="row">작성일</th>
						      <td >${qna.qCreateDate }</td>
						      <td colspan="2">&nbsp;</td>
						    </tr>
						    <tr>
						    	<td>&nbsp;</td>
						      <td colspan="3">${qna.qnaContents }</td>
						    </tr>
						    <tr>
						      <th scope="row">답변</th>
						      <c:if test="${qna.qnaAnswer eq null }">
						    	  <td colspan="2">
						    	   <textarea class="form-control"  rows="5" name="qnaAnswer" placeholder="답변을 작성해주세요." required></textarea>
						      	 </td>
						      <td>
							      <div id="back-btn">
									<button class="btn btn-primary" type="submit">답변 등록</button>
								  </div>
							 </td>
							 </c:if>
								<c:if test="${qna.qnaAnswer ne null }">
									<td colspan="3">
										${qna.qnaAnswer }
									</td>
								</c:if>
						    </tr>
						  </tbody>
						</table>
					</div>

					<section>
						
						<div id="back-btn">
							<a class="btn btn-secondary btn-lg" href="qnaListView.ptsd" role="button">목록으로</a>
							<c:url var="qDelete" value="removeQna.ptsd">
								<c:param name="qnaNo" value="${qna.qnaNo }"></c:param>
							</c:url>
							<a href="${qDelete }" class="btn btn-secondary btn-lg">삭제하기</a>
							
						</div>
					</section>
			</form>
		</div>
	</main>
	<script>
		function deleteQna(){
			$("#deleteButton").on("click", function(){
				
			});
		}
		
	</script>
</body>
</html>