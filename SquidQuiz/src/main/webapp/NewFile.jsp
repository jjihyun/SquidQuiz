<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
    src="http://code.jquery.com/jquery-3.4.1.min.js%22%3E</script>
<script
    src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js%22%3E</script>
<script
    src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js%22%3E</script>
<!-- include summernote css/js-->
<link
    href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
    rel="stylesheet">
<script
    src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js%22%3E</script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
<script src="/resources/js/detail.js"></script>
</head>
<body>
		<div>
            <textarea id="summernote" name="content" id="content"></textarea>
            <br><br>
            <input id="subBtn" type="button" value="글 작성"
                onclick="goWrite();" style="position: relative; left: 30%" />
        </div>
</body>
</html>
