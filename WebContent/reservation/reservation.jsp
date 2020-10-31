<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>인생뽑차</title>

<meta name="description"
   content="Live Preview Of Oswan eCommerce HTML5 Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- all css here -->
<link rel="stylesheet" href="../css/main_css/bootstrap.min.css">
<link rel="stylesheet" href="../css/car_css/animate.css">
<link rel="stylesheet" href="../css/car_css/owl.carousel.min.css">
<link rel="stylesheet" href="../css/car_css/chosen.min.css">
<link rel="stylesheet" href="../css/car_css/meanmenu.min.css">
<link rel="stylesheet" href="../css/car_css/themify-icons.css">
<link rel="stylesheet" href="../css/car_css/icofont.css">
<link rel="stylesheet" href="../css/car_css/font-awesome.min.css">
<link rel="stylesheet" href="../css/car_css/bundle.css">
<link rel="stylesheet" href="../css/car_css/style.css">
<link rel="stylesheet" href="../css/car_css/responsive.css">
<script src="../js/car_js/vendor/modernizr-2.8.3.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<script>
	$(function() {
	   $('.acc_ctrl').on('click', function(e) {
	      e.preventDefault();
	      if ($(this).hasClass('active')) {
	         $(this).removeClass('active');
	         $(this).next().stop().slideUp(300);
	      } else {
	    	  if ($(this).hasClass('acc_ctrl')) {
	    		  $(this).addClass('active');
	 	         $(this).next().stop().slideDown(300);
	 	        /* 달력  */
	 	         var m=$('#m').val();
	 	         $.ajax({	 	        	
	 	        	 type : "POST",
	 	        	 url : "calendar.do",
	 	        	 data : {"m":m},
	 	        	 success : function(res) {
	 	        		 $('#print').html(res);
	 	        	 }
	 	        	 
	 	         });
	 	         
	    	  }
	         $(this).addClass('active');
	         $(this).next().stop().slideDown(300);
	      }
	   });
	   
	   /* 달력  */
	   $('#m').change(function(){
		    var month=$('#m').val();
		    var year=$('#m').attr("year");
	         $.ajax({
	        	
	        	 type : "POST",
	        	 url : "calendar.do",
	        	 data : {"month":month,"year":year},
	        	 success : function(res) {
	        		 $('#print').html(res);
	        	 }
	        	 
	         });
	   });
	   
	   /* 시승 모델  */
	   $('.car_select').on('click', 'dd', function() {
	         var name = $(this).text().trim();
	         
	       if ($('.car_select > dd').hasClass('add_border')) {
	            $('.car_select > dd').removeClass('add_border')
	            $(this).addClass('add_border');
	            $('.model_name').text(name);	 
	            $('#modelData').val(name);
	         } else {
	            $(this).addClass('add_border');
	            $('.model_name').text(name); 
	            $('#modelData').val(name);
	     		
	         }
	       
	   });
	
	   /* 신청자 정보 */	  
	   $('.nextBtn').click(function() {
		   var name = $('#res_name').val();
		   var id = $('#memberId').val();
		   var tel0 = $('.tel0').val();
		   var tel1 = $('#tel1').val();
		   var tel2 = $('#tel2').val();
		   var email1 = $('#email1').val();
		   var email2 = $('#email2').val();
		   var sessionId = $('#sessionId').val();
		  
		   if (name.trim() === "") {
			   alert("이름을 입력해주세요!");
			   $('#res_name').focus();
		   } else if (tel1.trim() === "" || tel2.trim() === "") {
			   alert("전화번호를 입력해주세요!");
			   $('.tel0').focus();
		   } else if (email1.trim() === "" || email2.trim() === "") {
			   alert("이메일을 입력해주세요!");
			   $('#email1').focus();
		   } else
			   alert('신청자 정보 입력완료!');
		      
		   $('em.applicant_info').text(name + "\u00A0\u00A0"  + tel0 + "-" + tel1 + "-" +tel2);   
		   
	   });
	   
	   /* 개인정보 약관 전부 체크 */
	   var confirmChk = "체크 완료";
	   
	   $('#ex_chk4').on('click', function() {
		  var chk = $(this).is(":checked");
		 
		  if (chk) {
			  $('.checks input').prop('checked', true);
		  	  $('.private_chk').text(confirmChk);
		  } else {
			  $('.checks input').prop('checked', false);
			  $('.private_chk').text("");
		  }
		  	  	
	   });
	   
	   /* 개인정보 약관 체크 여부 */
	   $('.checks').on('click', 'input', function() {
		 	if ($("input:checkbox[id='ex_chk1']").is(":checked") === true && $("input:checkbox[id='ex_chk2']").is(":checked") === true)  {
		 		 $('.private_chk').text(confirmChk);
		 	} else 
		 		$('.private_chk').text("");
	   });
	   
	   
	   /* 시승 신청 최종 버튼 */
	   $('.reqBtn_div').on('click', 'button', function() {
		   var name = $('#res_name').val();
		   var id = $('#memberId').val();
		   var tel0 = $('.tel0').val();
		   var tel1 = $('#tel1').val();
		   var tel2 = $('#tel2').val();
		   var email1 = $('#email1').val();
		   var email2 = $('#email2').val();	
		   var sessionId = $('#sessionId').val();
		   
		   if ($('.reserve_place').text() === "") {
			   alert("시승하실 장소를 선택해주세요!");
			   return false;
		   } else if ($('.model_name').text() === "") {
			   alert("시승하실 모델을 선택해주세요!");
			   return false;
		   } else if ($('.model_date').text() === "") {
			   alert("시승 날짜를 선택해주세요!");
			   return false;
		   } else if (name.trim() === "") {
			   alert("신청자 정보의 이름을 입력해주세요!");
			   $('#res_name').focus();
			   return false;
		   } else if (tel1.trim() === "" || tel2.trim() === "") {
			   alert("신청자 정보의 전화번호를 입력해주세요!");
			   $('.tel0').focus();
			   return false;
		   } else if (email1.trim() === "" || email2.trim() === "") {
			   alert("신청자 정보의 이메일을 입력해주세요!");	
			   $('#email1').focus();
			   return false;
		   } else if ($('.applicant_info').text()==="") {
			   alert('신청자 정보의 다음 버튼을 눌러주세요!');
			   return false;
		   } else if ($("input:checkbox[id='ex_chk1']").is(":checked") === false) {
			   alert('개인정보 수집에 동의해주세요!');
			   return false;
		   } else if ($("input:checkbox[id='ex_chk2']").is(":checked") === false) {
			   alert('개인정보 취급 위탁에 동의해주세요!');
			   return false;
		   } else {
			   if (confirm("시승예약을 완료하시겠습니까?")) {
				   alert('예약이 완료되었습니다. 관리자가 승인할 때까지 기다려주세요! \r\n시승예약정보는 마이페이지에서 확인가능합니다.');	
				   return true;   
			   } else {
				   return false;
			   }
				  
			   
		   }
		
		     
	   	});     
	   	   	 	   
	});
	
   
</script>
<style type="text/css">
html, body { height: 100%; margin: 0; padding: 0; width: 100%; }
.acc { overflow: hidden; padding: 0; border-top: 2px solid #666; border-bottom: 2px solid #666; }
.acc li { list-style-type: none; padding: 0; border-top: 2px solid #666; }
.acc_ctrl { background: #ffffff; border: none; border-bottom: solid 1px #f2f2f2; cursor: pointer; display: block;
         outline: none; padding: 2em; position: relative; text-align: center; width: 100%; }
.acc_ctrl:before { background: #44596b; content: ""; height: 2px; margin-right: 37px; position: absolute;
               right: 0; top: 50%; -webkit-transform: rotate(90deg); -moz-transform: rotate(90deg);
               -ms-transform: rotate(90deg); -o-transform: rotate(90deg); transform: rotate(90deg);
               -webkit-transition: all 0.2s ease-in-out; -moz-transition: all 0.2s ease-in-out;
               -ms-transition: all 0.2s ease-in-out; -o-transition: all 0.2s ease-in-out;
               transition: all 0.2s ease-in-out; width: 14px; }
.acc_ctrl:after { background: #44596b; content: ""; height: 2px; margin-right: 37px; position: absolute; right: 0; top: 50%; width: 14px; }
.acc_ctrl.active:before { -webkit-transform: rotate(0deg); -moz-transform: rotate(0deg); -ms-transform: rotate(0deg); -o-transform: rotate(0deg); transform: rotate(0deg);}
.acc_ctrl.active h2, .acc_ctrl:focus h2 { position: relative; }
.acc_panel {  display: none; overflow: hidden; } /* background: #f2f2f2; */
.con { padding-right: 15px; padding-left: 15px; margin-left: auto; margin-right: auto; padding-bottom: 50px; width: 1000px; }
.container-fluid { position: relative; bottom: 50px; }
.breadcrumb-area { width: 1950px; height: 531px; }
em { font-size: 24px; display: block; color: #999999; line-height: 1em; padding-top: 12px; text-align: center; }
.sel { font-size: 25px; }
.rs { font-family: 'RenaultLife-Regular', 'RenaultSamsungMotors-Regular' !important; padding-top: 50px;
     padding-bottom: 50px; font-size: 40px; text-align: center;}
.acc_ctrl em.model_name { position: absolute; right:66px; top:31px; color: black; }
em.model_date{ position: absolute; right:66px; top:31px; color: black; }
/* 시승 모델 */
.pannel1 { height: 466px; }
.car_select { overflow: hidden; width: 988px; margin-left: -8px; margin-top: -8px; }
.car_select dt { position: relative; color: #666; line-height: 26px; font-size: 20px; padding-bottom: 40px; margin: 64px 0 0 51px; width: 196px; float: left; }
.car_select dd { float: left; width: 230px; background: #f8f8f6; height: 200px; margin-left: 14px; margin-top: 25px; }
.car_select dd a { padding: 46px 0; background-color: #f8f8f6; }
.car_select dd a img { width: 220px; height: 120px; background-color: #f8f8f6; margin: 0 auto; margin-top: 30px;}
.car_select dd a p { font-size: 26px; margin-top: 10px; text-align: center; color: #363636; position: relative; font-family: RenaultLife-Regular;}
.add_border{border: 3px solid #ffcc33;}
/* --------------- */
/* 신청자 정보  */
.pannel4 { width: 980px; height: 750px; }
.applicant_box { padding: 26px 88px; height: 800px; width: 900px; }
input[type="radio"] { width: 20px; bottom: -12px; left: 20px; }
select.form-control { width: 138px; float: left; margin-left: 11px; }
input[name="res_name"] { width: 134px; }
input[name="memberId"] { width: 200px; }
input[name="tel1"], input[name="tel2"] { float: left; width: 138px; margin-left: 11px; }
input[name="email1"] { float: left; width: 150px; margin-left: 11px; }
input[name="email2"] { float: left; width: 150px; margin-left: 30px; }
.em1 { display: inline-block; position: relative; right: 177px; top: -9px; }
div.form-group { margin-bottom: 40px; }
label.control-label { font-size: 18px; }
label.radio-inline {margin-right: 20px;}
.applicant_info{position: absolute; right:66px; top:31px; color: black; }
/* ---------------- */
/* 개인 약관 */
.pannel5 { height: 702px; }
.step_con { padding-left: 10px; }
.terms_box { width: 536px; height: 80px; border: 1px solid black; overflow: auto; }
.dt1 { margin-top: 40px; margin-bottom: 20px; font-size: 16px; font-family: NanumGothic; }
.table1 { float: right; position: relative; left: 300px }
.tip { margin-top: 20px; font-size: 12px; }
.checkbox { width: 20px; }
.terms_text p, .terms_text strong, .terms_table_text { font-size: 12px; color: #7c7a7b; font-weight: 400; margin-left: 10px; }
input[id="agree1"], label[for="agree1"], 
input[id="agree2"], label[for="agree2"],
input[id="agree3"], label[for="agree3"] { position: relative; float: right; line-height: 1.6em; }
#agree1 { top: -14px; }
#agree2 { top: -14px; }
#agree3 { width: 20px; top: -14px; }
.agree_chk { position: relative; bottom: 55px; right: 30px; }
#adCheck2 { width: 26px; }
div.checks3 {position: relative; left: 640px;}
div.agree_chkAll{     position: relative; bottom: 90px; right: 81px;}
.private_chk{position: absolute; right:66px; top:31px; color: black; }
/* ------------------ */
/* 지도 */
.pannel2 { height: 563px;}
div#map { height:563px; width:970px;}
.reserve_place{ position: absolute; right:66px; top:31px; color: black; }
/* ------------------ */
/* 예약 날짜 */
.pannel3 { width: 980px; height: 450px; padding-top: 30px; padding-left: 160px;}
#table_content { width: 700px; height: 300px; }
.pannel3 h2 {float: left; padding-left: 60px;}
.next_month_btn { padding: 0px; border: 0px; position: relative; top: 17px; left: 30px;}
.next_month_btn img {width: 35px;}
.prev_month_btn { padding: 0px; border: 0px; position: relative; top: 17px; left: 30px; float: left;}
.prev_month_btn img {width: 35px;}
.sel_date{ cursor: pointer; }
.monthDiv{ margin-left: 180px;}
select[name="month"] {position: relative; top: 14px; margin-left: 20px;}
.monthTable{ float:left; }
h2.monthH2{padding-left: 30px;}
/* ------------------ */
/* 시승 신청 버튼 */
.reqBtn_div {margin-bottom: 50px;}
.reqBtn{ background:#BDBDBD; border:none; width: 300px; height: 68px; font-size: 24px; padding:0 2em; cursor:pointer;
         transition:800ms ease all; outline:none; }
.reqBtn:hover{ background:#8C8C8C; }    
/* ------------------ */
.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
.wrap * {padding: 0;margin: 0;}
.wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
.wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
.info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
.info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
.info .close:hover {cursor: pointer;}
.info .body {position: relative;overflow: hidden;}
.info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
.desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
.desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
.info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
.info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.info .link {color: #5085BB;}
/* 체크박스 */
.where { display: block; margin: 25px 15px; font-size: 11px; color: #000; text-decoration: none; font-family: verdana; font-style: italic; }
.checks {position: relative; left: 700px;}
.checks input[type="checkbox"] { position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0);border: 0}
.checks input[type="checkbox"] + label { display: inline-block; position: relative; cursor: pointer; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; }
.checks input[type="checkbox"] + label:before {  /* 가짜 체크박스 */ content: ' '; display: inline-block; width: 21px;  /* 체크박스의 너비를 지정 */
  												height: 21px;  /* 체크박스의 높이를 지정 */ line-height: 21px; /* 세로정렬을 위해 높이값과 일치 */ margin: -2px 8px 0 0;
  												text-align: center;  vertical-align: middle; background: #fafafa; border: 1px solid #cacece; border-radius : 3px;
 												 box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05); }
.checks input[type="checkbox"] + label:active:before,
.checks input[type="checkbox"]:checked + label:active:before { box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1);}
.checks input[type="checkbox"]:checked + label:before {  /* 체크박스를 체크했을때 */  content: '\2714';  /* 체크표시 유니코드 사용 */ color: #99a1a7; text-shadow: 1px 1px #fff; background: #e9ecee;
 														 border-color: #adb8c0; box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05), inset 15px 10px -12px rgba(255,255,255,0.1); }
.checks.small input[type="checkbox"] + label { font-size: 12px; }
.checks.small input[type="checkbox"] + label:before { width: 17px; height: 17px; line-height: 17px; font-size: 11px; }
.checks.etrans input[type="checkbox"] + label { padding-left: 30px; }
.checks.etrans input[type="checkbox"] + label:before { position: absolute; left: 0; top: 0; margin-top: 0; opacity: .6; box-shadow: none; border-color: #6cc0e5;
														-webkit-transition: all .12s, border-color .08s; transition: all .12s, border-color .08s;}
.checks.etrans input[type="checkbox"]:checked + label:before { position: absolute; content: ""; width: 10px; top: -5px; left: 5px; border-radius: 0;
																opacity:1; background: transparent; border-color:transparent #6cc0e5 #6cc0e5 transparent;
 																 border-top-color:transparent; border-left-color:transparent; -ms-transform:rotate(45deg);
  																-webkit-transform:rotate(45deg); transform:rotate(45deg); }
.no-csstransforms .checks.etrans input[type="checkbox"]:checked + label:before { /*content:"\2713";*/ content: "\2714"; top: 0; left: 0; width: 21px;
  																					line-height: 21px; color: #6cc0e5; text-align: center;border: 1px solid #6cc0e5; }
/*----------------*/
															
</style>
</head>
<body>
   <jsp:include page="../cmmn/default-nav.jsp"></jsp:include>
   <div class="wrapper">
      
      <div class="breadcrumb-area pt-255 pb-170" style="background-image: url(../images/reservation_img/mainImg.jpg)">
         <div class="container-fluid"></div>
      </div>
      <form action="reservation_ok.do" name="writeform" method="post"> 
      <input type="hidden" name="modelData" id="modelData">
      <input type="hidden" name="calendarData" id="calendarData">
      <input type="hidden" name="agencyData" id="agencyData">
      <input type="hidden" name="sesssionId" value="${sessionScope.loginId }" id="sessionId">
	      
	      <div class="con">
	         <h2 class="rs">시승 신청 <em>Book a Test Drive</em></h2>	    
	         <ul class="acc">
	          <li>
	            <button class="acc_ctrl">
	               <h2 class="sel text-left">시승 거점</h2>
	               <em class="reserve_place"></em>
	            </button>

	            <div id="map">            
	            </div>
	          </li>
	          
	          <!-- 시승 모델 선택 -->       
	          <li>
	             <button class="acc_ctrl">
	                <h2 class="sel text-left">시승 모델</h2>            
	                <em class="model_name"></em>
	             </button>
	             <div class="pannel1 acc_panel">
	                <div class="car_select">
	                   <dt>시승하실<br>모델을<br>선택하세요!</dt>
	                   <dd>
	                      <a>
	                         <img src="../images/reservation_img/sm7.png">
	                         <p>SM7</p>
	                      </a>
	                   </dd>
	                   <dd>
	                      <a>
	                         <img src="../images/reservation_img/sm6.png">
	                         <p>SM6</p>
	                      </a>
	                   </dd>
	                   <dd>
	                      <a>
	                         <img src="../images/reservation_img/sm5.png">
	                         <p>SM5</p>
	                      </a>
	                   </dd>
	                   <dd>
	                      <a>
	                         <img src="../images/reservation_img/sm3.png">
	                        <p>SM3</p>
	                      </a>
	                   </dd>
	                   <dd>
	                      <a>
	                         <img src="../images/reservation_img/qm6.png">
	                         <p>QM6</p>
	                      </a>
	                   </dd>
	                   <dd>
	                      <a>
	                         <img src="../images/reservation_img/qm3.png">
	                         <p>QM3</p>
	                      </a>
	                   </dd>
	                </div>
	             </div>
	          </li>
	
	 		  <!-- 시승 날짜 선택 -->        
	 		  
	 		<li>
		 		<button class="acc_ctrl acc_ctrl1">
		        	<h2 class="sel text-left">시승 날짜</h2>
		            <em class="model_date"></em>                           
		        </button>
	            <div class="pannel3 acc_panel" id="calendarDiv">
		        	<div class="monthDiv">
				    	<h2>${year }년</h2>
				    </div>							      
				<!-- <form action="reservation.do" method="post" name="frm"> -->
					<table class="monthTable">
				 		<tr>
				  			<td>      
				  			 <select name="month" id="m" year="${year }">

								<c:forEach var="i" begin="${month }" end="12" >
									<option value="${i }">${i } </option>
								</c:forEach>
				  			 </select>
				  			</td>
				 		</tr>
					</table>
					<h2 class="monthH2">월</h2>		
					<div id="print">
					
					</div>
					</div>
				</li>
	          <!-- 신청자 정보 -->
	          <li>
	             <button class="acc_ctrl">
	                <h2 class="sel text-left">신청자 정보</h2>
	                <em class="applicant_info"></em>
	             </button>
	             <div class="pannel4 acc_panel">
	                <div class="applicant_box">
	                   <div class="form-horizontal">
	                      <div class="form-group">
	                         <label class="control-label col-sm-2" for="res_name">성명</label>
	                         <div class="col-sm-10">
	                            <input type="text" class="form-control" id="res_name" name="res_name">
	                         </div>
	                      </div>
	                      <div class="form-group">
	                         <label class="control-label col-sm-2" for="res_name">회원 아이디</label>
	                         <div class="col-sm-10">
	                            <input type="text" class="form-control" id="memberId"
	                             	   name="memberId" value="${sessionScope.loginId }" readonly="readonly">
	                         </div>
	                      </div>
	                      <div class="form-group">
	                         <label class="control-label col-sm-2" for="pwd">성별</label>
	                         <div class="col-sm-10">
	                            <label class="radio-inline"> 남자 
	                               <input type="radio" name="optradio" checked>
	                            </label> 
	                            <label class="radio-inline"> 여자
	                               <input type="radio" name="optradio"> 
	                            </label>
	                         </div>
	                      </div>
	                      <div class="form-group">
	                         <label class="control-label col-sm-2" for="birth">생년월일</label>
	                         <select class="form-control">
	                            <option>년</option>
	                               <c:forEach var="i" begin="1928" end="2019">
	                               	<option>${i }</option>
	                               </c:forEach>
	                         </select> 
	                         <select class="form-control info_month">
	                            <option>월</option>
	                            <c:forEach var="i" begin="1" end="12">
	                               	<option>${i }</option>
	                            </c:forEach>
	                         </select> 
	                         <select class="form-control info_day">
	                            <option>일</option>
	                            <c:forEach var="i" begin="1" end="31">                          
	                               	<option>${i }</option>                          
	                            </c:forEach>
	                         </select>
	                      </div>
	                      <div class="form-group">
	                         <label class="control-label col-sm-2" for="tel">연락처</label> 
	                      <select class="form-control tel0" name="tel0">
	                      		<option value="선택">선택</option>
	                            <option value="010">010</option>
	                            <option value="011">011</option>
	                            <option value="016">016</option>
	                            <option value="017">017</option>
	                            <option value="018">018</option>
	                            <option value="019">019</option>
	                            <option value="052">0502</option>
	                            <option value="0505">0505</option>
	                      </select> 
	                         <input type="text" class="form-control" id="tel1" name="tel1">
	                         <input type="text" class="form-control" id="tel2" name="tel2">
	                      </div>
	                      <div class="form-group">
	                         <label class="control-label col-sm-2" for="email">이메일</label> 
	                         <input type="text" class="form-control" id="email1" name="email1">
	                         <em class="em1">@</em> 
	                         <input type="text" class="form-control" id="email2" name="email2">
	                      </div>
	                      <div class="form-group">
	                         <label class="control-label col-sm-2" for="passenger">동승자</label>
	                         <div class="col-sm-10">
	                            <label class="radio-inline"> 없음 <input type="radio" name="passradio" checked></label> 
	                            <label class="radio-inline"> 있음 <input type="radio" name="passradio"> </label>
	                         </div>
	                      </div>
	                      <div class="form-group">
	                         <label class="control-label col-sm-2" for="purchaseDate">구입 예정일</label>
	                         <div class="col-sm-10">
	                            <label class="radio-inline"> 1개월 이내 <input type="radio" name="dateradio" checked></label> 
	                            <label class="radio-inline"> 3개월 이내 <input type="radio" name="dateradio"></label> 
	                            <label class="radio-inline"> 6개월 이내 <input type="radio" name="dateradio"></label> 
	                            <label class="radio-inline"> 1년 이내    <input type="radio" name="dateradio"></label> 
	                            <label class="radio-inline"> 계획 없음   <input type="radio" name="dateradio"></label>
	                         </div>
	                      </div>
	                      <div class="form-group">
	                         <label class="control-label col-sm-2" for="purchasWay">구매 방법</label>
	                         <div class="col-sm-10">
	                            <label class="radio-inline"> 현금 <input type="radio" name="wayradio" checked></label> 
	                            <label class="radio-inline"> 할부 <input type="radio" name="wayradio"></label> 
	                            <label class="radio-inline"> 리스 <input type="radio" name="wayradio"></label>
	                            <label class="radio-inline"> 장기렌트 <input type="radio" name="wayradio"></label>
	                         </div>
	                      </div>
	                      <div class="text-center">
					         <button type="button" class="btn btn-default nextBtn" width="60">다음</button>
					      </div>
	                   </div>
	                </div>
	             </div>
	          </li>
	          
	          <!-- 개인정보 수집 -->
	          <li>
	             <button class="acc_ctrl">
	                <h2 class="sel text-left">개인정보 수집 및 이용 동의</h2>
	                <em class="private_chk"></em>       
	             </button>
	             <div class="pannel5 acc_panel">
	                <div class="step_con" style="display: block;">
	                   <dl>
	                      <dt class="dt1">개인정보 수집 및 이용에 대한 동의(필수)</dt>
	                      <dd>
	                         <div class="terms_box">
	                            <div class="terms_text">
	                               <strong>1. 수집하는 개인정보 항목</strong>
	                               <p>필수항목 : 이름, 성별, 생년월일, 연락처, 이메일, 접속 IP 정보, 서비스 이용기록(쿠키, 접속로그)</p>
	                               <strong>2. 개인정보의 수집 및 이용 목적</strong>
	                               <p>회사는 온라인을 통해 수집된 개인 정보를 다음의 목적을 위해 활용합니다. <br> 가. 본인확인<br>
	                                              시승 신청 진행을 위한 본인 식별 및 부정 이용방지 등을 위하여 사용 됩니다.<br> 나. 마케팅
	                                              및 광고에 활용<br> 새로운 정보의 업데이트나 이벤트 소식, 자동차 관리, 경품 당첨자 선정,
	                                              서비스 안내와 같은 정보를 문자, 이메일, 전화, 우편 등의 방법으로 제공 및 통계학적 분석을 위해 사용합니다.</p>
	                               <strong>3. 개인정보의 보유 및 이용기간</strong>
	                               <p>이용목적이 달성된 경우에는 해당 정보를 지체 없이 파기합니다. <br>※ 보존기간 : 시승 신청 후 1년 </p>
	                               <strong>4. 수집/이용에 동의하지 않으시는 경우에는 시승 신청을 이용 하실 수 없습니다.</strong>
	                               <p>※ 개인정보 처리에 대한 자세한 사항 확인은 인생뽑차 웹사이트 (https://localhost/TeamProject_Car/main/main.do)에서 하실 수 있습니다.</p>
	                            </div>
	                         </div>
	                         <div class="agree_chk">
	                            <div class="checks etrans">
								  <input type="checkbox" id="ex_chk1"> 
								  <label for="ex_chk1">개인정보 수집 및 이용에 동의합니다.</label> 
								</div>
	                         </div>
	                      </dd>
	                      <dt class="dt1">개인정보 취급 위탁에 대한 동의(필수)</dt>
	                      <dd>
	                         <div class="terms_box">
	                            <div class="terms_text">
	                               <p>인생뽑차는 고객의 동의를 받은 경우에 한하여 수집한 개인정보를 다음과 같은 범위에서 취급위탁하고 있습니다.</p>
	                               <table class="terms_table_text table-bordered text-center">
	                                  <colgroup>
	                                     <col width="50%">
	                                     <col width="50%">
	                                  </colgroup>
	                                  <thead>
	                                     <tr>
	                                        <th class="text-center" scope="col">개인정보 취급위탁을 받는 자</th>
	                                        <th class="text-center" scope="col">개인정보 취급위탁을 하는 업무의 내용</th>
	                                     </tr>
	                                  </thead>
	                                  <tbody>
	                                     <tr>
	                                        <td>인생뽑차자동차 거점</td>
	                                        <td>고객이 선택한 거점 시승 신청 서비스 제공</td>
	                                     </tr>
	                                     <tr>
	                                        <td>㈜마더브레인</td>
	                                        <td>홈페이지 운영 및 유지보수</td>
	                                     </tr>
	                                     <tr>
	                                        <td>㈜아림디엠, 한국전산홈㈜</td>
	                                        <td>우편물 및 경품 배송업무 대행</td>
	                                     </tr>
	                                     <tr>
	                                        <td>Trans Cosmos Korea</td>
	                                        <td>차량구매 및 정비서비스 관련 고객 상담 업무</td>
	                                     </tr>
	                                     <tr>
	                                        <td>㈜삼성 SDS</td>
	                                        <td>전산시스템 운영 및 유지보수</td>
	                                     </tr>
	                                     <tr>
	                                        <td>㈜다우기술, ㈜ 세종텔레콤</td>
	                                        <td>SMS 발송 업무 대행</td>
	                                     </tr>
	                                     <tr>
	                                        <td>㈜ 아이뱅크</td>
	                                        <td>고객정보 분석 및 이메일 발송업무 대행</td>
	                                     </tr>
	                                  </tbody>
	                               </table>
	                            </div>
	                         </div>
	                         <div class="agree_chk">
	                            <div class="checks etrans">
								  <input type="checkbox" id="ex_chk2"> 
								  <label for="ex_chk2">개인정보 취급 위탁에 동의합니다.</label> 
								</div>
	                         </div>
	                      </dd>
	
	                      <dt class="dt1">광고/정보 수신 및 마케팅 활용에 대한 안내 (선택)</dt>
	                      <dd>
	                         <div class="terms_box">
	                            <div class="terms_text">
	                               <p>
	                                  <!-- 04. 광고/정보 수신 및 마케팅 활용에 대한 안내(선택) -->
	                                  1. 수집?이용 목적: 새로운 정보의 업데이트나 이벤트 소식, 자동차 관리, 경품 당첨자 선정, 서비스
	                                     안내와 같은 정보를 문자, 이메일, 전화, 우편 등의 방법으로 제공하기 위해 사용합니다. <br>
	                                  2. 수집 항목: 성별, 생년월일, 이메일, 연락처 (휴대폰/자택), 주소<br> 
	                                  3. 보유 · 이용기간 : 수집일로부터 1년
	                               </p>
	                            </div>
	                         </div>
	                         <div class="agree_chk">
	                            <div class="checks etrans checks3">
								  <input type="checkbox" id="ex_chk3"> 
								  <label for="ex_chk3">광고/정보 수신 및 마케팅 활용에 동의합니다.</label> 
								</div>
	                         </div>
	                         <div class="agree_add">  
	                            <!-- 마케팅약관 안내 문구 -->
	                            <dt class="tip">
	                               <dl>*광고/정보 수신 및 마케팅 활용에 동의하신 고객님께서는 인생뽑차에서 제공하는 특별한 혜택, <br> 이벤트, 경품 등에 관한 다양한 정보를 받으실 수 있습니다.</dl>
	                               <dl>*귀하는 인생뽑차의 서비스 이용에 필요한 최소한의 개인정보 수집 · 이용에 동의하지 않을 권리가 <br> 있으며, 동의 거부 시 거부한 내용에 대해 서비스가 제한될 수 있습니다.</dl>
	                            </dt>
	                         </div>
	                      </dd>
	                   </dl>                   
		                   <div class="agree_chk agree_chkAll">
		                   	<div class="checks etrans">
						   	 <input type="checkbox" id="ex_chk4"> 
						     <label for="ex_chk4">모든 약관을 확인하고 전체 동의에 체크합니다.<br>(전체 동의 시 선택 항목도 포함됩니다.)</label> 
						    </div>
		                   </div>
	                </div>
	             </div>
	          </li>
	        </ul>
	         
	        <!-- 시승 신청 버튼 -->
	        <div class="text-center reqBtn_div">
	             <button type="submit" class="reqBtn">시승 신청</button>
	        </div>    
	      </div>
      </form>
   </div>
   <jsp:include page="../cmmn/default-footer.jsp"></jsp:include>
   <!-- all js here -->
   <script src="../js/car_js/vendor/jquery-1.12.0.min.js"></script>
   <script src="../js/car_js/popper.js"></script>
   <script src="../js/car_js/bootstrap.min.js"></script>
   <script src="../js/car_js/isotope.pkgd.min.js"></script>
   <script src="../js/car_js/imagesloaded.pkgd.min.js"></script>
   <script src="../js/car_js/jquery.counterup.min.js"></script>
   <script src="../js/car_js/waypoints.min.js"></script>
   <script src="../js/car_js/owl.carousel.min.js"></script>
   <script src="../js/car_js/plugins.js"></script>
   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBMlLa3XrAmtemtf97Z2YpXwPLlimRK7Pk"></script>
   <script src="../js/car_js/main.js"></script>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5fd1db160519b45c84fe544350d7d8da&libraries=services"></script>
<script>
var iwRemoveable = true;
//마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new daum.maps.InfoWindow({zIndex:1, removable : iwRemoveable});
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  
// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 
// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places(); 
// 키워드로 장소를 검색합니다 삼성자동차대리점
ps.keywordSearch('삼성자동차대리점', placesSearchCB); 
// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === daum.maps.services.Status.OK) {
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new daum.maps.LatLngBounds();
        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
        }       
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}
// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
   
    // 마커를 생성하고 지도에 표시합니다
    var marker = new daum.maps.Marker({
        map: map,
        position: new daum.maps.LatLng(place.y, place.x),
        
    });
    // 마커에 클릭이벤트를 등록합니다
    daum.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;height:60px;width:170px;"><br>' + place.place_name + '</div>');
        infowindow.open(map, marker);
        
        $('.reserve_place').text(place.place_name);
        $('#agencyData').val(place.place_name);
    });
}
</script>
</body>
</html>