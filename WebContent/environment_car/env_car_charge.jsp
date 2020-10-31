<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>인생뽑차</title>
<meta name="description"
	content="Live Preview Of Oswan eCommerce HTML5 Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="../images/car_img/favicon.png">

<!-- all css here -->
<link rel="stylesheet" href="../css/car_css/animate.css">
<link rel="stylesheet" href="../css/car_css/owl.carousel.min.css">
<link rel="stylesheet" href="../css/car_css/chosen.min.css">
<link rel="stylesheet" href="../css/car_css/jquery-ui.css">
<link rel="stylesheet" href="../css/car_css/meanmenu.min.css">
<link rel="stylesheet" href="themify-icons/themify-icons.css">
<link rel="stylesheet" href="icofont.min.css">
<link rel="stylesheet" href="../css/car_css/font-awesome.min.css">
<link rel="stylesheet" href="../css/car_css/bundle.css">
<link rel="stylesheet" href="../css/car_css/style.css">
<link rel="stylesheet" href="../css/car_css/responsive.css">
<script src="../js/car_js/vendor/modernizr-2.8.3.min.js"></script>

<jsp:include page="../cmmn/default-nav.jsp" />
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bbe730b25e58d27f83029a15154fa8af&autoload=false&libraries=services"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script
	src="http://mattstow.com/experiment/responsive-image-maps/jquery.rwdImageMaps.min.js"></script>
<script>
$(function(){

	$('img[usemap]').rwdImageMaps();

	$("#img").width("100%");
	
	$('area').click(function(){
		var loc = $(this).attr('id');
		
		$.ajax({
			type : 'post',
			url : 'env_car_charge_table.do',
			data : {'loc':loc},
			success : function(res){
						$('.addr_table').load("charge_table.jsp");
					}
		});
		
	}); 
	
	
});

</script>

<style type="text/css">
.col-lg-6 {
	width: 30%;
}

.blog-post {
	margin: 0 auto; img [usemap] { border : 1px solid black;
	height: auto;
	max-width: 100%;
	width: auto;
}

}
h4 {
	box-shadow: rgba(0, 0, 0, 0.3) 0px 8px 16px -8px, rgba(0, 0, 0, 0.024)
		0px -6px 16px -6px;
}

.addr_table {
	margin-top: 50px;
}

#wrapper_title{
	margin-bottom: 0px;
}
</style>
</head>
<body>
	<div class="wrapper">
		<div class="breadcrumb-area pt-255 pb-170"
			style="background-image: url(../images/env_car/env_car_back.jpg)">
			<div class="container-fluid">
				<div class="breadcrumb-content text-center">
					<h2>친환경 자동차</h2>
					<ul>
						<li>ECO Friendly Car</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="shop-wrapper fluid-padding-2 pt-120 pb-150">
			<div class="container-fluid">
				<div class="row">
					<!-- 사이드바 -->
					<div class="col-lg-2">
						<div class="product-sidebar-area pr-60">
							<div class="sidebar-widget pb-50">
								<h3 class="sidebar-widget">categories</h3>
								<div class="widget-categories">
									<ul>
										<li><a href="environment_car.do">친환경 자동차란?</a></li>
										<li><a href="env_car_list.do">친환경 자동차 구매</a></li>
										<li><a href="env_car_charge.do">친환경 자동차 충전소</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-8">
						<div class="shop-topbar-wrapper" id="wrapper_title">
							<div class="grid-list-options">친환경 자동차 충전소</div>
						</div>

						<div class="col-lg-4">
							<article class="blog-post">
								<div class="blog-post-body">
									<h4>
										<i class="icofont-location-pin"></i>지역을 선택하세요<i
											class="icofont-location-pin"></i>
									</h4>
									<div class="blog-post-image text-left">
										<img src="../images/env_car/korea_map1.png" usemap="#map01"
											width="${width }" height="${height }">
										<map name="map01">
											<area alt="" shape="poly"
												coords="150,35,150,35,150,35,159,54,159,54,191,84,191,84,191,112,191,112,215,119,215,119,209,160,209,160,218,165,218,165,250,156,250,156,290,176,290,176,351,173,351,173,363,151,363,151,275,14,275,14,268,11,268,11,261,21,261,21,243,21,243,21,235,33,235,33,196,41,196,41,194,39"
												id="강원도" />
											<area shape="poly" alt="" title=""
												coords="150,37,115,52,115,60,96,74,106,85,90,96,85,104,92,118,114,112,113,123,130,104,156,120,154,130,127,139,114,132,102,140,90,161,102,171,103,187,117,196,166,193,210,166,201,160,212,121,187,114,186,81,152,52,154,49"
												id="경기도" />
											<area shape="poly" alt="" title=""
												coords="130,107,111,122,115,130,130,135,154,129,152,120"
												id="서울특별시" />
											<area shape="poly" alt="" title=""
												coords="72,83,54,102,78,136,100,140,103,138,113,133,109,114,90,120,82,101,89,92,89,92"
												id="인천광역시" />

											<area shape="poly" alt="" title=""
												coords="284,175,276,206,255,202,216,234,222,234,217,262,232,276,221,301,224,316,241,320,257,342,268,344,265,312,293,303,312,317,311,330,297,341,289,342,288,346,314,350,353,332,382,341,389,315,388,290,374,294,382,208,369,191,365,150,354,174,293,180"
												id="경상북도" />
											<area shape="poly" alt="" title=""
												coords="292,305,266,323,276,336,269,347,284,348,306,320,297,304"
												id="대구광역시" />
											<area shape="poly" alt="" title=""
												coords="313,423,308,419,291,423,282,413,315,387,353,372,330,361,334,341,314,355,254,348,239,327,223,318,216,322,195,351,205,370,192,381,201,405,215,427,221,452,227,451,241,457,245,443,272,438,279,451,297,455"
												id="경상남도" />
											<area shape="poly" alt="" title=""
												coords="354,377,317,395,313,403,285,413,295,421,315,415,316,423,321,431,357,409,364,390"
												id="부산광역시" />

											<area shape="poly" alt="" title=""
												coords="351,336,337,342,335,352,348,362,359,376,368,395,375,376,381,343"
												id="울산광역시" />
											<area shape="poly" alt="" title=""
												coords="74,364,61,388,63,397,40,404,40,419,28,432,20,472,35,475,14,508,18,528,36,528,54,508,81,500,149,516,187,496,218,461,205,419,188,384,153,385,136,406,120,428,91,414,87,397,93,389,82,376"
												id="전라남도" />
											<area shape="poly" alt="" title=""
												coords="95,389,87,401,103,420,121,416,138,409,138,400,129,388"
												id="광주광역시" />
											<area shape="poly" alt="" title=""
												coords="82,300,93,317,75,348,78,363,92,380,114,364,153,382,189,380,200,370,190,347,217,316,222,314,219,304,169,308,164,291,153,287,144,302,125,298,107,308"
												id="전라북도" />

											<area shape="poly" alt="" title=""
												coords="75,177,39,212,33,267,44,284,73,268,85,278,82,290,105,302,121,294,141,297,151,288,167,287,178,302,189,302,192,294,186,280,165,283,137,247,169,244,163,219,173,209,164,196,114,195,100,181,85,177,85,177"
												id="충청남도" />
											<area shape="poly" alt="" title=""
												coords="167,242,145,263,161,275,183,277,193,273,193,255,177,247"
												id="대전광역시" />
											<area shape="poly" alt="" title=""
												coords="249,160,219,170,209,166,191,176,169,194,176,210,165,218,173,240,182,247,192,251,197,277,196,286,195,301,218,300,228,279,217,262,221,235,218,228,253,198,274,204,283,174"
												id="충청북도" />

											<area shape="poly" alt="" title=""
												coords="90,530,37,559,59,583,124,567,133,542,128,541"
												id="제주도" />
										</map>
									</div>
								</div>
							</article>
						</div>

						<div class="col-lg-8 addr_table"></div>

						<div class="col-lg-12" id="addrMap"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../cmmn/default-footer.jsp"></jsp:include>

	<!-- all js here -->
	<script src="../js/car_js/bootstrap.min.js"></script>
	<script src="../js/car_js/isotope.pkgd.min.js"></script>
	<script src="../js/car_js/imagesloaded.pkgd.min.js"></script>
	<script src="../js/car_js/jquery.counterup.min.js"></script>
	<script src="../js/car_js/waypoints.min.js"></script>
	<script src="../js/car_js/owl.carousel.min.js"></script>
	<script src="../js/car_js/plugins.js"></script>
	<script src="../js/car_js/main.js"></script>
</body>
</html>
