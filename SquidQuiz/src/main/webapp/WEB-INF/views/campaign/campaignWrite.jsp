<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠페인 후원글 작성 페이지</title>
</head>
<body>
	<jsp:include page="../../../resources/html/header.jsp"/>
	<br><br><h2 align="center">후원 글 작성</h2>
	<form action="campaignInsert.ptsd" method="post" enctype="multipart/form-data">	
		<table align="center">
			<tr>
				<td colspan="2">제목<br>
				<input type="text" size="50" name="campaignTitle" style="font-size: 20px;"></td>
			</tr>
			<tr>
				<td colspan="2">모금 소개글<br>
				<textarea rows="7" cols="50" name="campaignContents" style="font-size: 20px;"></textarea></td>
			</tr>
			<tr>
				<td><h4>목표금액</h4><br><input type="text" size="15" name="cTargetAmount" style="font-size: 20px;"></td>
				<td><h4>첨부사진</h4><br><input type="file" name="cFileName_2"></td>
			</tr>
			<tr>
				<td><h4>모금 종료일</h4><br><input type="date" size="15" name="cEndDate" style="font-size: 20px;"></td>
				<td><h4>모금단체</h4><br><input type="text" size="15" name="campaignName" style="font-size: 20px;"></td>
			</tr>
			<tr>
				<td><h4>모금 카테고리</h4>
					<select>
						<option name="campaignType" value="child">아동</option>
						<option name="campaignType" value="old">어르신</option>
						<option name="campaignType" value="obstacle">장애인</option>
						<option name="campaignType" value="environment">환경</option>
						<option name="campaignType" value="multicultural">다문화가정</option>	
						<option name="campaignType" value="facility">시설</option>
						<option name="campaignType" value="school">학교</option>
					</select>
				</td>
				<td><h4>링크</h4><input type="text" size="15" name="cLink" style="font-size: 20px;"></td>
			</tr>
			<tr>
				<td><input type="submit" value="등록">
				&nbsp;&nbsp;&nbsp;<button>취소</button></td>
			</tr>
		</table>
	</form>
</body>
</html>