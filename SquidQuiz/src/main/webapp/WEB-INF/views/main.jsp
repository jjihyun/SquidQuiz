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
<body>
<div id="headerMain"></div>
	 <div class="content">
		 <div class="row" style="background-color:; margin: 30px 0px 50px 0px;">
	        <div class="video_con">
	<!--         음속어 muted="muted" -->
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
	        		<table align="center">
	        			<tr>
	        				<td>OX퀴즈</td>
	        			</tr>
	        			<tr>
	        				<td>문제내용</td>
	        			</tr>
	        			<tr>
				        	<button class="game_start_O" id="game_start_O">O</button>
				        	<button class="game_start_X" id="game_start_X">X</button>
	        			</tr>
	        		</table>
	        	</div>
	        	<center><h1 class="game_insert_info" id="game_insert_info">참가 신청하셨습니다.</h1></center>
	        	<button class="game_btn_insert" id="game-insert">참가신청</button>
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
				$('#game_insert_info').show();
			}
		})
		// 퀴즈 시작 시 모든 버튼이 사라지고 OX버튼만 남기게 된다.
		$('#game-start').click(function(){
			if($('#game_start_O').css("display") && $('#game_start_X').css("display")=="none"){
				$('#game_start_O').show();
				$('#game_start_X').show();
				$('#game-delete').hide();
				$('#game-start').hide();
				$('#game-insert').hide();
				$('#game_insert_info').hide();
			}
		})
	})
</script>
</html>