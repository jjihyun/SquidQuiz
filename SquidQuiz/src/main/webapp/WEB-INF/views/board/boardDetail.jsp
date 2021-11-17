<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글쓰기</title>
<jsp:include page="../../../resources/html/header.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="/static/css/bootsrap.min.css">
<script language="javascript" src="/ckeditor/ckeditor.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
	<style>
		.ck-editor_editable{
			min-height:300px;
		}
		
		
	</style>
</head>
<body>
<br style="clear:both">
	<script>
				//댓글 작성
				$(function() {
					$("#rSubmit").on("click",function(){
						var bNo = '${board.bNo}';
						var rContents = $("#rContents").val();
						$.ajax({
							url : "addReply.ptsd",
							type : "post",
							data : {
								"bNo" : bNo,
								"replyContents" : rContents
							},
							success : function(data) {
								if(data == "success"){
								//댓글 불러오기
								getReplyList();
								//작성후 내용 초기화  
								$("#rContents").val("");
								}else {
									alert("댓글 등록 실패");
								}
							},
							error : function() {
								alert("AJAX 통신 오류");
							},
							complete : function() {
								
							}
						});
					  });
					});
					//댓글 목록
					function getReplyList() {
							var bNo = '${board.bNo}';
							$.ajax({
								url : "replyList.ptsd",
								type : "get",
								data : {"bNo" : bNo	},
								dataType : "json",
								success : function(data) {
									var $tableBody = $("#rtb tbody");
									$tableBody.html("");
									var $tr;						
									var $userId;
									var $rContent;
									var $rCreateDate;
									var $btnArea;
					
					//댓글 갯수 
					$("#rCount").text("댓글("+ data.length +")");
					if(data.length > 0) {
						for(var i in data) {
							$tr = $("<tr id='modifyTr'>");
							$userId = $("<td width='100'>").text(data[i].replyuserId);
							$rContent = $("<td>").text(data[i].replyContents);
							$rCreateDate =$("<td width='100'>").text(data[i].rCreateDate);
							$btnArea = $("<td width='80'>")
							.append("<a href='#' onclick='modifyReply(this,"+bNo+","+data[i].replyNo+",\""+data[i].replyContents+"\");'>수정</a>")
							.append("<a href='#' onclick='removeReply("+bNo+","+data[i].replyNo+")'>삭제</a>")
							$btnAreb = $("<td colspan='4' align='right'>").append("<a href='#' onclick='reportReply(this,"+postNo+","+data[i].replyAllNo+",""+data[i].replyContents+"");'>신고</a>");
							$tr.append($userId);
							$tr.append($rContent);
							$tr.append($rCreateDate);
							$tr.append($btnArea);
							$tr.append($btnAreb);
							$tableBody.append($tr);
									
								}
							}
						},
						error : function() {
							alert("AJAX 통신 오류");
						}
					}); 
				}
					//댓글 수정
					function modifyReply(obj,bNo, replyNo, replyContents) {
						$trModify = $("<tr>");
						$trModify.append("<td colspan='3'><input type='text' id='modifyReply' size='50' value='"+replyContents+"'></td>");
						$trModify.append("<td><button onclick='modifyReplyCommit("+bNo+","+replyNo+")'>수정완료</button></td>");
						$(obj).parent().parent().after($trModify);
					}
					
					//댓글 수정저장
					function modifyReplyCommit(bNo,replyNo) {
						var modifiedContent = $("#modifyReply").val();
						$.ajax({
							url : "modifyReply.ptsd",
							type : "post",
							data : {"bNo" : bNo, "replyNo" : replyNo, "replyContents" : modifiedContent},
							success : function(data) {
								if(data == "success") {
									getReplyList();
								}else {
									alert("댓글 수정 실패");
								}
							},
							error : function() {
								alert("Ajax 통신 실패");
							} 
						});
					}
						
					//댓글삭제
					function removeReply(bNo, replyNo) {
						$.ajax({
							url : "deleteReply.ptsd",
							type : "get",
							data : {"bNo" : bNo, "replyNo" : replyNo},
							success : function(data) {
								if(data == "success") {
									getReplyList();
									
								}else {
									alert("댓글 삭제 실패");
								}
								
							}
						});
					}

		</script>	
		
		<h1 align="center">${board.userId } 님의 게시글</h1>
			<input type="hidden" value="${board.bNo }" id="bNo">
			<table align="center" width="600" border="1" >
				<tr>
					<td align="center">제목</td>
					<td align="center">${board.bTitle }</td>
				</tr>
				<tr>
					<td align="center">작성자</td>
					<td align="center">${board.userId }</td>
				</tr>
				<tr>
					<td align="center">작성날짜</td>
					<td align="center">${board.bCreateDate }</td>
				</tr>
					<td align="center" >내용</td>
					<td align="center" id="bContents">${board.bContents }</td>
				</tr>
				<tr>
					<td align="center">첨부파일</td>
					<td>
						${board.bFileName }
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<c:url var="bModify" value="boardModify.ptsd">
							<c:param name="bNo" value="${board.bNo }"></c:param>
						</c:url>
						<c:url var="bDelete" value="boardDelete.ptsd">
							<c:param name="bNo" value="${board.bNo }"></c:param>
							<c:param name="fileName" value="${board.bFileRename }"></c:param>
						</c:url>
					
						<!--로그인한 사용자가 볼수있는 항목-->
						<c:if test ="${loginUser.userId eq board.userId }">
			            	<a href="${bModify }">수정</a>
			            	<a href="${bDelete }">삭제</a>
<!-- 			            	<a 신고></a> -->
			    		</c:if>
    					<!-- 글목록은 본인이 아니어도 확인 가능하게 한다. -->
    					<a href="boardList.ptsd">목록</a>
					</td>
				</tr>					
			</table>
			<!-- 댓글 등록 -->
		<table align="center" width="500" border="1">
			<tr>
				<td>
					<textarea rows="3" cols="55" id="rContents" ></textarea>
				</td>
				<td><button id="rSubmit">등록하기</button>
			</tr>
		</table>
		
		<!-- 댓글 목록 -->
		<table align="center" width="500" border="1" id="rtb">
			<thead>
				<tr>
					<!-- 댓글 갯수 -->
					<td colspan="4"><b id="rCount"></b></td>
				</tr>
			</thead>
			<tbody>
			</tbody>
<!-- 		<script language="javascript">
// 			var tmpStr="${board.bContents}"
// 			tmpStr=tmpStr.replaceAll("&lt;","<");
// 			tmpStr=tmpStr.replaceAll("&gt;",">");
// 			tmpStr=tmpStr.replaceAll("&amp;lt;","<");
// 			tmpStr=tmpStr.replaceAll("&amp;gt;",">");
// 			tmpStr=tmpStr.replaceAll("&amp;nbsp;"," ");
// 			tmpStr=tmpStr.replaceAll("&amp;amp;","&");
// 			document.getElementById('bContents').innerHTML=tmpStr;-->
<!--   			<script>  
// 				CKEDITOR.replace('bContents', {
// 					width : '100%',
// 					height : '400px',
// 					filebrowserImageUploadUrl : "${path}/boardck.ptsd"
// 				});
 			</script-->
</body>
</html>