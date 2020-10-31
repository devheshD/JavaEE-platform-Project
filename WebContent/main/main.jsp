<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/main_css/custom.css">
<link rel="stylesheet" type="text/css" href="../shadow/css/shadowbox.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript">

	/* Shadowbox.init({
		players : [ "iframe" ]
	});

	$(function() {
		$('.carVideo').click(function() {
			var no = $(this).attr('video-data');
			
			 Shadowbox.open({
					content : 'test'+no+'.do',
					player : 'iframe',
					width : 602,
					height : 352
				});
		});
	}); */
	$(function() {
		$('.carVideo').click(function() {
			var no = $(this).attr('video-data');
			$('#box').attr('src',no);
			/* alert(no); */
		});
	});
</script>

<style type="text/css">
/* 기사 img*/
/**/
.main_acrticle {
	width: 218px;
	height: 186px;
	background: #ffffff;
	box-shadow: 0 1px 10px rgba(0, 0, 0, 0.5);
	position: relative;
	border: 1px solid #949393;
	padding: 0px;
	margin-bottom: 10px;
}

#article-img {
	width: 216px;
	height: 135px;
	position: relative;
	cursor: pointer;
}

#article-img img {
	box-shadow: 0 1px 10px rgba(0, 0, 0, 0.4);
	width: inherit;
	height: inherit;
}
/*===================================*/
header {
	width: 100%;
	background-color: black;
	margin: 0 auto;
}

.abc {
	width: 218;
	height: 135;
}

.fullrow {
	height: 1980px;
}

.video-box {
	width: 750px;
	height: 560px;
}

.car-article-box {
	height: 680px;
	margin-bottom: 10px;
	padding-bottom: 10px;
	border-bottom: 1px;
	border-bottom-style: solid;
	border-bottom-color: gray;
}

.box1 {
	width: 750px;
	height: 315px;
	margin-top: 20px;
	margin-bottom: 5px;
}

.car-video1 {
	margin-bottom: 17px;
}

.box2 {
	width: 750px;
	height: 150px;
}

.car-video img {
	box-shadow: 0 1px 10px rgba(0, 0, 0, 1);
	width: inherit;
	height: inherit;
}

.car-video1 img {
	box-shadow: 0 1px 10px rgba(0, 0, 0, 1);
	width: inherit;
	height: inherit;
}
/* ========car-ranking=========*/
.car-popularity-ranking {
	border-top: 1px;
	border-top-style: solid;
	border-top-color: gray;
}

.car-ranking:hover {
	box-shadow: 0 0 6px rgba(125, 125, 125, 125);
}

.car-ranking {
	margin: 10px;
	width: 355px;
	height: 100px;
	position: relative;
	float: left;
	padding-bottom: 10px;
	vertical-align: middle;
	border: 1px gray;
	border-bottom-style: dotted;
	/* box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.4); */
}

.car-ranking img {
	padding-top: 15px;
	padding-right: 10px;
	width: 160px;
	float: left;
}

.compare {
	padding-bottom: 10px;
}
</style>
<!-- header.jsp -->
<jsp:include page="../cmmn/default-header.jsp"></jsp:include>
</head>
<body>
	<!-- nav.jsp -->
	<jsp:include page="../cmmn/default-nav.jsp"></jsp:include>
	<!-- main.jsp -->
	<header class="title">
		<a href="main.do"><img src="../images/main_img/pickcar.png"></a>
	</header>


	<div class="container">
		<div class="bg_feature"></div>
		<section class="main-slider">
			<ul class="bxslider">
				<li>
					<div class="slider-item">
						<img src="../images/main_img/new-car1.jpg" width="100%" />
						<h2>
							<a href="../car/car_detail.do?cno=3633" title="Chevrolet - Camaro SS in 2018"> Chevrolet
								- Camaro SS in 2019 </a>
						</h2>
					</div>
				</li>
				<li>
					<div class="slider-item">
						<img src="../images/main_img/new-car2.jpg" width="100%" />
						<h2>
							<a href="../car/car_detail.do?cno=2619" title="Lamborghini - Aventador in 2011">
								Lamborghini - Aventador in 2016 </a>
						</h2>
					</div>
				</li>
				<li>
					<div class="slider-item">
						<img src="../images/main_img/new-car3.jpg" width="100%" />
						<h2>
							<a href="../car/car_detail.do?cno=3602" title="Hyundai - Genesis G90 in 2018"> Hyundai -
								Genesis G90 in 2019 </a>
						</h2>
					</div>
				</li>
				<li>
					<div class="slider-item">
						<img src="../images/main_img/new-car4.jpg" width="100%" />
						<h2>
							<a href="../car/car_detail.do?cno=3423" title="Kia - Stinger in 2017"> Kia - Stinger in
								2019 </a>
						</h2>
					</div>
				</li>
				<li>
					<div class="slider-item">
						<img src="../images/main_img/eco-car.jpg" width="100%" />
						<h2>
							<a href="../environment_car/environment_car.jsp"
								title="Go to Eco-Friendly Car"> Go to Eco-Friendly Car </a>
						</h2>
					</div>
				</li>
			</ul>
		</section>
		
		<div class="main" style="width: 1140px">
			<dl class="kr" style="width: 25%">
				<dt>국산</dt>
					<ul class="carmodel" style="padding-left: 15px;">
					
						<c:forEach var="kvo" items="${kBrandList }">
							<li class="carli">
								<a href="../car/car_brand.do?keyword=${kvo.brand_name }"> 
									<img class="logo" src="${kvo.brand_image }"> 
									<span class="logoname">${kvo.brand_name }</span>
								</a>
							</li>
							
						</c:forEach>
					</ul>
					
				</dd>
			</dl>
			<dl class="eu" style="width: 44%">
				<dt>유럽</dt>
				<dd>
					<ul class="carmodel">
						<c:forEach var="evo" items="${euBrandList }">
							<li class="carli">
								<a href="../car/car_brand.do?keyword=${evo.brand_name }"> 
									<img class="logo" src="${evo.brand_image }"> 
									<span class="logoname">${evo.brand_name }</span>
								</a>
							</li>
						</c:forEach>
					</ul>
				</dd>
			</dl>
			<dl class="jp" style="width: 19%">
				<dt>일본/중국</dt>
				<dd>
					<ul class="carmodel" style="padding-left: 15px;">
						<c:forEach var="avo" items="${aBrandList }">
							<li class="carli">
								<a href="../car/car_brand.do?keyword=${avo.brand_name }"> 
									<img class="logo" src="${avo.brand_image }"> 
									<span class="logoname">${avo.brand_name }</span>
								</a>
							</li>
						</c:forEach>
					</ul>
			</dl>
			<dl class="us" style="width: 12%">
				<dt>미국</dt>
				<dd>
					<ul class="carmodel">
						<c:forEach var="amvo" items="${amBrandList }">
							<li class="carli">
								<a href="../car/car_brand.do?keyword=${amvo.brand_name }"> 
									<img class="logo" src="${amvo.brand_image }"> 
									<span class="logoname">${amvo.brand_name }</span>
								</a>
							</li>
						</c:forEach>
					</ul>
				</dd>
			</dl>
		</div>

		<section>
			<div class="row">
				<div class="col-md-8 fullrow">
					<div class="post">
						<div class="blog-post-body">

							<div class="car-article-box">
								<h3>POST</h3>
								<c:forEach var="vo" items="${nList }">
									<div class="single-slide col-sm-4">
										<div class="main_acrticle">
											<a class="main_article" href="http://localhost:8080/Project_car/news/newsDetail.do?news_no=${vo.news_no }">
												<div id="article-img">
													<img src="${vo.detail_img}"/>
												</div>
												<div class="slide-text-container text-center">
													<h5>
														${fn:substring(vo.title,0,14) }...<br> <font size="1" color="gray">${vo.news_company } |
															${vo.news_date }</font>
													</h5>
												</div>
											</a>
										</div>
									</div>
								</c:forEach>
								<!-- /.single-slide -->


							</div>
						</div>
						<!-- ============================================================================== -->
						<div class="video-box">
							<h3 class="movie-title">자동차 관련 영상</h3>
							<div class="car-video-box">
								<div class="box1">
									
									<div class="col-sm-8 car-video carVideo" video-data="https://www.youtube.com/embed/ZIoTZo8p12g" 
									data-toggle="modal" data-target="#exampleModal">
											<img src="https://i.ytimg.com/vi/ZIoTZo8p12g/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLARWycarVideo2_s8BxLoCr3pSdDQ9hO0Jw"
											style="width: 500px; height: 305px;" />
									</div>
									
									<div class="col-sm-4 car-video1 carVideo" video-data="https://www.youtube.com/embed/w1psOj77-4E"
									data-toggle="modal" data-target="#exampleModal">
											<img src="https://i.ytimg.com/vi/w1psOj77-4E/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLBYvyEedX2PmmTW5Sg29ZMAObuPOA"
											style="width: 220px; height: 142px;" />
									</div>
									
									<div class="col-sm-4 car-video1 carVideo" video-data="https://www.youtube.com/embed/g-L0QAJo6W4"
									data-toggle="modal" data-target="#exampleModal">
											<img src="https://i.ytimg.com/vi/g-L0QAJo6W4/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLC_diaOEsdL-UrMpZ7feh1hzXeheg"
											style="width: 220px; height: 142px;" />
									</div>
								</div>

								<div class="box2">
									<div class="col-sm-4 car-video1 carVideo" video-data="https://www.youtube.com/embed/4RqNYxLfEmY"
									data-toggle="modal" data-target="#exampleModal">
											<img src="https://i.ytimg.com/vi/4RqNYxLfEmY/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLCxlTTsBoGaygL73GyRgqdKVsufAg"
											style="width: 220px; height: 143px;" />
									</div>

									<div class="col-sm-4 car-video1 carVideo" video-data="https://www.youtube.com/embed/znV572zbOeM"
									data-toggle="modal" data-target="#exampleModal">
											<img src="https://i.ytimg.com/vi/znV572zbOeM/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLDD37vHJC84QqChWCDJIkM_n0-dMw"
											style="width: 220px; height: 143px;" />
									</div>

									<div class="col-sm-4  car-video1 carVideo" video-data="https://www.youtube.com/embed/VBxCm5TYktM"
									data-toggle="modal" data-target="#exampleModal">
											<img src="https://i.ytimg.com/vi/VBxCm5TYktM/hqdefault.jpg?sqp=-oaymwEZCPYBEIoBSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLCZYHBRxRJ3_qCgulsCWxlgE-6qZw"
											style="width: 220px; height: 142px;" />
									</div>
								</div>
							</div>
						</div>


						<!-- modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1"
							role="dialog" aria-hidden="true" style="margin-top: 250px;">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-body"
										style="padding-left: 0px; padding-top: 0px; padding-right: 0px; background-color: black;">
										<div class="qwick-view">
											<div class="qwick-view-content">
												<iframe id="box" width="100%" height="350" src=""
													frameborder="0"></iframe>

												<div class="quickview-plus-minus">
													<div class="quickview-btn-cart text-right"
														style="padding-right: 10px; height: 10px; background-color: black">
														<a class="btn-style" data-dismiss="modal"
															aria-label="Close"><font style="color: white; font-weight: bold;">닫기</font></a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 인기 순위 =======================================================-->
						<div class="car-popularity-ranking">
							<h3 class="compare">자동차 인기 순위</h3>

							<c:forEach var="p" items="${poList }">
								<div class="car-ranking">
									<a href="../car/car_detail.do?cno=${p.car_num }"> 
										<img src="${p.car_poster }"> 
										<br><font size="3" style="font-weight: bold; color: balck;">${p.car_name }</font>
										<c:if test="${!fn:contains(p.car_price,'미정') }">
											<br><font size="2" style="font-weight: bold;">${p.car_price }</font>만원
										</c:if>
										<c:if test="${fn:contains(p.car_price,'미정') }">
											<br><font size="2" style="font-weight: bold;">${p.car_price }</font>
										</c:if>
										<br><font size="2" style="font-weight: bold;">${p.car_launchDate }</font> 출시
									</a>
								</div>
							</c:forEach>

						</div>
					</div>
					<!-- article -->

				</div>
				<!-- aside.jsp -->
				<jsp:include page="${main_jsp }"></jsp:include>
			</div>
		</section>
	</div>
	<!-- footer.jsp -->
	<jsp:include page="../cmmn/default-footer.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript
         ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="../js/main_js/mooz.scripts.min.js"></script>
</body>
</html>