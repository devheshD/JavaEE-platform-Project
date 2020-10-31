<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,java.text.*,com.sist.dao.*,com.sist.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">

<title>Blog Column 3</title>
<style>
.center {
	text-align: center;
}

#s {
	text-align: center;
	padding-bottom: 20px;
	padding-top: 20px;
	height: 70px;
	font-size: 24px;
}

.fa-angle-end:before{
	content:">>";
}
.fa-angle-start:before{
	content:"<<";
}
</style>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="../images/news_img/favicon.ico">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="../css/news_css/bootstrap.min.css">
<link rel="stylesheet" href="../css/news_css/font-awesome.min.css">
<link rel="stylesheet" href="../css/news_css/owl.carousel.css">
<link rel="stylesheet" href="../css/news_css/owl.theme.css">
<link rel="stylesheet" href="../css/news_css/owl.transitions.css">
<link rel="stylesheet" href="../css/news_css/meanmenu.css">
<link rel="stylesheet" href="../css/news_css/normalize.css">
<link rel="stylesheet" href="../css/news_css/main.css">
<link rel="stylesheet" href="../css/news_css/style.css">
<link rel="stylesheet" href="../css/news_css/responsive.css">
<script src="../js/news_js/vendor/modernizr-2.8.3.min.js"></script>
<!-- all css here -->
<link rel="stylesheet" href="../css/car_css/animate.css">
<link rel="stylesheet" href="../css/car_css/owl.carousel.min.css">
<link rel="stylesheet" href="../css/car_css/chosen.min.css">
<link rel="stylesheet" href="../css/car_css/jquery-ui.css">
<link rel="stylesheet" href="../css/car_css/meanmenu.min.css">
<link rel="stylesheet" href="themify-icons/themify-icons.css">
<link rel="stylesheet" href="../css/car_css/icofont.css">
<link rel="stylesheet" href="../css/car_css/font-awesome.min.css">
<link rel="stylesheet" href="../css/car_css/bundle.css">
<link rel="stylesheet" href="../css/car_css/style.css">
<link rel="stylesheet" href="../css/car_css/responsive.css">
<script src="../js/car_js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body>
	<jsp:include page="../cmmn/default-nav.jsp"></jsp:include>


	<!-- slider-area start -->
	<div id="slider" class="slider-area">
		<div id="top-carousel" class="slider-wrap">
		  <c:forEach var="vo" items="${list }" begin="1" end="9">
			<div class="single-slide">
				<a href="newsDetail.do?news_no=${vo.news_no }"><img src=${vo.detail_img } alt="Slide Image" style="width: 850px; height: 400px;"/></a>
				<div class="slide-text-container text-center">
					<h5>
						<a href="newsDetail.do?news_no=${vo.news_no }">${vo.title }</a>
					</h5>
				</div>
			</div>
		 </c:forEach>
		</div>
		<!-- /#top-carousel -->
	</div>
	<!-- slider-area end -->





	<!-- search-area start -->
	<div class="search-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="search-form">
						<span class="search-close"></span>
						<form action="#" method="post">
							<input type="text" placeholder="Search here..." />
							<button type="submit" class="search-btn">
								<i class="fa fa-search"></i>
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- search-area end -->





	<!-- blog-content-area start -->
	<div id="blog-content" class="blog-content-area fix">
		<div class="container">
			<div class="row">
				<c:forEach var="vo" items="${list }">
					<div class="col-md-4 col-sm-6">
						<div class="single-blog-post">
							<div class="post-img">
								<a href="newsDetail.do?news_no=${vo.news_no }">
								    <img src="${vo.detail_img }" alt=""	style="width: 360px; height: 190px;" /></a> 
								<a class="post-tag">${vo.news_company }</a>
								<div class="post-info">
									<p>
										<span class="post-date"><a href="#">${vo.news_date }</a></span>
										<span class="post-social-links"> <a href="#"
											data-toggle="tooltip" data-placement="bottom" title="Likes"><i
												class="fa fa-heart"></i></a> <a href="#" data-toggle="tooltip"
											data-placement="bottom" title="Facebook"><i
												class="fa fa-facebook"></i></a> <a href="#"
											data-toggle="tooltip" data-placement="bottom" title="Twitter"><i
												class="fa fa-twitter"></i></a> <a href="#" data-toggle="tooltip"
											data-placement="bottom" title="Google+"><i
												class="fa fa-google-plus"></i></a> <a href="#"
											data-toggle="tooltip" data-placement="bottom"
											title="Pinterest"><i class="fa fa-pinterest"></i></a>
										</span> <br> <span class="post-comments" style="border-right-width: 0px;"><a href="#">${vo.reporter }</a></span>
									</p>
								</div>
							</div>
							<div class="post-content">
								<h6 class="post-title">
									<a href="newsDetail.do?news_no=${vo.news_no }">${fn:substring(vo.title,0,24)}</a>
								</h6>
								<%-- ${fn:substring("1234"),시작인덱스, 종료인덱스} --%>
								<p class="post-short-desc">${fn:substring(vo.content,0,97) }</p>
								<a href="newsDetail.do?news_no=${vo.news_no }" class="continue-link">Continue
									Reading...</a>
							</div>
						</div>
						<!-- /.single-blog-post -->
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- blog-content-area end -->






<%-- 	<!-- pagination start -->

	<div class="container">
		<div class="row" id="s">
			<ul class="pagenation" style="display: inline;">
				<c:if test="${curpage>BLOCK }">
					<li style="display: inline;"><a href="news.do?page=1"><img
							src="../images/page_control/first.png"></a></li>
					<li style="display: inline;"><a
						href="news.do?page=${startPage-1}"><img
							src="../images/page_control/previous.png"></a></li>
				</c:if>

				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<li style="display: inline;"><a href="news.do?page=${i }">${i }</a></li>
				</c:forEach>

				<c:if test="${endPage<allPage }">
					<li style="display: inline;"><a
						href="news.do?page=${endPage+1}"><img
							src="../images/page_control/next.png"></a></li>
					<li style="display: inline;"><a
						href="news.do?page=${totalpage}"><img
							src="../images/page_control/end.png"></a></li>
				</c:if>
			</ul>
		</div>
	</div>
			<!-- pagination end --> --%>
	
	
	
<!-- 스타일 태그안에 추가해주기

.fa-angle-end:before{
	content:">>";
}
.fa-angle-start:before{
	content:"<<";
} 

-->
					<div class="paginations text-center mt-20">
							<ul>
								<c:if test="${curpage>BLOCK }">
									<li>
									  <a href="news.do?page=1"><i class="fa fa-angle-start"></i></a>
									</li>
									<li>
										<a href="news.do?page=${startPage-1 }&newsno=${newsno}"><i class="fa fa-angle-left"></i></a>
									</li>
								</c:if>
								<c:forEach var="i" begin="${startPage }" end="${endPage }">	
									<c:choose>
										<c:when test="${curpage eq i }">
											<c:set var="type" value="class=active"></c:set>
										</c:when>
										<c:otherwise>
											<c:set var="type" value=""></c:set>
										</c:otherwise>
									</c:choose>															
									<li ${type }><a href="news.do?page=${i }&newsno=${newsno}">${i }</a></li>									
								</c:forEach>
								<c:if test="${endPage<allPage }">
									<li>
										<a href="news.do?page=${endPage+1 }&news_no=${news_no}"><i class="fa fa-angle-right"></i></a>
									</li>
									<li>
										<a href="news.do?page=${totalpage}"><i class="fa fa-angle-end"></i></a>
									</li>
								</c:if>
							</ul>
						</div>








	<!-- footer-area start -->
	<jsp:include page="../cmmn/default-footer.jsp"></jsp:include>
	<!-- footer-area end -->

	<!-- jquery
		============================================ -->
	<script src="../js/news_js/vendor/jquery-1.11.3.min.js"></script>
	<!-- bootstrap JS
		============================================ -->
	<script src="../js/news_js/bootstrap.min.js"></script>
	<!-- meanmenu JS
		============================================ -->
	<script src="../js/news_js/jquery.meanmenu.js"></script>
	<!-- owl.carousel JS
		============================================ -->
	<script src="../js/news_js/owl.carousel.min.js"></script>
	<!-- scrollUp JS
		============================================ -->
	<script src="../js/news_js/jquery.scrollUp.min.js"></script>
	<!-- plugins JS
		============================================ -->
	<script src="../js/news_js/plugins.js"></script>
	<!-- main JS
		============================================ -->
	<script src="../js/news_js/main.js"></script>
</body>
</html>
