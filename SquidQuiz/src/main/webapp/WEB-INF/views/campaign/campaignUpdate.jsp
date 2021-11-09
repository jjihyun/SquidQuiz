<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠페인 수정 페이지</title>
</head>
<body>
	<jsp:include page="../../../resources/html/header.jsp"/>
	<br><br><h2 align="center">후원 글 수정</h2>
	<form action="campaignUpdate.ptsd" method="post" enctype="multipart/form-data">	
		<input type="hidden" name="campaignNo" value="${campaign.campaignNo }">
		<input type="hidden" name="cFileName" value="${campaign.cFileName }">
		<input type="hidden" name="cFileRename" value="${campaign.cFileRename }">
		
		<table align="center">
			<tr>
				<td colspan="2">제목<br>
				<input type="text" size="50" name="campaignTitle" style="font-size: 20px;" value="${campaign.campaignTitle }"></td>
			</tr>
			<tr>
				<td colspan="2">모금 소개글<br>
				<textarea rows="7" cols="50" name="campaignContents" style="font-size: 20px;">${campaign.campaignContents }</textarea></td>
			</tr>
			<tr>
				<td><h4>목표금액</h4><br>${campaign.cTargetAmount }</td>
				<td><h4>첨부사진</h4><br><input type="file" name="updateFile">${campaign.cFileName }</td>
			</tr>
			<tr>
				<td><h4>모금 종료일</h4><br>${formatDate }</td>
				<td><h4>모금단체</h4><br><input type="text" size="15" name="campaignName" style="font-size: 20px;" value="${campaign.campaignName }"></td>
			</tr>
			<tr>
				<td><h4>모금 카테고리</h4>
					<select name="campaignOption">
						<option value="child">아동</option>
						<option value="old">어르신</option>
						<option value="obstacle">장애인</option>
						<option value="environment">환경</option>
						<option value="multicultural">다문화가정</option>	
						<option value="facility">시설</option>
						<option value="school">학교</option>
					</select>
				</td>
				<td><h4>링크</h4><input type="text" size="15" name="cLink" style="font-size: 20px;" value="${campaign.cLink }"></td>
			</tr>
			<tr>
				<td><input type="submit" value="등록">
				&nbsp;&nbsp;&nbsp;<button>취소</button></td>
			</tr>
		</table>
	</form>
	
	<script type="text/javascript">
		$(function(){
			$("select[name=campaignOption]").change(function(){
				var option = $(this).val();
				//alert(option);
				option.prop("selected", true);
			});
		});
	</script>
</body>
</html>