<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>인생 뽑차</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="../images/accessory_img/favicon.ico">
<link rel="apple-touch-icon" href="apple-touch-icon.png">
<link rel="stylesheet" href="../css/main_css/bootstrap.min.css">
<link rel="stylesheet" href="../css/accessory_css/owl.carousel.min.css">
<link rel="stylesheet"
	href="../css/accessory_css/owl.theme.default.min.css">
<link rel="stylesheet" href="../css/accessory_css/core.css">
<link rel="stylesheet"
	href="../css/accessory_css/shortcode/shortcodes.css">
<link rel="stylesheet" href="../css/accessory_css/style.css">
<link rel="stylesheet" href="../css/accessory_css/responsive.css">
<link rel="stylesheet" href="../css/accessory_css/custom.css">
<script src="../js/accessory_js/vendor/modernizr-3.5.0.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		
		/* $("input:hidden[name='no']").val(no); */
		
		$('.approval').click(function() {
			var no = $(this).attr("appNo");
			$("input:hidden[name='no']").val(no);
			
			alert("승인 요청했습니다.");
			 $('#frm2').submit();
		});
	});
</script>
<style type="text/css">
#contain { margin-left: 200px; }
.ht__bradcaump__area { height: 500px; }
.breadcrumb-item { font-size: 45px; position: relative; top: 90px; }
.headName { position: relative; left: 450px;}
#contain{ margin-left: 100px;}
</style>
</head>
<body>
	<jsp:include page="../cmmn/default-nav.jsp"></jsp:include>
	<!-- Body main wrapper start -->
	<div class="wrapper">
		<!-- Start Bradcaump area -->
		<div class="ht__bradcaump__area"
			style="background: rgba(0, 0, 0, 0) url(../images/mypage_img/mypage_img.jpg) no-repeat scroll center center/cover;">
			
		</div>
		<!-- End Bradcaump area -->

		<!-- Start Product Grid -->
		<section class="htc__product__grid bg__white ptb--100">
			<div class="container" id="contain">
				<div
					class="col-lg-9 col-lg-push-3 col-md-9 col-md-push-3 col-sm-12 col-xs-12"
					id="print">
					<div class="htc__product__rightidebar">
						<!-- Start Product View -->
						<div class="row">
							<h2 class="headName">시승 신청 내역 조회</h2>
							<div class="shop__grid__view__wrap">
								<div role="tabpanel" id="grid-view"
									class="single-grid-view tab-pane fade in active clearfix">
									<!-- cart-main-area start -->
									<div class="cart-main-area ptb--30 bg__white">
										<div class="container">
											<div class="row">
												<div class="col-md-12 col-sm-12 col-xs-12">
													<form action="mypage_admin.do" method="post" id="frm2">
														<div class="table-content table-responsive">
															<table class="table table-hover">
																<thead>
																	<tr class="active">
																	    <th class="product-name">Model</th>
																		<th class="product-name">Agency Name</th>
																		<th class="product-price">ID</th>
																		<th class="product-quantity">Passenger Name</th>
																		<th class="product-quantity">Phone Number</th>
																		<th class="product-quantity">Reservation Date</th>
																		<th class="product-subtotal">Approval Check</th>																		
																	</tr>
																</thead>
																<tbody>
																 <c:forEach var="vo" items="${list }">
																 	
																	<tr>
																	    <td class="product-name" style="padding-top: 20px;">${vo.model }</td>
																		<td class="product-name" style="padding-top: 20px;">${vo.agency_name }</td>
																		<td class="product-price" style="padding-top: 20px;">${vo.id }</td>
																		<td class="product-quantity" style="padding-top: 20px;">${vo.passenger }</td>
																		<td class="product-quantity" style="padding-top: 20px;">${vo.tel }</td>
																		<td class="product-quantity" style="padding-top: 20px;">${vo.reserve_date }</td>
																		<td class="product-subtotal">
																			<c:if test="${vo.approval_num == 0 }">
																				<input type="button" class="btn btn-sm btn-primary approval" appNo="${vo.no }" value="승인"/>
																				<input class="ff" type="hidden" name="no" value="">
																			</c:if>
																			<c:if test="${vo.approval_num == 1 }">
																				예약 완료
																			</c:if>
																			
																		</td>
																	</tr>
																</c:forEach>
																</tbody>
															</table>
														</div>													

													</form>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<div class="htc__banner__area">
		<ul class="banner__list owl-carousel owl-theme clearfix">
			<li><a href="product-details.html"><img
					src="../images/accessory_img/banner/bn-3/1.jpg" alt="banner images"></a></li>
			<li><a href="product-details.html"><img
					src="../images/accessory_img/banner/bn-3/2.jpg" alt="banner images"></a></li>
			<li><a href="product-details.html"><img
					src="../images/accessory_img/banner/bn-3/3.jpg" alt="banner images"></a></li>
			<li><a href="product-details.html"><img
					src="../images/accessory_img/banner/bn-3/4.jpg" alt="banner images"></a></li>
			<li><a href="product-details.html"><img
					src="../images/accessory_img/banner/bn-3/5.jpg" alt="banner images"></a></li>
			<li><a href="product-details.html"><img
					src="../images/accessory_img/banner/bn-3/6.jpg" alt="banner images"></a></li>
			<li><a href="product-details.html"><img
					src="../images/accessory_img/banner/bn-3/1.jpg" alt="banner images"></a></li>
			<li><a href="product-details.html"><img
					src="../images/accessory_img/banner/bn-3/2.jpg" alt="banner images"></a></li>
		</ul>
	</div>
	<jsp:include page="../cmmn/default-footer.jsp"></jsp:include>
	<script src="../js/accessory_js/vendor/jquery-3.2.1.min.js"></script>
	<script src="../js/accessory_js/bootstrap.min.js"></script>
	<script src="../js/accessory_js/plugins.js"></script>
	<script src="../js/accessory_js/slick.min.js"></script>
	<script src="../js/accessory_js/owl.carousel.min.js"></script>
	<script src="../js/accessory_js/waypoints.min.js"></script>
	<script src="../js/accessory_js/main.js"></script>
</body>
</html>