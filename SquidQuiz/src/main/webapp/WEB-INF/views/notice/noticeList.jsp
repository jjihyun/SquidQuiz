<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 list test </title>
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
<script>
	$(document).ready(function(){
		$('#headerMain').load("/resources/html/header.jsp");
	});

</script>
<body>
	<br><br>
	
	<br style="clear:both">
	<main id="main">
	<h1 align="center" style="font-size:44px">공지사항</h1><br><br><br><br><br>
	<div class="container">
		<table class="table" align ="center" width="800">
		  <thead>
			    <tr align="center">
			      <th align="center">번호</th>
			      <th align="center" colspan="2" width="200px">제목</th> 
			      <th align="center"> 작성자</th>
			      <th align="center">게시일</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<c:if test="${empty nList }">
					<tr>
						<td colspan="5" align="center">조회된 정보가 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not empty nList }">
					<c:forEach items="${nList }" var="notice" varStatus="">
						<tr>
							<td align="center">${notice.noticeNo }</td>
							<td colspan="2" align="center">
								<c:url var="nDetail" value="noticeDetail.ptsd">
									<c:param name="noticeNo" value = "${notice.noticeNo }"></c:param>
								</c:url>
								<a id="title-a" href="${nDetail }">
									${notice.noticeTitle }
								</a>
							</td>
							<td align="center">관리자</td>
							<td align="center">${notice.noticeDate }</td>
						</tr>
					</c:forEach>
				</c:if>
			    <tr>
			    	<c:if test="true">
			      <td colspan="5" align="right">
			      	<div><button class="btn btn-primary" onclick="location.href='noticeWriteView.ptsd'">글쓰기</button></div>
			      </td>
			      </c:if>
			    </tr>
		  </tbody>
		</table>
	</div>
	</main>
	
</body>
</html>