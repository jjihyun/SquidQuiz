<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠페인 목록</title>
</head>
<body>
	<h2 align="center">이번주 퀴즈 참가 모음액</h2>
	<div>
		<c:forEach items="${cList }" var="c">
			<div align="center" border="1" width="200" height="300">
				${c.campaignTitle }
				${c.campaignTargetAmount }
			</div>
		</c:forEach>
	</div>
</body>
</html>