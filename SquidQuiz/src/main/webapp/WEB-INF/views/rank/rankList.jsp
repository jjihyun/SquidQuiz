<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>역대 오징어 랭킹</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/app.css">
<script>
$(document).ready(function(){
	$('#headerMain').load("/resources/html/header.jsp");
});
</script>
<style>
	main{
		width: 100%;
		height: 1500px;
	}
	.rank_first{
		width: 100%;
		position: absolute;
		height: 100%;
		left:50%;
		transform: translateX(-50%);
/* 		background-color: pink; */
	}
	.rank_view_1{
		width:1000px;
		height: 100%;
		position:absolute;
		left:50%;
		transform: translateX(-50%);
	}
	.rank_view_2{
		width: 650px;
		height: 200px;
		margin-left: 180px;
	}
	.rank_view_3{
		width: 100%;
		height: 200px;
	}
	.search{
		width: 250px;
		height: 40px;
		margin-left: 750px;
	}
</style>
</head>
<body>
<div id="headerMain"></div>
<br>
	<main>
		<div class="rank_first">
			<div class="rank_view_1">
			<br><br><br><br><br><br>
				<center><h1 style="font-weight: bold;">역대오징어</h1></center>
				<div class="rank_view_2">
					<div class="text_area" style="position: absolute; margin-top: 100px; width: 200px; height: auto; background: ;">
						<h2 style="float: left">${mgi[0].turnNo }</h2>
						<h2 style="float: left; color: #ff4570;">회</h2>
						<h2 style="float: left;">차</h2>
						<h2 style="float: left; color: #ff4570;">오</h2>
						<h2 style="float: left;">징</h2>
						<h2 style="color: #ff4570;">어</h2>
					</div>
					<div class="text_area2" style="position: absolute; margin-top: 20px; margin-left:230px; width: 180px; height: auto; background: ;">
						<img alt="오징어왕관" src="/resources/img/squidking.png" style="width: 100px; height: 80px; margin-left: 40px;">
						<center><h2 style="background-color: #e2e2e2;">${mgi[0].winnerId }</h2></center>
					</div>
				</div>
				<br><br><br><br><br>
				<form action="mgiSearch.ptsd" method="GET">
					<div class="search">
						<input style="border: none" type="text" name="searchValue" value="${search.searchValue }" placeholder="회차번호를 입력해 주세요.">
						<input class="btn btn-success" type="submit" value="검색">
					</div>
				</form>
				<c:forEach items="${mgi }" var="mgi">
				<div class="rank_view_3">
					<hr>
					<div class="text_area3" style="position: absolute; margin-top: 50px; margin-left:50px; width: 180px; height: auto; background: ;">
						<h2 style="float: left">${mgi.turnNo }</h2>
						<h2 style="float: left; color: #ff4570;">회</h2>
						<h2 style="float: left;">차</h2>
						<h2 style="float: left; color: #ff4570;">오</h2>
						<h2 style="float: left;">징</h2>
						<h2 style="color: #ff4570;">어</h2>
					</div>
					<div class="text_area4" style="position: absolute; margin-top: 50px; margin-left:410px; width: 180px; height: auto; background: ;">
						<center><h2 style="background-color: ;">${mgi.winnerId }</h2></center>
					</div>
					<div class="text_area5" style="position: absolute; margin-top: 15px; margin-left:700px; width: 250px; height: 150px; background: #e2e2e2;">
						<h2 style="margin-top:10px; margin-left:10px; font-size: 1.2em; font-weight: bold;">참가자 수:${mgi.participantTotal}</h2>
						<h2 style="margin-top:20px; margin-left:10px; font-size: 1.2em; font-weight: bold;">모금액:${mgi.moneyReceive }</h2>
						<h2 style="margin-top:20px; margin-left:10px; font-size: 1.2em; font-weight: bold;">상금:${mgi.moneyTotal }</h2>
					</div>
				</div>
				</c:forEach>
				<center><table>
					<tr align="center" height="20">
							<td colspan="6">
								<c:url var="before" value="rankListView.ptsd">
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
									<c:url var="pagination" value="rankListView.ptsd">
										<c:param name="page" value="${p }"></c:param>
									</c:url>
									<c:if test="${p eq pd.currentPage }">
										<font color="red" size="4">[${p }]</font>
									</c:if>
									<c:if test="${p ne pd.currentPage }">
										<a href="${pagination }">${p }</a>&nbsp;
									</c:if>
								</c:forEach>
								<c:url var="after" value="rankListView.ptsd">
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
				</table></center>
			</div>
		</div>
	</main>
	<footer>
		<jsp:include page="../../../resources/html/footer.html"/>
	</footer>
</body>
</html>