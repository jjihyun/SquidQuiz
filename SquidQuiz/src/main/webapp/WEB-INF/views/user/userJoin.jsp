<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="/resources/css/join.css">
<script type="text/javascript" src="resources/js/address.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>

<body>
    <header>
        <a href="main.ptsd"><img class="mainLogo" src="resources/img/메인로고.png" /></a>
    </header>
    <div align="center">
    <form action="join.ptsd" name=join id="checkAll" method="post">
               <div class="form-group">
            <label for="userId">아이디</label><br>
                    <input type="text" id="userId" name="userId" placeholder="아이디입력(4~12자)">
                    <input type="button" id="id-check" name="id-check" value="중복확인"><br>
                    <div class="id-regex"></div>
               </div>
               <div class="form-group">
            <label for="userPwd">비밀번호</label><br>
                    <input type="password" id="userPwd" name="userPwd" placeholder="비밀번호(숫자,영문,특수문자(!,@,#,%,&) 조합) 최소8자"><br>
                    <div class="pw-regex"></div>
            </div>
            <div class="form-group">
            <label for="userRePwd">비밀번호 확인</label><br>
                    <input type="password"  id="userRePwd" name="userRePwd" placeholder="비밀번호 확인"><br>
                    <div class="repw-regex"></div>
            </div>
            <div class="form-group">
            <label for="userName">이름</label><br>
                <input type="text" id="userName" name="userName"><br>
                 <div class="name-regex"></div>
            </div>
            <div class="form-group">
            <label for="userEmail">이메일</label><br>
                <input type="email" id="userEmail" name="userEmail" placeholder="ex) E-mail@gmail.com"><br>
                <div class="email-regex"></div>
            </div>
            <div class="form-group">
            <label for="userPhone">전화번호</label><br>
                <input type="text" id="userPhone" name="userPhone" placeholder="-제외 숫자만 입력해주세요"><br>
                <div class="phone-regex"></div>
            </div>
            <div class="form-postgroup">
            <label for="post">우편번호</label><br>
                <input type="text" id="post" name="post" class="postcodify_postcode5" readonly>
                <button type="button" id="postcodify_search_button" onclick="execPostCode();">검색</button>
            </div><br>
            <div class="form-group">
            <label for="address1">도로명</label><br>
                <input type="text" name="address1" class="postcodify_address" readonly>
            </div>
            <div class="form-group">
            <label for="address2">상세 주소</label><br>
                <input type="text" name="address2" class="postcodify_extra_info">
            </div>
            <div class="form-group">
            <label for="bankName">은행명</label><br>
                <input type="text" id="bankName" name="bankName">
            </div>
            <div class="form-group">
            <label for="bankAccount">계좌번호</label><br>
                <input type="text" id="bankAccount" name="bankAccount">
            </div><br>
            <div class="form-btn" align="center">
                    <input type="submit" id="signupbtn" name="signup" value="회원가입"><br>
                    <a href="login.ptsd"><input type="button" value="로그인"></a>
            </div>	
    </form>
    </div>
    <script type="text/javascript">
    
    
    $(function(){
        // 중복확인 & id 유효성검사             
        $("#id-check").on("click",function(){
            var id = $("#userId").val();
	        if(id == ""){
	        	alert("아이디를 입력해주세요");
	        	return;
	        }
	        
	        var regex = /^[a-zA-Z0-9]{4,12}$/;
	    	var result = regex.test(id);
	        
	    	 if(result){
	             $(".id-regex").html("");
	             // ajax code
	             $.ajax({
	     			url : "checkDupId.ptsd", //이 아이디를
	     			data : {"userId" : id }, 
	     			success : function(result){ //뿌려줌
//	     				console.log(result);
	     			if(result != 0){
	     				alert("사용중인 아이디입니다.");
	     				 $(".id-regex").css("color","red")		
	     			}else{
	     				 $(".id-regex").html("");
	     	             alert("사용가능한 아이디입니다.");
	     			}
	     			},
	     			error : function(){
	     				alert("ajax전송 실패! 관리자에게 문의하세요");
	     			}
	     			/*
	     			complete : function(){
	     			}*/
	     		});
	         }else{
	             $(".id-regex").html("영어 대소문자,숫자 4-12자리");
	             $(".id-regex").css("color","red")
	         }
	        
	        
	    })
            
     
	//비밀번호 유효성검사
        $("#userPwd").on("input",function(){
            var regex = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$!@#%&\\(\\)\-_=+]).{8,16}$/;
            var result = regex.exec($("#userPwd").val())
            
            if(result != null){
                $(".pw-regex").html("");
            }else{
                $(".pw-regex").html("비밀번호(숫자,영문,특수문자(!,@,#,%,&) 조합) 최소8자");
                $(".pw-regex").css("color","red")
            }
        });
        
       //비밀번호 확인    
           $("#userRePwd").on("keyup",function(){
                if($("#userPwd").val()==$("#userRePwd").val()){
                   $(".repw-regex").html("비밀번호가 일치합니다");
                   $(".repw-regex").css("color","green")
                }else{
                 $(".repw-regex").html("비밀번호가 일치하지않습니다"); 
                 $(".repw-regex").css("color","red")
                }
           })
        
        //이름 유효성검사
            $("#userName").on("input",function(){
                var regex = /[가-힣]{2,}/;
                var result = regex.exec($("#userName").val());
                
                if(result != null){
                   $(".name-regex").html("");  
                }else{
                    $(".name-regex").html("한글만 입력 가능합니다.");
                    $(".name-regex").css("color","red")
                }
                
            })
        
        
        //email유효성 검사
            $("#userEmail").on("input",function(){
                 var regex = /.+@[a-z]+(\.[a-z]+){1,2}$/;
                 var result = regex.exec($("#userEmail").val());
                
                if(result != null){
                   $(".email-regex").html("");  
                }else{
                    $(".email-regex").html("올바른 이메일이 아닙니다");
                    $(".email-regex").css("color","red")
                }
            })
            
                //연락처 유효성검사
            $("#userPhone").on("input",function(){
                 var regex = /^01\d\d{3,4}\d{4}$/;
                 var result = regex.exec($("#userPhone").val());
                
                if(result != null){
                   $(".phone-regex").html("");  
                }else{
                    $(".phone-regex").html("올바른 번호가 아닙니다");
                    $(".phone-regex").css("color","red")
                }
                
            })
      //회원가입 버튼 눌렀을 때, 빈칸 있으면 다시 유효성 검사진행    
       $("#signupbtn").on("click",function(){
    	   var id = $("#userId").val();
    	   var pw = $("#userPwd").val();
    	   var name = $("#userName").val();
    	   var email = $("#userEmail").val();
    	   var phone = $("#userPhone").val();
    	   
    	   
    	   var idregex = /^[a-zA-Z0-9]{4,12}$/;
    	   var pwregex = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$!@#%&\\(\\)\-_=+]).{8,16}$/;
    	   var nameregex = /[가-힣]{2,}/;
    	   var emailregex = /.+@[a-z]+(\.[a-z]+){1,2}$/;
    	   var phoneregex = /^01\d\d{3,4}\d{4}$/;
    	   
    	   
    	   var idregex = idregex.exec(id);
    	   if(idregex == null){
    		   alert("아이디양식을 다시 확인해주세요");
    		   return;
    	   }
    	   var pwregex = pwregex.exec(pw);
    	   if(pwregex == null){
    		   alert("비밀번호양식을 다시 확인해주세요");
    		   retrun;
    	   }
    	   var nameregex = nameregex.exec(name);
    	   if(nameregex == null){
    		   alert("이름양식을 다시 확인해주세요");
    		   retrun;
    	   }
    	   var emailregex = emailregex.exec(email);
    	   if(emailregex == null){
    		   alert("이메일양식을 다시 확인해주세요");
    		   retrun;
    	   }
    	   var phoneregex = phoneregex.exec(phone);
    	   if(phoneregex == null){
    		   alert("연락처양식을 다시 확인해주세요");
    		   retrun;
    	   }
    	
    	   
         //빈칸 없을 때 제출.
    	   $("#checkAll").submit();
        	   
       
       })
    })
    </script>
</body>
</html>