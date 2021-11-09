<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의(공지)  목록</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/resources/css/app.css">
</head>
	<style>
		#title-a{
				text-decoration: none;
				font:normal; 
				color: black;
			}
	</style>
<body>
<script>
		//자바스크립트로 헤더 파일 받아오는 소스 
// 		$(document).ready(function() {
// 			$('#headerMain').load("/resources/html/header.jsp");
// 		});
</script>
<div id="headerMain"></div>
<br><br><br><br>
<c:import url="/noticeListView.ptsd"></c:import>
	<br><br>
	<br><br>
	<br style="clear:both">
	<main id="main">
	<h1 align="center" style="font-size:44px">문의사항</h1><br><br><br><br>
	<div class="row visible" style="heigh:100px"></div>
	<div class="container">
		<table class="table" align ="center" width="800">
		  <thead>
			    <tr align="center">
			      <th align="center">번호</th>
			      <th align="center" colspan="2" width="200px">제목</th> 
			      <th align="center">답변상태</th>
			      <th align="center">작성자</th>
			      <th align="center">게시일</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<c:if test="${empty qList }">
					<tr>
						<td colspan="6" align="center">조회된 정보가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not empty qList }">
					<c:forEach items="${qList }" var="qna" varStatus="">
						<tr>
							<td align="center">${qna.qnaNo }</td>
							<td colspan="2" align="center">
								<c:url var="qDetail" value="qnaDetailView.ptsd">
									<c:param name="qnaNo" value="${qna.qnaNo }"></c:param>
								</c:url>
								<a id="title-a" href="${qDetail }">
									${qna.qnaTitle }
								</a>
							</td>
							
							<c:if test="${qna.qnaAnswer ne null }">
								<td align="center">
									<input type="checkbox" class="btn-check" id="btn-check-3" autocomplete="off" disabled>
									<label class="btn btn-success" for="btn-check-3">답변완료</label>
								</td>
							</c:if>
							<c:if test="${qna.qnaAnswer eq null }">
								<td align="center">
									<input type="checkbox" class="btn-check" id="btn-check-3" autocomplete="off" disabled>
									<label class="btn btn-warning" for="btn-check-3">답변대기</label>
								</td>
							</c:if>
							<td align="center">${qna.userId }</td>
							<td align="center">${qna.qCreateDate }</td>
						</tr>
					</c:forEach>
				</c:if>
				<tr>
					<td align="center" colspan="6">
						<c:url var="before" value="qnaListView.ptsd">
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
							
							<c:url var="pagination" value="qnaListView.ptsd">
								<c:param name="page" value="${p }"></c:param>
							</c:url>
							
							<c:if test="${p eq pi.currentPage }">
								<font color="black" size="4">[${p }]</font>
							</c:if>
							<c:if test="${p ne pi.currentPage }">
								<a id="title-a" href="${pagination }">${p }</a>&nbsp;
							</c:if>
						</c:forEach>
						
						<c:url var="after" value="qnaListView.ptsd">
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
			    <tr>
			    	<c:if test="true">
			      <td colspan="5" align="right">
			      	<div><button class="btn btn-primary" onclick="location.href='qnaWriteView.ptsd'">글쓰기</button></div>
			      </td>
			      </c:if>
			    </tr>
		  </tbody>
		</table>
		<div align="center">
		<form action="qnaSearch.ptsd" method="get">
			<select name="searchCondition">
				<option value="all" <c:if test="${search.searchCondition == 'all' }">selected</c:if>>전체</option>
				<option value="writer" <c:if test="${search.searchCondition == 'writer' }">selected</c:if>>작성자</option>
				<option value="title" <c:if test="${search.searchCondition == 'title' }">selected</c:if>>제목</option>
				<option value="contents" <c:if test="${search.searchCondition == 'contents' }">selected</c:if>>내용</option>
			</select>
			<input type="hidden" name="page" value="1">
			<input type="text" name="searchValue" value="${search.searchValue }">
			<input type="submit" value="검색">
		</form>
	</div>
	</div>
	</main>
	
</body>
</html>