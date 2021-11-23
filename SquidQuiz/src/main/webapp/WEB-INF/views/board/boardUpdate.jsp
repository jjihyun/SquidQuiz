<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 수정</title>
<jsp:include page="../../../resources/html/header.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="/static/css/bootsrap.min.css">
<script language="javascript" src="/ckeditor/ckeditor.js"></script>
<script src="/resources/ckeditor/ckeditor.js"></script>
<!-- 최신부트스트랩 -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<link href="/resources/css/footer.css" rel="stylesheet" />
 <script>

	$('a').click(function(event){
    event.preventDefault(); 
	});

	</script>
    
    <style>
    .btn-3d {
	position: relative;
	display: inline-block;
	font-size: 18px;
	padding: 20px 20px;
	color: white;
	margin: 10px 10px 10px;
	border-radius: 6px;
	text-align: center;
	transition: top .01s linear;
	text-shadow: 0 1px 0 rgba(0,0,0,0.15);
	outline:0;
	border:0;
}
.btn-3d.red:hover    {background-color: #e74c3c;}
.btn-3d.blue:hover   {background-color: #699DD1;}
.btn-3d.green:hover  {background-color: #80C49D;}
.btn-3d.purple:hover {background-color: #D19ECB;}
.btn-3d.yellow:hover {background-color: #F0D264;}
.btn-3d.cyan:hover   {background-color: #82D1E3;}

.btn-3d:active {
	top: 9px;
}
.color {
	width: 350px;
	margin: 0 auto;
}
.color li {
	margin: 0 15px 0 0;
	width: 30px;
	height: 30px;
	display: inline-block;
	border-radius: 100%;
}
    
    .content-3d {
  margin: 40px auto;
}
    
    .content-3d {
	  width: 50%;
	  max-width: 300px;
	}
    .btn-3d.red {
	background-color: #e74c3c;
	box-shadow: 0 0 0 1px #c63702 inset,
        0 0 0 2px rgba(255,255,255,0.15) inset,
        0 8px 0 0 #C24032,
        0 8px 0 1px rgba(0,0,0,0.4),
				0 8px 8px 1px rgba(0,0,0,0.5);
	}
	.btn-3d.red:active {
	box-shadow: 0 0 0 1px #c63702 inset,
				0 0 0 2px rgba(255,255,255,0.15) inset,
				0 0 0 1px rgba(0,0,0,0.4);
	}
	.color .red    {background: #fa5a5a;}
	
	.btn-3d.yellow {
	background-color: #F0D264;
	box-shadow: 0 0 0 1px #F0D264 inset,
				0 0 0 2px rgba(255,255,255,0.15) inset,
				0 8px 0 0 rgba(196, 172, 83, .7),
				0 8px 0 1px rgba(0,0,0,.4),
				0 8px 8px 1px rgba(0,0,0,0.5);
}
.btn-3d.yellow:active {
	box-shadow: 0 0 0 1px #F0D264 inset,
				0 0 0 2px rgba(255,255,255,0.15) inset,
				0 0 0 1px rgba(0,0,0,0.4);
}
	
	.btn-3d.green {
	background-color: #82c8a0;
	box-shadow: 0 0 0 1px #82c8a0 inset,
				0 0 0 2px rgba(255,255,255,0.15) inset,
				0 8px 0 0 rgba(126, 194, 155, .7),
				0 8px 0 1px rgba(0,0,0,.4),
				0 8px 8px 1px rgba(0,0,0,0.5);
}
.btn-3d.green:active {
	box-shadow: 0 0 0 1px #82c8a0 inset,
				0 0 0 2px rgba(255,255,255,0.15) inset,
				0 0 0 1px rgba(0,0,0,0.4);
}
.btn-3d.blue {
	background-color: #6DA2D9;
	box-shadow: 0 0 0 1px #6698cb inset,
				0 0 0 2px rgba(255,255,255,0.15) inset,
				0 8px 0 0 rgba(110, 164, 219, .7),
				0 8px 0 1px rgba(0,0,0,.4),
				0 8px 8px 1px rgba(0,0,0,0.5);
}
.btn-3d.blue:active {
	box-shadow: 0 0 0 1px #6191C2 inset,
				0 0 0 2px rgba(255,255,255,0.15) inset,
				0 0 0 1px rgba(0,0,0,0.4);
}
    </style>

</head>
<body>
	<!-- 헤더 -->
	<jsp:include page="../../../resources/html/header.jsp" />
	<br style="clear: both">
	<br>
	<br>
	<br>
	<br>
	<h1 align="center">게시글 수정</h1>
	<br>
	<br>
	<div style="color: pink; align: center;">
		<form action="boardUpdate.ptsd" method="post"
			enctype="multipart/form-data" align="center">
			<input type="hidden" name="bNo" value="${board.bNo }"> 
			<input type="hidden" name="bFileName" value="${board.bFileName }">
			<input type="hidden" name="bFileRename" value="${board.bFileRename }">
			<div>
				<div style="float:left; margin-left:310px; margin-right:10px; ">
					<label for="title">제목</label> 
					<input type="text" name="bTitle" value="${board.bTitle }">
				</div>
				<div style="float:left;">
					<label for="title">글쓴이</label> 
					<input type="text" name="userId" value="${board.userId }" readonly>
				</div>
				<div>
				<label></label>
				</div>
				<br>
				<div></div>
				<div align="center">
					<textarea name="bContents" id="bContents">${board.bContents }</textarea>
				</div>
				<tr>
					<th></th>
                <%--<td><input type="hidden" name="reloadFile">${board.bFileName }</td> --%>
				</tr>
				<div>
					<input type="submit" value="수정" href='boardDetail.ptsd${board.bNo }' " class="btn-3d green">
					<input type="button" value=" 취소" onclick="history.back(-1);" class="btn-3d red">
				</div>
		</form>
	</div>
	<!-- 푸터 -->
	<footer>
		<jsp:include page="../../../resources/html/footer.html" />
	</footer>
	<script>
		CKEDITOR.replace('bContents', {
			width : '60%',
			align : 'center',
			height : '400px',
			filebrowserImageUploadUrl : "${path}/boardck.ptsd"
		});
	</script>
</body>
</html>
