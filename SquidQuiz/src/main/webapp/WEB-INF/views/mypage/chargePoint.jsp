<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
	<meta name="author" content="AdminKit">
	<meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

	<link rel="preconnect" href="https://fonts.gstatic.com">
	
	<!-- 사이트 이모티콘 -->
	<link rel="shortcut icon" href="/resources/img/photos/초대.png" />

	<title>마이페이지 활동내역</title>
	<link rel="stylesheet" href="/resources/css/app.css">
	<link rel="stylesheet" href="/resources/js/app.js">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
</head>
<style>

.container{
	width: 500px;
	margin: 0 auto;
}

ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
}
ul.tabs li{
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current{
	background: #ededed;
	color: #222;
}

.tab-content{
	display: none;
	background: #ededed;
	padding: 15px;
}

.tab-content.current{
	display: inherit;
}
.charge{width:400px; height:200px;background-color:pink; margin:0 auto;}
.charge-btn{width:100px;height:40px;margin-top:10px;}
#numPoint{width:150px;height:40px; margin-top:10px;text-align:right;}
.p-btn{ margin-top:10px;}

#charge_kakao{width:300px;}
#back-btn{width:300px;margin-top:10px;}

#pay{text-align:right;font-size:20px;border:none;pointer-events: none;}
</style>

<body>
	<header>
		<jsp:include page="../../../resources/html/header.jsp" />
	</header>
	<br>
	<div class="wrapper">
		<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand" href="index.html"> <img
					src="/src/img/icons/icon-48x48.png" alt=""> <span
					class="align-middle">MY PAGE</span>
				</a>

				<ul class="sidebar-nav">

					<li class="sidebar-header" align="center"><a
						href="/mypageUser.ptsd"><img
							src="/resources/img/userProfile.png" alt="" style="width: 100px;">
							<input type="text" id="my-userId" name="my-userId"
							value="${loginUser.userId }"
							style="text-align: center; font-size: 18px; font-weight: bold; width: 200px; height: 40px; background-color: transparent; border: none; outline: none; pointer-events: none; color: white;">
					</a></li>

					<li class="sidebar-item "><a class="sidebar-link"
						href="mypageMyHome.ptsd"> <i class="align-middle"
							data-feather="user"></i> <span class="align-middle">MY홈</span>
					</a></li>
					<li class="sidebar-item"><a class="sidebar-link"
						href="mypageDetail.ptsd"> <i class="align-middle"
							data-feather="sliders"></i> <span class="align-middle">활동내역</span>
					</a></li>
					<li class="sidebar-item active"><a class="sidebar-link"
						href="mypagePoint.ptsd"> <i class="align-middle"
							data-feather="star"></i> <span class="align-middle">포인트</span>
					</a></li>
					<li class="sidebar-item"><a class="sidebar-link"
						href="userDelete.ptsd"> <i class="align-middle"
							data-feather="user-x"></i> <span class="align-middle">회원탈퇴</span>
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
					<strong>포인트</strong>
				</h1>
				<br><br><br>
				<div class="container-fluid p-0">
					<div align="center">
						<div class="charge">
						<form action="payPoint.ptsd" name="form" method="post">
						 <div class="card-body bg-white mt-0 shadow">
			                <label class="box-radio-input"><input type="radio" name="cp_item" value="10000"onclick="selectItem(this)"><span>10,000원</span></label>
			                <label class="box-radio-input"><input type="radio" name="cp_item" value="15000"onclick="selectItem(this)"><span>15,000원</span></label>
			                <label class="box-radio-input"><input type="radio" name="cp_item" value="20000"onclick="selectItem(this)"><span>20,000원</span></label>
			                <label class="box-radio-input"><input type="radio" name="cp_item" value="25000"onclick="selectItem(this)"><span>25,000원</span></label>
			                <label class="box-radio-input"><input type="radio" name="cp_item" value="30000"onclick="selectItem(this)"><span>30,000원</span></label>
			                <label class="box-radio-input"><input type="radio" name="cp_item" value="35000"onclick="selectItem(this)"><span>35,000원</span></label>
			                <label class="box-radio-input"><input type="radio" name="cp_item" value="40000"onclick="selectItem(this)"><span>40,000원</span></label>
			                <label class="box-radio-input"><input type="radio" name="cp_item" value="50000"onclick="selectItem(this)"><span>50,000원</span></label>
			                <p  style="color: #ac2925; margin-top: 30px">카카오페이의 최소 충전금액은 10,000원이며 <br/>최대 충전금액은 50,000원 입니다.</p><br>
			                <input type="text" id="pay" name="point" >원<br><br>
			                <button type="button" class="btn btn-primary" id="charge_kakao">충 전 하 기</button>
							<button type="button" class="btn btn-secondary" id="back-btn" onclick="location.href='/mypagePoint.ptsd'">돌아가기</button>
			 			</div>
			 			</form>
						</div>
					</div>
					</div>
					<br>
					
				</main>
		

		<footer class="footer">
			<div class="container-fluid">
				<div class="row text-muted">
					<div class="col-6 text-start">
						<p class="mb-0">
							<a class="text-muted" href="https://adminkit.io/" target="_blank"><strong>AdminKit</strong></a>
							&copy;
						</p>
					</div>
					<div class="col-6 text-end">
						<ul class="list-inline">
							<li class="list-inline-item"><a class="text-muted"
								href="https://adminkit.io/" target="_blank">Support</a></li>
							<li class="list-inline-item"><a class="text-muted"
								href="https://adminkit.io/" target="_blank">Help Center</a></li>
							<li class="list-inline-item"><a class="text-muted"
								href="https://adminkit.io/" target="_blank">Privacy</a></li>
							<li class="list-inline-item"><a class="text-muted"
								href="https://adminkit.io/" target="_blank">Terms</a></li>
						</ul>
					</div>
				</div>
			</div>
		</footer>
		</div>
	</div>

	<script src="/resources/js/app.js"></script>
<script>
	
	function selectItem(obj){
		var price = $(obj).val();
		$("#pay").val(price);
		
	}
	
    $('#charge_kakao').click(function () {
        // getter
 //       var price = $("#pay").val();
        var IMP = window.IMP;
        IMP.init('imp36122995');
        var money = $('input[name="cp_item"]:checked').val();
        console.log(money);

        IMP.request_pay({
            pg: 'kakaopay',
            merchant_uid: 'merchant_' + new Date().getTime(),

            name: '주문명 : 주문명 설정',
            amount: 10,
            buyer_email: 'iamport@siot.do',
            buyer_name: '구매자이름',
            buyer_tel: '010-1234-5678',
            buyer_addr: '인천광역시 부평구',
            buyer_postcode: '123-456'
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
              form.submit();
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
//         document.location.href="mypagePoint.ptsd"; //alert창 확인 후 이동할 url 설정
        });
    });
</script>


</body>
</html>