<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 목록</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- 최신부트스트랩 -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<link href="/resources/css/footer.css" rel="stylesheet" />

</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../../../resources/html/header.jsp" />
	<br style="clear: both">
	<br>
	<br>
	<br>
	<br>
	<h1 align="center">자유게시판</h1>
	<br>
	<br>
	<div class="container" style="heigh: 100px"></div>
	<table class="table" align="center" width="600" border="0"
		cellspacing="0" style="clear: right;" class="table table-hover">
		<tr align="center" >
			<th align="center">번호</th>
			<th align="center" width="300">제목</th>
			<th align="center">글쓴이</th>
			<th align="center">등록일</th>
		</tr>
		<c:forEach items="${bList }" var="board">
			<tr>
				<td align="center" >${board.bNo }</td>

				<td align="center">
				<c:url var="boardDetail" value="boardDetail.ptsd">
						<c:param name="bNo" value="${board.bNo }" />
					</c:url> <a href="${boardDetail }" class="table">${board.bTitle }</a>
					<!--게시판 제목 옆에 댓글 수 보여주기 -->
					<%-- <c:if test="${board.recnt > 0}"> --%>
					<%-- <span style="color: red;">(${board.recnt})</span> --%>
					<%-- </c:if> --%>
				</td>

				<td align="center" >${board.userId }</td>

				<td align="center" >${board.bCreateDate }</td>
			</tr>
		</c:forEach>
		<!--로그인 유무시 보이는 화면 -->
		<tr>
			<td align="center" colspan="5">
			<br>
				<!-- 글쓰기 로그인후 보이는 화면--> <c:if test="${loginUser eq null }">
					<a href="login.ptsd"  class="btn btn-success">글쓰기</a>
						<br>
				</c:if> <!-- 글쓰기 비로그인 보이는 화면 --> <c:if test="${loginUser.userId ne null }">
					<a href="boardWrite.ptsd"  class="btn btn-success">글쓰기</a>
						<br>
				</c:if>
				<br>
			</td>
		</tr>
		<!-- 페이징 -->
		<br>
		<tr class="container" align="center" height="20">
			<td colspan="6"><c:url var="before" value="boardList.ptsd">
					<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
				</c:url> <c:if test="${pi.currentPage <= 1 }">
					[이전]
				</c:if> <c:if test="${pi.currentPage > 1 }">
					<a href="${before }">[이전]</a>
				</c:if> <c:forEach var="p" begin="${pi.startNavi }" end="${pi.endNavi }">
					<c:url var="pagination" value="boardList.ptsd">
						<c:param name="page" value="${p + 1 }"></c:param>
					</c:url>
					<c:if test="${p eq pi.currentPage }">
						<font color="black" size="4">[${p  }]</font>
					</c:if>
					<c:if test="${p ne pi.currentPage }">
						<a href="${pagination }" style="color:black;">${p +1}</a>&nbsp;
					</c:if>
				</c:forEach> <c:url var="after" value="boardList.ptsd">
					<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
				</c:url> <c:if test="${pi.currentPage >= pi.maxPage }">
					[다음]
				</c:if> <c:if test="${pi.currentPage < pi.maxPage }">
					<a href="${after }">[다음]</a>
				</c:if></td>
		</tr>
	</table>
	<!-- 검색 -->
	<br>
	<div align="center">
		<form action="boardSearch.ptsd" method="get"
			style="text-decoration: none; text-shadow: 0 0 24px; color: pink;">
			<select name="searchCondition">
				<option value="all"
					<c:if test="${search.searchCondition == 'all' }">selected</c:if>>전체</option>
				<option value="writer"
					<c:if test="${search.searchCondition == 'writer' }">selected</c:if>>작성자</option>
				<option value="title"
					<c:if test="${search.searchCondition == 'title' }">selected</c:if>>제목</option>
				<option value="contents"
					<c:if test="${search.searchCondition == 'contents' }">selected</c:if>>내용</option>
			</select> 
			<input type="hidden" name="page" value="1"> 
			<input type="text" name="searchValue" value="${search.searchValue }"placeholder="검색하시겠습니까?"> 
			<input type="submit" value="검색" >
		</form>
	</div>
	<!-- 푸터 -->
	<footer>
		<jsp:include page="../../../resources/html/footer.html" />
	</footer>
</body>
</html>
