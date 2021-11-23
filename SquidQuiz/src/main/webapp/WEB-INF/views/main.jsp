<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PTSD Main Page</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/main.css">
</head>

<script>
	//자바스크립트로 헤더 파일 받아오는 소스 
	$(document).ready(function(){
		$('#headerMain').load("/resources/html/header.jsp");
	});
	function remaindTime() {
        var now = new Date(); //현재시간을 구한다. 
        var end = new Date(now.getFullYear(),now.getMonth(),now.getDate(),20,00,00);
    //오늘날짜의 저녁 20시 - 종료시간기준
        var open = new Date(now.getFullYear(),now.getMonth(),now.getDate(),00,00,00);
    //오늘날짜의 오전00시 - 오픈시간기준
      
        var nt = now.getTime(); // 현재의 시간만 가져온다
        var ot = open.getTime(); // 오픈시간만 가져온다
        var et = end.getTime(); // 종료시간만 가져온다.
      
       if(nt<ot){ //현재시간이 오픈시간보다 이르면 오픈시간까지의 남은 시간을 구한다. 
         $(".time").fadeIn();
         $("p.time-title").html("금일 게임신청 까지 남은 시간");

         sec =parseInt(ot - nt) / 1000;
         day  = parseInt(sec/60/60/24);
         sec = (sec - (day * 60 * 60 * 24));
         hour = parseInt(sec/60/60);
         sec = (sec - (hour*60*60));
         min = parseInt(sec/60);
         sec = parseInt(sec-(min*60));
         if(hour<10){
        	 hour="0"+hour;}
         if(min<10){
        	 min="0"+min;}
         if(sec<10){
        	 sec="0"+sec;}
          $(".hours").html(hour);
          $(".minutes").html(min);
          $(".seconds").html(sec);
       } else if(nt>et){ //현재시간이 종료시간보다 크면
        $("p.time-title").html("금일 참여 마감");
        $(".time").fadeOut();
       }else { //현재시간이 오픈시간보다 늦고 마감시간보다 이르면 마감시간까지 남은 시간을 구한다. 
           $(".time").fadeIn();
         $("p.time-title").html("금일 게임 진행까지 남은 시간");
         sec =parseInt(et - nt) / 1000;
         day  = parseInt(sec/60/60/24);
         sec = (sec - (day * 60 * 60 * 24));
         hour = parseInt(sec/60/60);
         sec = (sec - (hour*60*60));
         min = parseInt(sec/60);
         sec = parseInt(sec-(min*60));
         if(hour<10){
        	 hour="0"+hour;}
         if(min<10){
        	 min="0"+min;}
         if(sec<10){
        	 sec="0"+sec;}
          $(".hours").html(hour);
          $(".minutes").html(min);
          $(".seconds").html(sec);
       }
     }
     setInterval(remaindTime,1000); //1초마다 검사를 해주면 실시간으로 시간을 알 수 있다. 
</script>

<script>
var delay=10; //시간설정
var correctAnswers=new Array("X","O","X","O","O","X","X","X","X","O");  //정답

var q_num=1;
var timer;
var layer;
var clock=delay;
var score=0;

function show_question(){
	if (layer=eval("document.all.question"+q_num)){
		layer.style.display="inline";
		document.all.timeLeft.innerHTML=clock;
		hide_question();
	} else {
		document.all.timeLeft.innerHTML=0;
		document.all.quizScore.innerHTML="당신은 "+(q_num-1)+"문제중 "+score+"개를 맞췄습니다.";
		document.all.quizScore.style.display="inline";
	}
}

function hide_question(){
	if (clock>0) {
		document.all.timeLeft.innerHTML=clock;
		clock--;
		timer=setTimeout("hide_question()",1000);
	} else {
		clearTimeout(timer);
		document.all.answerBoard.innerHTML=" ";
		clock=delay;
		layer.style.display="none";
		q_num++;
		show_question();
	}
}
function check_answer(answer){
	if (correctAnswers[q_num-1]==answer){
		score++;
		document.all.answerBoard.innerHTML="<font color=blue><b>정답입니다.</b></font>";
	} else {
		document.all.answerBoard.innerHTML="<font color=red><b>땡! 틀렸습니다.</b></font>";
	}
	clock=0;
	clearTimeout(timer);
	timer=setTimeout("hide_question()",700);
}

window.onload=show_question;
</script>

<body>
<div id="headerMain"></div>
<br>
	 <div class="content">
		 <div class="row" style="background-color:; margin: 30px 0px 50px 0px;">
	       <div class="video_con">
<!-- 	        음속어 muted="muted" -->
	            <video id="vid" muted="muted" autoplay controls loop style="width:100%;height:100%;pointer-events: none;">
	                <source src="/resources/video/오징어게임.mp4" type="video/mp4">
	            </video>
				<script>
					document.getElementById('vid').play(); //동영상 자동재생 하기 위한 스크립트 언어
				</script>
	        </div> 
	        <div class="btn-con">
	        	<button id="game-app" class="Game-btn" style="color: black;">○   △   □ </button>
	        </div>
	        <div id="game-area" class="game-area" >
	        	<div class="quiz_show" id="quiz_show">
	        	<center><b><span style=" color: #fff;text-shadow: 0 0 7px #fff, 0 0 10px #80ff00, 0 0 21px #00ff00, 0 0 42px #ff80c0, 0 0 82px #ff80c0, 0 0 92px #ff80c0, 0 0 102px #ff80c0, 0 0 151px #ff80c0;
	        	 font-size: 2em; font-weight: bold;" id="timeLeft"></span></b>초</center> 
	        		<div id="answerBoard"></div>
		        		<div class="quiz" id="question1" style="display:none">
							<b>1.국악에서 자진모리, 중중모리, 휘모리 등의 빠르기말이 있는데 가장 빠른 것은 진양조이다? O,X</b><br>
							<a href="javascript:void(0)"  onclick="check_answer('O')">
								<button type="button"  class="game_start_O" id="game_start_O">O</button>
							</a>
							<a href="javascript:void(0)" onclick="check_answer('X')">
								<button type="button" class="game_start_X" id="game_start_X">X</button>
							</a>
						</div>
						
						<div class="quiz" id="question2" style="display:none">
							<b>2.달팽이도 이빨이 있는가? O,X</b><br>
							<a href="javascript:void(0)" onclick="check_answer('O')">
								<button type="button" class="game_start_O1" id="game_start_O">O</button>
							</a>
							<a href="javascript:void(0)" onclick="check_answer('X')">
								<button type="button" class="game_start_X1" id="game_start_X">X</button>
							</a>
						</div>
						
						<div class="quiz" id="question3" style="display:none">
							<b>3. 구기 종목 중에 가장 작은 공을 사용하는 경기는 골프이다? 오,엑스</b><br>
							<a href="javascript:void(0)" onclick="check_answer('O')">
								<button type="button" class="game_start_O1" id="game_start_O">O</button>
							</a>
							<a href="javascript:void(0)" onclick="check_answer('X')">
								<button type="button" class="game_start_X1" id="game_start_X">X</button>
							</a>
						</div>
							
						<div class="quiz" id="question4" style="display:none">
							<b>4. 제 1회 아테네 올림픽은 1896년에 열렸다? 오,엑스</b><br>
							<a href="javascript:void(0)" onclick="check_answer('O')">
								<button type="button" class="game_start_O1" id="game_start_O">O</button>
							</a>
							<a href="javascript:void(0)" onclick="check_answer('X')">
								<button type="button" class="game_start_X1" id="game_start_X">X</button>
							</a>
						</div>
							
						<div class="quiz" id="question5" style="display:none">
							<b>5. 딸기는 장미과에 속하는가? 오,엑스</b><br>
							<a href="javascript:void(0)" onclick="check_answer('O')">
								<button type="button" class="game_start_O1" id="game_start_O">O</button>
							</a>
							<a href="javascript:void(0)" onclick="check_answer('X')">
								<button type="button" class="game_start_X1" id="game_start_X" >X</button>
							</a>
						</div>
						
						<div class="quiz" id="question6" style="display:none">
							<b>6. 하마는 말의 일종인가? 오,엑스</b><br>
							<a href="javascript:void(0)" onclick="check_answer('O')">
								<button type="button" class="game_start_O1" id="game_start_O">O</button>
							</a>
							<a href="javascript:void(0)" onclick="check_answer('X')">
								<button type="button" class="game_start_X1" id="game_start_X" >X</button>
							</a>
						</div>
						
						<div class="quiz" id="question7" style="display:none">
							<b>7. 은행잎은 활엽수인가? 오,엑스</b><br>
							<a href="javascript:void(0)" onclick="check_answer('O')">
								<button type="button" class="game_start_O1" id="game_start_O">O</button>
							</a>
							<a href="javascript:void(0)" onclick="check_answer('X')">
								<button type="button" class="game_start_X1" id="game_start_X" >X</button>
							</a>
						</div>
						
						<div class="quiz" id="question8" style="display:none">
							<b>8. 아라비아 숫자 1부터 100사이에 9라는 숫자는 모두 합해 10개가 들어 있다? 오,엑스</b><br>
							<a href="javascript:void(0)" onclick="check_answer('O')">
								<button type="button" class="game_start_O1" id="game_start_O">O</button>
							</a>
							<a href="javascript:void(0)" onclick="check_answer('X')">
								<button type="button" class="game_start_X1" id="game_start_X" >X</button>
							</a>
						</div>
						
						<div class="quiz" id="question9" style="display:none">
							<b>9. 벼락은 남자보다 여자를 칠 가능성이 더 많은가? 오,엑스</b><br>
							<a href="javascript:void(0)" onclick="check_answer('O')">
								<button type="button" class="game_start_O1" id="game_start_O">O</button>
							</a>
							<a href="javascript:void(0)" onclick="check_answer('X')">
								<button type="button" class="game_start_X1" id="game_start_X" >X</button>
							</a>
						</div>
						
						<div class="quiz" id="question10" style="display:none">
							<b>10. 우리나라에 가장 넓은 차선은 광화문 앞에 16차선 인가? 오,엑스</b><br>
							<a href="javascript:void(0)" onclick="check_answer('O')">
								<button type="button" class="game_start_O1" id="game_start_O">O</button>
							</a>
							<a href="javascript:void(0)" onclick="check_answer('X')">
								<button type="button" class="game_start_X1" id="game_start_X" >X</button>
							</a>
						</div>
						
						<div class="quiz" id="quizScore" style="display:none"></div>
<!-- 	        		<table align="center"> -->
<!-- 	        			<tr> -->
<!-- 	        				<td style="font-size: 2em;">OX퀴즈</td> -->
<!-- 	        			</tr> -->
<!-- 	        			<tr> -->
<!-- 	        				<b><span id="timeLeft"></span></b>초 -->
<!-- 	        			</tr> -->
<!-- 	        			<tr> -->
<!-- 	        				<td style="font-size: 1.2em;" id="oxContents"></td> -->
<!-- 	        			</tr> -->
<!-- 	        			<tr> -->
				        	<button type="button" class="game_start_O" id="game_start_O">O</button>
				        	<button type="button" class="game_start_X" id="game_start_X">X</button>
<!-- 	        			</tr> -->
<!-- 	        		</table> -->
	        	</div>
	        	<center><h1 class="game_insert_info" id="game_insert_info">${loginUser.userId }님 참가 신청하셨습니다.</h1></center>
	        	<center><h1 class="game_delete_info" id="game_delete_info">${loginUser.userId }님 참가 취소하셨습니다.</h1></center>
<!-- 	        	<form action="Participant.ptsd" method="post"> -->
<%-- 		        	<input type="hidden" name="Participant" value="${loginUser.userId }"> --%>
		        	<button type="button" class="game_btn_insert" id="game-insert">참가신청</button>
<!-- 	        	</form> -->
	        	<button class="game_btn_start" id="game-start">퀴즈시작</button>
	        	<button class="game_btn_delete" id="game-delete">참가취소</button>
	        </div>
	      </div>
			<div class="sec7-text-box">
<!--               	<p class="font18">게임 시작 시간</p> -->
<!--               	<p class="runTimeCon font25">PM 20 : 00 : 00</p> -->
               	<p class="font15 time-title"></p>
             	<div class="time font40">
	             	<center>
	                	<span class="hours"></span>
	                	<span class="col">:</span>
	                	<span class="minutes"></span>
	               		<span class="col">:</span>
	               		<span class="seconds"></span>
	             	</center>
             	 </div>
            </div>
    </div>
</body>
<script>
	//게임 버튼 클릭시 display none가 show된다.
	$(function(){
		//시작/참가/취소
		$('#game-app').click(function(){
			if($('#game-area').css("display")=="none"){
				$('#game-app').hide();
				$('#game-area').show();
			}
		})
		//참가 취소시 명함 노출
		$('#game-delete').click(function(){
			if($('#game-app').css("display")=="none"){
				$('#game-area').hide();
				$('#game-app').show();
			}
		})
		
		//게임 참가 버튼 클릭스 해당 (아이디,회차 택1)이 나오고 신청완료 문구 출력
		$('#game-insert').click(function(){
			if($('#game_insert_info').css("display")=="none"){
				$('#game_delete_info').hide();
				$('#game_insert_info').show();
				$('#game-insert').hide();
				$('#game-delete').show();
			}
			var userId = '${loginUser.userId}';
// 			var ParticipantId = $('#game-insert').val();
			$.ajax({
				type:"POST",//전송방식
				url:"participant.ptsd",
				data:{
					"participant":userId
				},
				success:function(data){
					console.log("성공");
				},
				error: function() {
					console.log("관리자에게 문의하세요");
				}
			});
		});
		
		//참가 취소
		$('#game-delete').click(function(){
			if($('#game_delete_info').css("display")=="none"){
				$('#game_insert_info').hide();
				$('#game_delete_info').show();
				$('#game-insert').show();
				$('#game-delete').hide();
			}
			var userId = '${loginUser.userId}';
// 			var ParticipantId = $('#game-insert').val();
			$.ajax({
				type:"POST",//전송방식
				url:"participantRemove.ptsd",
				data:{
					"participant":userId
				},
				success:function(data){
					console.log("성공");
				},
				error: function() {
					console.log("관리자에게 문의하세요");
				}
			});
		});
		// 퀴즈 시작 시 모든 버튼이 사라지고 OX버튼만 남기게 된다.
		$('#game-start').click(function(){
			if($('#game_start_O').css("display") == "none" && $('#game_start_X').css("display")=="none"){
				$('#game_start_O').show();
				$('#game_start_X').show();
				$('#game-delete').hide();
				$('#game-start').hide();
				$('#game-insert').hide();
				$('#game_insert_info').hide();
				$('#quiz_show').show();
				$('#game_delete_info').hide();
				// 여기에서 ox에 대한 정보를 불러오고 main.jsp에 정보 뿌려주고
// 				$.ajax({
// 					type:"GET",
// 					url:"gameInfoSelect.ptsd",
// 					data:{
// 						"oxlist":oxList
// 					},
// 					success:function(data){
// 						console.log(data);
// 						// twkim 
// 						${'#oxContents'}.val(data.oxContents);
// 						console.log("성공");
						
// 					},
// 					error:function(){
// 						console.log("관리자에게 문의 ");
// 					}
// 				})
			}
			var oxList = "${ox.oxContents}";

		});
		
// 		$("#game_start_O").on("click", function() {
// 			var oxNo = '${ox.oxNo}';
// 			location.href="gameAnswerSelect.ptsd?oxNo="+oxNo;
// 			// ox를 누르면 oxNo 가져가서 퀴즈 정답 가져오기 
// 			// OX가져오면 거기에서 oxNo있겠죠? 
// 			$.ajax({
// 				type:"GET",
// 				url:"gameAnswerSelect.ptsd",
// 				data:{
// 					"oxNo":oxNo
// 				},
// 				success:function(data) {
// 					console.log("성공");
// 				},
// 				error: function(){
// 					console.log("관리자에게 문의");
// 				}
// 			});			
// 		});
	})
</script>
</html>