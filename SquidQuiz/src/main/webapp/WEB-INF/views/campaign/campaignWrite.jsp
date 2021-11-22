<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠페인 후원글 작성 페이지</title>
<style>
	.font-b{ color:#4B4B4B;}
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
	<br><br><hr><br><h2 align="center" style="color:rgb(180, 80, 80);">캠페인 등록</h2><br>
	<form action="campaignInsert.ptsd" method="post" enctype="multipart/form-data">	
		<table align="center">
			<tr>
				<td colspan="2"><b class="font-b">캠페인 제목</b><br><br>
				<input type="text" size="67" name="campaignTitle" style="font-size: 20px;"></td>
			</tr>
			<tr>
				<td colspan="2"><br><b class="font-b">캠페인 소개글</b><br><br>
				<textarea id="contexts" rows="18" cols="90" wrap="hard" name="campaignContents" style="font-size: 16px; resize: none;"></textarea></td>
			</tr>
			<tr>
				<td align="center" style="width: 50%;"><br><b class="font-b">목표금액</b><br><br><input type="text" size="17" name="cTargetAmount" style="font-size: 16px;"></td>
				<td align="center" style="width: 50%;"><br><b class="font-b">첨부사진</b><br><br>
					<input type="file" name="cFileName_2" style="padding-left: 60px;" required>
				</td>
			</tr>
			<tr>
				<td align="center"><br><b class="font-b">모금 종료일</b><br><br><input type="date" size="17" name="cEndDate2" style="font-size: 16px;"></td>
				<td align="center"><br><b class="font-b">후원단체 이름</b><br><br><input type="text" size="25" name="campaignName" style="font-size: 16px;"></td>
			</tr>
			<tr>
				<td align="center"><br><b class="font-b">캠페인 카테고리</b><br><br>
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
				<td align="center"><br><b class="font-b">링크</b><br><br><input type="text" size="25" name="cLink" style="font-size: 16px;"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" height="200px"><input class="btn" type="submit" value="등록">
				<!-- &nbsp;&nbsp;&nbsp;<button class="btn">취소</button></td> -->
			</tr>
		</table>
	</form>
	<footer>
		<jsp:include page="../../../resources/html/footer.html"/>
	</footer>
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