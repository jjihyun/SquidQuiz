<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
        
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
				<input type="hidden" value="${qna.userId }" name="userId">
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
						  		<th>작성자</th>
						  		<td  colspan="3">${qna.userId }</td>
						  	</tr>
						    <tr>
						      <th scope="row">작성일</th>
						      <td>
						      	<fmt:formatDate value="${qna.qCreateDate }" pattern="yyyy-MM-dd  HH:mm"/>
							  </td>
						      <td colspan="2">&nbsp;</td>
						    </tr>
						    <tr>
						    	<td>&nbsp;</td>
						      <td colspan="3">
						      <div style="min-height:300px;">
   								${qna.qnaContents }
   							   </div>
   							   </td>
						    </tr>
						    
						    <tr>
						      <th scope="row">답변</th>
						      <c:if test="${qna.qnaAnswer eq null and loginUser.adminType eq 'N'.charAt(0) }">
						      	<td>
						      		빠른 시일 내에 답변드리겠습니다. 조금만 기다려주세요!
						      	</td>
						      </c:if>
						      
						      <c:if test="${qna.qnaAnswer eq null and loginUser.adminType eq 'Y'.charAt(0) }">
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
								<td colspan="1">
									${qna.qnaAnswer }
								</td>
								<td style="width:10%">
									<b>답변일시</b>
								</td>
								<td style="width:15%">
									<fmt:formatDate value="${qna.qAnswerDate }" pattern="yyyy-MM-dd  HH:mm"/>
								</td>
							</c:if>
						    </tr>
						 
						  </tbody>
						</table>
					</div>

					<section>
						
						<div id="back-btn">
							<a class="btn btn-secondary btn-lg" href="qnaListView.ptsd" role="button">목록으로</a>
<%-- 							<c:url var="qDelete" value="removeQna.ptsd"> --%>
<%-- 								<c:param name="qnaNo" value="${qna.qnaNo }"></c:param> --%>
<%-- 							</c:url> --%>
							<c:if test="${loginUser.userId eq qna.userId }">
								<a href="javascript:(0)" class="btn btn-secondary btn-lg" onclick="deleteQna();">삭제하기</a>
							</c:if>
						</div>
					</section>
			</form>
		</div>
	</main>
	<script>
		function deleteQna(){
			var deleteChk = window.confirm("문의 글을 삭제하시겠습니까?");
			var qnaNo = '${qna.qnaNo}';
			if(deleteChk){
				location.href="removeQna.ptsd?qnaNo="+qnaNo;
			}else{
				alert("취소하였습니다.");
			}
		}
		
	</script>
</body>
</html>