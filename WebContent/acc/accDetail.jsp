<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js">
<head>

<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Product Details || Asbab - eCommerce HTML5 Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Place favicon.ico in the root directory -->
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">
<link rel="apple-touch-icon" href="apple-touch-icon.png">

<!-- All css files are included here. -->
<!-- Bootstrap fremwork main css -->
<link rel="stylesheet" href="../css/main_css/bootstrap.min.css">
<!-- Owl Carousel min css -->
<link rel="stylesheet" href="../css/accessory_css/owl.carousel.min.css">
<link rel="stylesheet"
	href="../css/accessory_css/owl.theme.default.min.css">
<!-- This core.css file contents all plugings css file. -->
<link rel="stylesheet" href="../css/accessory_css/core.css">
<!-- Theme shortcodes/elements style -->
<link rel="stylesheet"
	href="../css/accessory_css/shortcode/shortcodes.css">
<!-- Theme main style -->
<link rel="stylesheet" href="../css/accessory_css/style.css">
<!-- Responsive css -->
<link rel="stylesheet" href="../css/accessory_css/responsive.css">
<!-- User style -->
<link rel="stylesheet" href="../css/accessory_css/custom.css">
<link rel="stylesheet" href="themify-icons/themify-icons.css">


<!-- Modernizr JS -->
<script src="../js/accessory_js/vendor/modernizr-3.5.0.min.js"></script>
<style type="text/css">
input.pi {
	width: 5%;
}

input.pr {
	width: 10%;
}

.cal * {
	display: inline;
}

.count {
	margin-right: 30px;
}

.bottom {
	margin-top: 150px;
}
.old__prize{
 text-decoration:line-through 
}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#buyBtn').click(function() {
		var result = confirm('구매하시겠습니까?'); 
		if(result) { //yes
			buy();
		} else { //no
			
		}
		
	}); 
		
});
$(document).ready(function(){
	$('#jjimBtn').click(function() {
		
		alert('해당 상품을 찜했습니다!!')
		
	}); 
		
});
		
</script>
 
<body onload="init()">
	<script language="JavaScript">
		var sell_price;
		var amount;

		function init() {
			sell_price = parseInt((document.form.sell_price.value).replace(",",
					""));

			//(document.form.sell_price.value).replace(",","");

			amount = document.form.amount.value;
			document.form.sum.value = sell_price;
			change();

		}

		function add() {
			hm = document.form.amount;
			sum = document.form.sum;
			hm.value++;

			sum.value = (parseInt(hm.value) * sell_price).toString().replace(
					/\B(?=(\d{3})+(?!\d))/g, ",");
		}

		function del() {
			hm = document.form.amount;
			sum = document.form.sum;
			if (hm.value > 1) {
				hm.value--;
				sum.value = (parseInt(hm.value) * sell_price).toString()
						.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
		}

		function change() {
			hm = document.form.amount;
			sum = document.form.sum;

			if (hm.value < 0) {
				hm.value = 0;
			}
			sum.value = (parseInt(hm.value) * sell_price).toString().replace(
					/\B(?=(\d{3})+(?!\d))/g, ",");

		}
		
		function buy()
		{
			var f=document.form;
			f.submit();
		}

		
	</script>


	<!-- Body main wrapper start -->
	<div class="wrapper">

		<div class="body__overlay"></div>
		<!-- Start Offset Wrapper -->
		<div class="offset__wrapper">
			<!-- Start Search Popap -->
			<div class="search__area">
				<div class="container">
					<div class="row">


						<div class="col-md-12">
							<div class="search__inner">
								<form action="#" method="get">
									<input placeholder="Search here... " type="text">
									<button type="submit"></button>
								</form>
								<div class="search__close__btn">
									<span class="search__close__btn_icon"><i
										class="zmdi zmdi-close"></i></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End Search Popap -->

		</div>
		<!-- End Offset Wrapper -->





		<jsp:include page="../cmmn/default-nav.jsp"></jsp:include>


		<!-- Start Bradcaump area -->
		<div class="ht__bradcaump__area"
			style="background: rgba(0, 0, 0, 0) url(images/bg/4.jpg) no-repeat scroll center center/cover;">
			<div class="ht__bradcaump__wrap">
				<div class="container">
					<div class="row">
						<div class="col-xs-12">
							<div class="bradcaump__inner"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Bradcaump area -->



		<!-- Start Product Details Area -->
		<section class="htc__product__details bg__white ptb--0">
			<!-- Start Product Details Top -->
			<div class="htc__product__details__top">
				<div class="container">
					<div class="row">
						<div class="col-md-5 col-lg-5 col-sm-12 col-xs-12">
							<div class="htc__product__details__tab__content">
								<!-- Start Product Big Images -->
								<div class="product__big__images">
									<div class="portfolio-full-image tab-content">
										<div role="tabpanel" class="tab-pane fade in active"
											id="img-tab-1">
											<img src="${vo.product_main_img }" alt="full-image">
										</div>
										<div role="tabpanel" class="tab-pane fade" id="img-tab-2">
											<img src="${vo.product_sub_img1 }">
										</div>
										<div role="tabpanel" class="tab-pane fade" id="img-tab-3">
											<img src="${vo.product_sub_img2 }">
										</div>
									</div>
								</div>
								<!-- End Product Big Images -->
								<!-- Start Small images -->
								<ul class="product__small__images" role="tablist">
									<li role="presentation" class="pot-small-img active"><a
										href="#img-tab-1" role="tab" data-toggle="tab"> <img
											src="${vo.product_main_img }" alt="small-image">
									</a></li>
									<li role="presentation" class="pot-small-img"><a
										href="#img-tab-2" role="tab" data-toggle="tab"> <img
											src="${vo.product_sub_img1 }" alt="small-image">
									</a></li>
									<li role="presentation" class="pot-small-img"><a
										href="#img-tab-3" role="tab" data-toggle="tab"> <img
											src="${vo.product_sub_img2 }" alt="small-image">
									</a></li>
								</ul>
								<!-- End Small images -->
							</div>
						</div>


						<div class="col-md-7 col-lg-7 col-sm-12 col-xs-12 smt-40 xmt-40" id="">
							<div class="ht__product__dtl">
							<c:if test="${sessionScope.id!=null && count==0 }">
																<a href="../acc/acc_insert.do?product_id=${vo.product_id }"
																	 id="jjimBtn">
																<img  src="like_2.png" width="60px" height="60px" style="float: right" >
																	</a>
															</c:if>
								<h2>${vo.product_name }</h2>
								
								<h6>
									Model: <span>${vo.product_id }</span>
								</h6>
								<!--  <ul class="rating">
                                    <li><i class="icon-star icons"></i></li>
                                    <li><i class="icon-star icons"></i></li>
                                    <li><i class="icon-star icons"></i></li>
                                    <li class="old"><i class="icon-star icons"></i></li>
                                    <li class="old"><i class="icon-star icons"></i></li>
                                </ul> -->
								<ul class="pro__prize">
									<li class="old__prize">${vo.product_origin_price }</li>
									<li>${vo.product_dc_price }</li>
								</ul>
								<p class="pro__info">${vo.product_explain }</p>
								<div class="ht__pro__desc">
									<div class="sin__desc">
										<p>
											<span>제조사:${vo.product_company }</span>
										</p>
									</div>

									<div class="ht__pro__desc">
										<div class="sin__desc">
											<p>
												<span>원산지:${vo.product_made }</span>
											</p>
										</div>

										<div class="ht__pro__desc">
											<div class="sin__desc">
												<p>
													<span>배송방법:${vo.product_delivery }</span>
												</p>
											</div>

											<div class="ht__pro__desc">
												<div class="sin__desc">
													<p>
														<span>배송비:${vo.product_delivery_fee }</span>
													</p>
												</div>

												<div class="ht__pro__desc">
													<div class="sin__desc">
														<p>
															<span>배송가능지역:</span>
														</p>
													</div>

													<div class="ht__pro__desc">
														<div class="sin__desc cal">
															<form name="form" method="post" action="../acc/acc_buy.do" >
																<div class=count>
																	수량 : <input type="hidden" name="sell_price"
																		value="${vo.product_dc_price}"> 
																		<input type="hidden" name="product_id"
																		value="${vo.product_id}"> 
																		<input type="button" class="btn btn-xs btn-primary"
																		value=" + " onclick="add();"> 
																		<input type="text" class="pi" name="amount" value="1" 
																		size="1" onchange="change(); readonly"> 
																		<input type="button" class="btn btn-xs btn-danger"value=" - " onclick="del();">
																</div>

																<div class=price>
																	합계 : <input type="text" class="pr" name="sum" size="11"
																		readonly value="${vo.product_dc_price}"> 원
																</div>
																<c:if test="${sessionScope.id!=null }">
															     <input type=button class="btn btn-md btn-primary" 
																	 value="구매하기" id="buyBtn" style="float: right">
																	<!--  onclick="buy()" -->
															</c:if>
															</form>
														</div>


													</div>
													<div class="ht__pro__desc">
														<div class="sin__desc pull-center">
															
															
															
														</div>
														<div>
														<input type=button class="btn btn-md btn-danger"
																value="목록" onclick="location.href=document.referrer" style="margin-left: 600px;">
														</div> 

													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- End Product Details Top -->
		</section>
		<!-- End Product Details Area -->








		<!-- Start Product Area -->


	</div>
	<!-- Body main wrapper end -->

	<!-- Placed js at the end of the document so the pages load faster -->

	<!-- jquery latest version -->
	<script src="../js/accessory_js/vendor/jquery-3.2.1.min.js"></script>
	<!-- Bootstrap framework js -->
	<script src="../js/accessory_js/bootstrap.min.js"></script>
	<!-- All js plugins included in this file. -->
	<script src="../js/accessory_js/plugins.js"></script>
	<script src="../js/accessory_js/slick.min.js"></script>
	<script src="../js/accessory_js/owl.carousel.min.js"></script>
	<!-- Waypoints.min.js. -->
	<script src="../js/accessory_js/waypoints.min.js"></script>
	<!-- Main js file that contents all jQuery plugins activation. -->
	<script src="../js/accessory_js/main.js"></script>

</body>

</html>