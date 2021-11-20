<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠페인 후원글 작성 페이지</title>
<style>
	.btn{
		border:none;
		font-size: 18px;
		width: 170px; height: 40px; cursor: pointer;
	}
</style>
</head>
<body>
	<jsp:include page="../../../resources/html/header.jsp"/>
	<br><br><hr><br><h2 align="center">| 후원 글 작성 |</h2><br>
	<form action="campaignInsert.ptsd" method="post" enctype="multipart/form-data">	
		<table align="center">
			<tr>
				<td colspan="2"><b>캠페인 제목</b><br><br>
				<input type="text" size="50" name="campaignTitle" style="font-size: 20px;"></td>
			</tr>
			<tr>
				<td colspan="2"><br><b>캠페인 소개글</b><br><br>
				<textarea id="contexts" rows="20" cols="69" wrap="hard" name="campaignContents" style="font-size: 16px; resize: none;"></textarea></td>
			</tr>
			<tr>
				<td align="center"><br><b>목표금액</b><br><br><input type="text" size="15" name="cTargetAmount" style="font-size: 16px;"></td>
				<td align="center"><br><b>첨부사진</b><br><br><input type="file" name="cFileName_2" required></td>
			</tr>
			<tr>
				<td align="center"><br><b>모금 종료일</b><br><br><input type="date" size="15" name="cEndDate2" style="font-size: 16px;"></td>
				<td align="center"><br><b>모금단체</b><br><br><input type="text" size="15" name="campaignName" style="font-size: 16px;"></td>
			</tr>
			<tr>
				<td align="center"><br><b>후원 카테고리</b><br><br>
					<select name="campaignOption">
						<option value="child">아동</option>
						<option value="old">어르신</option>
						<option value="handicap">장애인</option>
						<option value="environment">환경</option>
						<option value="multicultural">다문화가정</option>	
						<option value="facility">시설</option>
						<option value="school">학교</option>
					</select>
				</td>
				<td align="center"><br><b>링크</b><br><br><input type="text" size="20" name="cLink" style="font-size: 16px;"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" height="100px"><input class="btn" type="submit" value="등록">
				<!-- &nbsp;&nbsp;&nbsp;<button class="btn">취소</button></td> -->
			</tr>
		</table>
	</form>
	
	<script type="text/javascript">
		$(function(){
			$("select[name=campaignOption]").change(function(){
				var option = $(this).val();
				option.prop("selected", true);
			});
		});
	</script>
</body>
</html>