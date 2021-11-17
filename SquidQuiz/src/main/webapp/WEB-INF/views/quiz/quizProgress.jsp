<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/resources/css/quiz/oxWrite.css">
<link rel="stylesheet" href="/resources/css/quiz/quizIng.css">
<link rel="stylesheet" href="/resources/css/app.css">
<script src="//code.jquery.com/jquery.min.js"></script>
</head>
<script>
	//자바스크립트로 헤더 파일 받아오는 소스 
	$(document).ready(function() {
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
</script>
<style>
</style>
<body>
	<div id="headerMain"></div>
	<hr>
	<div class="wrapper">
		<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="#"> <img
					src="/src/img/icons/icon-48x48.png" alt=""> <span
					class="align-middle">관리자 홈 </span>
				</a>

				<ul class="sidebar-nav">
					<li class="sidebar-header">
						목록
					</li>
					<li class="sidebar-item">
					<a class="sidebar-link"
						href="index.html">
						<i class="align-middle"
							data-feather="sliders"></i>
						<span>회원정보수정</span>
						</a>
					</li>
					<li class="sidebar-item active">
					<a class="sidebar-link"
						href="pages-profile.html"> 
						<i class="align-middle"
							data-feather="user"></i> 
							<span class="align-middle">퀴즈진행</span>
					</a>
					</li>
					<li class="sidebar-item"><a class="sidebar-link"
						href="pages-profile.html"> <i class="align-middle"
							data-feather="user"></i> <span class="align-middle">퀴즈관리</span>
					</a></li>
					<li class="sidebar-item"><a class="sidebar-link"
						href="pages-profile.html"> <i class="align-middle"
							data-feather="user"></i> <span class="align-middle">신고관리</span>
					</a></li>
					<li class="sidebar-item"><a class="sidebar-link"
						href="pages-profile.html"> <i class="align-middle"
							data-feather="user"></i> <span class="align-middle">환전관리</span>
					</a></li>
				</ul>
			</div>
		</nav>

		<div class="main">
			<nav class="navbar navbar-expand navbar-light navbar-bg">
				<a class="sidebar-toggle js-sidebar-toggle"> <i
					class="hamburger align-self-center"></i>
				</a>
			</nav>

			<main class="content">
				<h1 class="h3 mb-3">
					<strong>퀴즈 진행</strong>
				</h1>
					<div class="writeArea">
						<div class="count_area">
							<h1 class="user_count">참가자:${mgi.participantTotal}명</h1>
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
				            <div class="quiz_btn">
				            <form action="quizProgressStart.ptsd" method="post">
				           		<button style="float: left;" type="submit" class="quiz_start_btn" id="quiz_start_btn">퀴즈 모집</button>
				            </form>
				            <form action="quizProgreStarting.ptsd" method="post">
				            	<input type="hidden" name="quizGameStatusStart" value="Y">
				           		<button style="float: left;" type="submit" class="quiz_starting_btn" id="quiz_starting_btn">퀴즈 시작</button>
				            </form>
				            <form action="quizProgressEnd.ptsd" method="post">
				            	<input type="hidden" name="quizGameStatusEnd" value="N">
				           		<button style="float: left;" type="submit" class="quzi_reset_btn" id="quiz_reset_btn">퀴즈 종료</button>
				            </form>
				            </div>
					</div>
			</main>

			<footer class="footer">
				<div class="container-fluid">
					<div class="row text-muted">
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script src="/resources/js/app.js"></script>
	<script>
		function showRegister(){
			location.href="oxList.ptsd";
		};
// 		$(function(){
// 			$('#quiz_start_btn').click(function(){
// 				if($('#quiz_end_btn').css("display")=="none"){
// 					$('#quiz_start_btn').hide();
// 					$('#quiz_end_btn').show();
// 				}
// 			})
// 		}
	</script>
	<script>
	</script>
</body>
</html>