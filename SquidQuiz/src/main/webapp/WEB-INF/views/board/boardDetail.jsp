<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글쓰기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="/static/css/bootsrap.min.css">
<script language="javascript" src="/ckeditor/ckeditor.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
<script src="/resources/js/serviceWorker.min.js"></script>
<script src="/resources/js/push.min.js"></script>
<!-- 최신부트스트랩 -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>





	<style>
		.ck-editor_editable{
			min-height:300px;
		}
		
		
		


	</style>
</head>
<body>
<jsp:include page="../../../resources/html/header.jsp"/>
<br style="clear:both">
		<h1 align="center">${board.userId } 님의 게시글</h1>
		<br><br>
			<input type="hidden" id="boardNo" value="${board.bNo }" id="bNo">
			<table align="center" width="600" border="1" cellspacing="1">
				<tr>
					<td align="center">제목</td>
					<td align="center">${board.bTitle }</td>
					<input type ="hidden"id="boardTitle" value="${board.bTitle }">
				</tr>
				<tr>
					<td align="center">글쓴이</td>
					<td align="center" >${board.userId }</td>
					<input type = "hidden"id="Writer" value="${board.userId }">
				</tr>
				<tr>
					<td align="center">작성날짜</td>
					<td align="center" id="boardReportDate">${board.bCreateDate }</td>
				</tr>
					<td align="center" >내용</td>
					<td align="center" id="bContents">${board.bContents }</td>
					<input type="hidden" id="bFileName" value="${board.bFileName }" id="bNo">
				</tr>
				<tr>
					<td colspan="2" align="center" >
						<c:url var="bModify" value="boardModify.ptsd">
							<c:param name="bNo" value="${board.bNo }"></c:param>
						</c:url>
						<c:url var="bDelete" value="boardDelete.ptsd">
							<c:param name="bNo" value="${board.bNo }"></c:param>
							<c:param name="fileName" value="${board.bFileRename }"></c:param>
						</c:url>
					
						<!--작성자만볼수있는 항목-->
						<c:if test ="${loginUser.userId eq board.userId }">
			            	<a class="btn btn-primary" href="${bModify }"  style>수정</a>
			            	<a class="btn btn-primary" href="${bDelete }">삭제</a>
			    		</c:if>
    					<!-- 다볼수있는 항목. -->
    						<a class="btn btn-primary" href="#" onclick="boardReport(${board.bNo });">신고</a>
    						<a class="btn btn-primary" href="boardList.ptsd">목록</a>
					</td>
				</tr>					
			</table>
			<br>
				<!-- 댓글 등록 -->
				<table align="center" width="600" border="0" cellspacing="1">
					<tr>
						<td>
							<textarea rows="5" cols="55" id="rContents" ></textarea>
						</td>
						<td><button id="rSubmit" class="btn btn-primary">댓글작성</button>
					</tr>
				</table>
				
				<!-- 댓글 목록 -->
				<table align="center" width="600" border="1" id="rtb">
				<thead >
					<tr >
						<!-- 댓글 갯수 -->
						<td colspan="5" ><b id="rCount"  style="color:red; background-color:pink;"></b></td>
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
//  				CKEDITOR.replace('bContents', {
//  					width : '100%',
// 					height : '400px',
//  					filebrowserImageUploadUrl : "${path}/boardck.ptsd"
//  				});
<!--  			</script> -->
 			<script>
 				getReplyList();
 				
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
									alert("댓글을작성하셨습니다.");
									Push.create("댓글", {
									    body: "댓글을 작성했습니다.",
									    icon: 'https://t1.daumcdn.net/cfile/tistory/99AF0E4B5A7C524F02',
									    timeout: 400000,
									    onClick: function () {
									        window.focus();
									        this.close();
									    }
									});   

								//댓글 불러오기
								getReplyList();
								//작성후 내용 초기화  
								$("#rContents").val("");
								}else {
									alert("댓글 등록 실패");
								}
							},
							error : function() {
								alert("댓글을 작성하려면 로그인 해주세요");
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
							$userId = $("<td width='100'align='center'>").text(data[i].userId);
							$rContent = $("<td>").text(data[i].replyContents);
							$rCreateDate =$("<td width='100'>").text(data[i].rCreateDate);
							$btnArea = $("<td width='80' align='center'>")
							.append("<a href='#' onclick='modifyReply(this,"+bNo+","+data[i].replyNo+",\""+data[i].replyContents+"\");'>수정</a>")
							.append("<a href='#' onclick='removeReply("+bNo+","+data[i].replyNo+")'>삭제</a>")
							$btnAreb = $("<td colspan='4' align='center'>").append("<a href='#' onclick='reportReply("+bNo+","+data[i].replyNo+",\""+data[i].replyContents+"\");'>신고</a>");
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
						}
					}); 
				}
					
				
				
				
				//댓글 수정
					function modifyReply(obj,bNo, replyNo, replyContents) {
						$trModify = $("<tr>");
						$trModify.append("<td colspan='3'><input type='text' id='modifyReply' size='65' value='"+replyContents+"'></td>");
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
									alert("수정되었습니다");
									getReplyList();
								}else {
									alert("로그인후 이용해주세요.");
								}
							},
							error : function() {
								alert("로그인후 이용해주세요.");
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
									alert("삭제되었습니다");
								}else {
									alert("로그인후 이용해주세요.");
								}
							}
									,error : function() {
										alert("로그인후 이용해주세요.");
								}
							});
						}
						//게시글 신고
						function boardReport(bNo) {
							
							var writer = $("#Writer").val();
							var title = $("#boardTitle").val();
							console.log(writer);
							$.ajax({
								url : "boardReport.ptsd",//action
								type : "get", //method   
								data : {"bNo" : bNo, "writer" : writer, "title" : title}, //값
								success : function(data) {
									if(data == "success") {
										alert("신고되었습니다");
									}else {
										alert("이미 신고되셨습니다.");
									}
									
								},error : function() {
									alert("로그인후 이용해주세요.");
								}
							});
						}
							
							//댓글 신고
							function reportReply(bNo,replyNo,contents) {
								$.ajax({
									url : "replyreport.ptsd",
									type : "get",
									data : {"bNo" : bNo, "replyNo" : replyNo, "contents" : contents},
									success : function(data) {
										if(data == "success") {
											alert("신고되었습니다");
										}else {
											alert("로그인후 이용해주세요.");
										}
									}
										,error : function() {
											alert("로그인후 이용해주세요.");
									}
								});
							}
							
							
// 							// 댓글 목록 페이징 함수
// 							function getRepliesPaging(page) {

// 							    $.getJSON("/replies/" + articleNo + "/" + page, function (data) {
// 							        console.log(data);

// 							        var str = "";

// 							        $(data.replies).each(function () {
// 							            str += "<li data-replyNo='" + this.replyNo + "' class='replyLi'>"
// 							                +  "<p class='replyText'>" + this.replyText + "</p>"
// 							                +  "<p class='replyWriter'>" + this.replyWriter + "</p>"
// 							                +  "<button type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>"
// 							                +  "</li>"
// 							                +  "<hr/>";
// 							        });

// 							        $("#replies").html(str);

// 							        // 페이지 번호 출력 호출
// 							        printPageNumbers(data.pageMaker);

// 							    });

// 							}

// 							// 댓글 목록 페이지 번호 출력 함수
// 							function printPageNumbers(pageMaker) {

// 							    var str = "";

// 							    // 이전 버튼 활성화
// 							    if (pageMaker.prev) {
// 							        str += "<li><a href='"+(pageMaker.startPage-1)+"'>이전</a></li>";
// 							    }

// 							    // 페이지 번호
// 							    for (var i = pageMaker.startPage, 
// 							    		len = pageMaker.endPage; i <= len; i++) {
// 							        var strCalss = pageMaker.criteria.page == i ? 'class=active' : '';
// 							        str += "<li "+strCalss+"><a href='"+i+"'>"+i+"</a></li>";
// 							    }

// 							    // 다음 버튼 활성화
// 							    if (pageMaker.next) {
// 							        str += "<li><a href='"+(pageMaker.endPage + 1)+"'>다음</a></li>";
// 							    }

// 							    $(".pagination-sm").html(str);
// 							}
					
// 							// 목록페이지 번호 변수 선언, 1로 초기화(첫번째 페이지)
// 							var replyPageNum = 1;

// 							// 목록페이지 번호 클릭 이벤트
// 							$(".pagination").on("click", "li a", function (event) {

// 							    event.preventDefault();
// 							    replyPageNum = $(this).attr("href"); // 목록 페이지 번호 추출
// 							    getRepliesPaging(replyPageNum); // 목록 페이지 호출

// 							});

// function commentList(board_id, pageNum) {
//         $.ajax({
//            url : '/commentlist',
//            type : 'POST',
//            data : {
//               'board_id' : board_id,
//               'page' : pageNum
//           },
//            dataType:"json",
//            success : function(data) {
//               var a = '';
//               var page = data.page;
//               var startpage = data.startpage;
//               var endpage = data.endpage;
//               var boardList = data.boardList;

//               $.each(boardList, function(key, value) {
//                  console.log("data : " + boardList);
//                  console.log(boardList);
//                  console.log(page + "," + startpage + "," + endpage);
//                  console.log("start : " + startpage);
//                  console.log("end : " + endpage);
//                  a += '<div class="commentArea" style="boarder-bottom:1px solid darkgray; margin-bottom: 15px;">';
//                  a += '<div class="commentInfo'+value.board_re_id+'">'+'댓글번호 : '+value.board_re_id+' / 작성자 : '+value.mem_id;
//                  a += '<a onclick="commentUpdate('+value.board_re_id+',\''+value.board_re_content+'\');"> 수정 </a>';
//                  a += '<a onclick="commentDelete('+value.board_re_id+');"> 삭제 </a> </div>';
//                  a += '<div class="commentContent'+value.board_re_id+'"> <p> 내용 : '+value.board_re_content +'</p>';
//                  a += '</div></div>';
//               });
              
//               for (var num=startpage; num<=endpage; num++) {
//                  if (num == page) {
//                       a += '<a href="#" onclick="commentList(' + board_id + ', ' + num + '); return false;" class="page-btn">' + num + '</a>';
//                  } else {
//                       a += '<a href="#" onclick="commentList(' + board_id + ', ' + num + '); return false;" class="page-btn">' + num + '</a>';
//                  }
//               }
//             $('.commentList').html(a);
//          }
//       });
//    }


		</script>	
</body>
</html>