<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 목록</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <link rel="stylesheet" href="/resources/css/app.css"> -->
<!-- <link rel="stylesheet" href="/resources/js/app.js"> -->
</head>

<body>
<script>
		//자바스크립트로 헤더 파일 받아오는 소스 
		$(document).ready(function() {
			$('#headerMain').load("/resources/html/header.jsp");
		});
</script>
<jsp:include page="../../../resources/html/header.jsp"/>
	<br style="clear:both">
	<h1 align="center">자유게시판</h1>
	<br><br>
	<div class="row visible" style="heigh:100px"></div>
	<div class="container">
	<table align="center" width="600" border="1" cellspacing="0" style="clear:right;">
	<tr>
		<th align="center">번호</th>
		<th align="center" width="300">제목</th>
		<th align="center">작성자</th>
		<th align="center">날짜</th>
<!-- 		<th align="center">첨부파일</th> -->
	</tr>
		<c:forEach items="${bList }" var="board">
		<input type="hidden" value="${!empty board.bFileName }">
		<input type="hidden" value="${ empty board.bFileName }">
			<tr>
				<td align="center">${board.bNo }</td>
				
				<td align="center">
					<c:url var="boardDetail" value="boardDetail.ptsd">
						<c:param name="bNo" value="${board.bNo }"/>
					</c:url>
					<a href="${boardDetail }">${board.bTitle }</a>
				</td>
				
				<td align="center">${board.userId }</td>
				
				<td align="center">${board.bCreateDate }</td>
				
			</tr>
		</c:forEach>
		    <tr>
		    	<td align="center" colspan="5">
					<a href="boardWrite.ptsd" class="btn btn-primary">글쓰기</a>
				</td>
			</tr>
		
	
		<div align="center">
				<!-- 페이징 시작 -->
				<c:if test="${ page.currentPage > page.block }">
					<c:choose>
						<c:when test="${search == null }">
							<a href="boardList.ptsd?pageNum=1">처음</a>&nbsp;
			                    <a
								href="boardList.ptsd?pageNum=${ page.startPage - 1 }">이전</a>&nbsp;
	                        </c:when>
						<c:otherwise>
							<a
								href="boardList.ptsd?pageNum=1&select=${select }&search=${search }">처음</a>&nbsp;  
	                            <a
								href="boardList.ptsd?pageNum=${ page.startPage - 1 }&select=${select }&search=${search }">이전</a>&nbsp;
	                        </c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${ page.currentPage <= page.block }">
					<!-- <span style="color: gray;">처음&nbsp;</span>-->
					<!-- <span style="color: gray;">이전&nbsp;</span>-->
				</c:if>
				<c:forEach var="i" begin="${ page.startPage }"
					end="${ page.endPage }">
					<c:if test="${ i == page.currentPage }">
						<strong>${ i }&nbsp;</strong>
					</c:if>
					<c:if test="${ i != page.currentPage }">
						<c:choose>
							<c:when test="${search == null }">
								<a href="boardList.ptsd?pageNum=${ i }">${ i }&nbsp;</a>
							</c:when>
							<c:otherwise>
								<a
									href="boardList.ptsd?pageNum=${ i }&select=${select }&search=${search }">${ i }&nbsp;</a>
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>
				<c:if test="${ page.endPage < page.allPage }">
					<c:choose>
						<c:when test="${search == null }">
                                    &nbsp;<a
								href="boardList.ptsd?pageNum=${ page.endPage + 1 }">다음</a>
                                    &nbsp;<a
								href="boardList.ptsd?pageNum=${ page.allPage }">끝</a>
						</c:when>
						<c:otherwise>
	                                &nbsp;<a
								href="boardList.ptsd?pageNum=${ page.endPage + 1 }&select=${select }&search=${search }">다음</a>
	                                &nbsp;<a
								href="boardList.ptsd?pageNum=${ page.allPage }&select=${select }&search=${search }">끝</a>
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${ page.endPage >= page.allPage }">
					<!-- <span style="color: gray;">&nbsp;다음</span>-->
					<!-- <span style="color: gray;">&nbsp;끝</span>-->
				</c:if>
				<!-- 페이징 끝 -->
			</div>
	
	<div align="center">
		<form action="boardSearch.ptsd" method="get">
			<select name="searchCondition">
				<option value="all" <c:if test="${search.searchCondition == 'all' }">selected</c:if>>전체</option>
				<option value="writer" <c:if test="${search.searchCondition == 'writer' }">selected</c:if>>작성자</option>
				<option value="title" <c:if test="${search.searchCondition == 'title' }">selected</c:if>>제목</option>
				<option value="contents" <c:if test="${search.searchCondition == 'contents' }">selected</c:if>>내용</option>
			</select>
			<input type="hidden" name="page" value="1">
			<input type="text" name="searchValue" value="${search.searchValue }" placeholder="검색하시겠습니까?">
			<input type="submit" value="검색">
		</form>
	</div>
	
	
</body>
</html>







