<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠페인 수정 페이지</title>
<style>
	b{ color:#4B4B4B;}
	.btn{
		border:none; font-size: 18px; width: 170px; height: 40px; cursor: pointer;
		background-color:rgb(180, 80, 80); color:white;
	}
	select {
	  width: 150px; height: 35px;
	  background: url('https://freepikpsd.com/media/2019/10/down-arrow-icon-png-7-Transparent-Images.png') calc(100% - 5px) center no-repeat;
	  background-size: 20px; padding: 5px 30px 5px 10px;
	  border-radius: 4px; outline: 0 none;
	}
	select option {
	  background:rgb(180, 80, 80); color: #fff; padding: 3px 0;
	}
</style>
</head>
<body>
	<jsp:include page="../../../resources/html/header.jsp"/>
	<br><br><hr><br><h2 align="center" style="color:rgb(180, 80, 80);">캠페인 수정</h2>
	<form action="campaignUpdate.ptsd" method="post" enctype="multipart/form-data">	
		<input type="hidden" name="campaignNo" value="${campaign.campaignNo }">
		<input type="hidden" name="cFileName" value="${campaign.cFileName }">
		<input type="hidden" name="cFileRename" value="${campaign.cFileRename }">
		
		<table align="center">
			<tr>
				<td colspan="2"><b>캠페인 제목</b><br><br>
				<input type="text" size="50" name="campaignTitle" style="font-size: 20px;" value="${campaign.campaignTitle }"></td>
			</tr>
			<tr>
				<td colspan="2">모금 소개글<br>
				<textarea id="contexts" rows="20" cols="69" wrap="hard" name="campaignContents" style="font-size: 16px; resize: none;" name="campaignContents" style="font-size: 20px;">${campaign.campaignContents }</textarea></td>
			</tr>
			<tr>
				<td align="center"><br><b>목표금액</b><br><br>${campaign.cTargetAmount }</td>
				<td align="center"><br><b>첨부사진</b><br><br><input type="file" name="updateFile" style="padding-left: 60px;" ></td>
			</tr>
			<tr>
				<td align="center"><br><b>모금 종료일</b><br><br>${formatDate }</td>
				<td align="center"><br><b>후원단체 이름</b><br><br><input type="text" size="25" name="campaignName" style="font-size: 16px;" value="${campaign.campaignName }"></td>
			</tr>
			<tr>
				<td align="center"><br><b>캠페인 카테고리</b><br><br>
					<select name="campaignOption">
						<option value="child" <c:if test="${campaign.campaignType eq 'child'}">selected</c:if>>아동</option>
						<option value="old" <c:if test="${campaign.campaignType eq 'old'}">selected</c:if>>어르신</option>
						<option value="handicap" <c:if test="${campaign.campaignType eq 'handicap'}">selected</c:if>>장애인</option>
						<option value="environment" <c:if test="${campaign.campaignType eq 'environment'}">selected</c:if>>환경</option>
						<option value="multicultural" <c:if test="${campaign.campaignType eq 'multicultural'}">selected</c:if>>다문화가정</option>	
						<option value="facility" <c:if test="${campaign.campaignType eq 'facility'}">selected</c:if>>시설</option>
						<option value="school" <c:if test="${campaign.campaignType eq 'school'}">selected</c:if>>학교</option>
					</select>
				</td>
				<td align="center"><br><b>링크</b><br><br><input type="text" size="25" name="cLink" style="font-size: 16px;" value="${campaign.cLink }"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" height="200px"><input class="btn" type="submit" value="수정">
				<!-- &nbsp;&nbsp;&nbsp;<button onclick="campaignList.ptsd">취소</button></td> -->
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