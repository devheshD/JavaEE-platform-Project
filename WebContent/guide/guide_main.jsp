<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Smoth | Corporate HTML ㄴTemplate</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- all css here -->
<link rel="stylesheet" href="../css/guide_css/bootstrap.min.css">
<link rel="stylesheet" href="../css/guide_css/font-awesome.min.css">
<link rel="stylesheet" href="../css/guide_css/pe-icon-7-stroke.css">
<link rel="stylesheet" href="../css/guide_css/owl.carousel.css">
<link rel="stylesheet" href="../css/guide_css/magnific-popup.css">
<link rel="stylesheet" href="../css/guide_css/meanmenu.css">
<link rel="stylesheet" href="../css/guide_css/style.css">
<link rel="stylesheet" href="../css/guide_css/responsive.css">
<style type="text/css">
.breadcrumb-title h1 {
    position: relative;
    top: 40px;
}
</style>
<script src="../js/guide_js/vendor/modernizr-2.8.3.min.js"></script>
<script type="text/javascript">
	function ajaxClick1() {
		$.ajax({
			
			type: 'post',
			url: 'guide_purchase.do',
			success: function(res) {
				$('#tipDiv').html(res);
			}
			
			
		});
	}
	
	function ajaxClick2() {
		$.ajax({
			
			type: 'post',
			url: 'guide_garage.do',
			success: function(res) {
				$('#tipDiv').html(res);
			}
			
			
		});
	}
	
	function ajaxClick3() {
		$.ajax({
			
			type: 'post',
			url: 'guide_N_gear.do',
			success: function(res) {
				$('#tipDiv').html(res);
			}
			
			
		});
	}
	
	function ajaxClick4() {
		$.ajax({
			
			type: 'post',
			url: 'guide_parking_method.do',
			success: function(res) {
				$('#tipDiv').html(res);
			}
			
			
		});
	}
	
	function ajaxClick5() {
		$.ajax({
			
			type: 'post',
			url: 'guide_night_driving.do',
			success: function(res) {
				$('#tipDiv').html(res);
			}
			
			
		});
	}
	
	
	
</script>
</head>
<body>
	<!-- header start -->
		<jsp:include page="../cmmn/default-nav.jsp"></jsp:include>
	<!-- header end -->
	<!-- breadcrumb-area-start -->
	<div class="">
		<img src="../images/guide_img/bg/10.jpg">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="breadcrumb-title text-center">
						<h1>Amateur Driver's Guide</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- blog-area-start -->
	<div class="blog-area ptb-80">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-12">
					<div class="blog-widget">
						<div class="widget-title">
							<h3>Categories</h3>
						</div>
						<ul class="list-item">
							<li><a style="cursor: pointer" onclick="ajaxClick1()">첫차 구매</a></li>
							<li><a style="cursor: pointer" onclick="ajaxClick2()">정비소 고르기</a></li>
							<li><a style="cursor: pointer" onclick="ajaxClick3()">중립 기어</a></li>
							<li><a style="cursor: pointer" onclick="ajaxClick4()">주차 방법</a></li>
							<li><a style="cursor: pointer" onclick="ajaxClick5()">밤길 운전</a></li>
						</ul>
					</div>				
				</div>
				<div class="container">
					<div class="row" id="tipDiv">
						<jsp:include page="guide_purchase.jsp"/>
					</div>
				</div>
			</div>
		</div>	</div>

	<!-- footer start -->
	<jsp:include page="../cmmn/default-footer.jsp"></jsp:include>
	<!-- footer end -->
	<!-- all js here -->
	<script src="../js/guide_js/vendor/jquery-1.12.0.min.js"></script>
	<script src="../js/guide_js/bootstrap.min.js"></script>
	<script src="../js/guide_js/owl.carousel.min.js"></script>
	<script src="../js/guide_js/jquery.meanmenu.js"></script>
	<script src="../js/guide_js/jquery.mixitup.min.js"></script>
	<script src="../js/guide_js/jquery.magnific-popup.min.js"></script>
	<script src="../js/guide_js/jquery.counterup.min.js"></script>
	<script src="../js/guide_js/waypoints.min.js"></script>
	<script src="../js/guide_js/plugins.js"></script>
	<script src="../js/guide_js/main.js"></script>
</body>
</html>
