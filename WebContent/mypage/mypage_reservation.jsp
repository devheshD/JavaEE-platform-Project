<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>인생 뽑차</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="../images/accessory_img/favicon.ico">
<link rel="apple-touch-icon" href="apple-touch-icon.png">
<link rel="stylesheet" href="../css/main_css/bootstrap.min.css">
<link rel="stylesheet" href="../css/accessory_css/owl.carousel.min.css">
<link rel="stylesheet" href="../css/accessory_css/owl.theme.default.min.css">
<link rel="stylesheet" href="../css/accessory_css/core.css">
<link rel="stylesheet" href="../css/accessory_css/shortcode/shortcodes.css">
<link rel="stylesheet" href="../css/accessory_css/style.css">
<link rel="stylesheet" href="../css/accessory_css/responsive.css">
<link rel="stylesheet" href="../css/accessory_css/custom.css">
<script src="../js/accessory_js/vendor/modernizr-3.5.0.min.js"></script>

<style type="text/css">
#contain { margin-left: 200px;}
.ht__bradcaump__area { height: 500px; }
.breadcrumb-item { font-size: 45px; position: relative; top: 90px;}
.headName { position: relative; left: 450px; }
.old__prize{
 text-decoration:line-through 
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('.reservation_cancel').click(function() {
			
			var no = $(this).attr("cancelNo");
			$("input:hidden[name='no']").val(no);
		
			if (confirm("시승예약을 취소하시겠습니까?")) {
					
		       alert("시승 예약이 취소되었습니다.");      
		    }
			
			$('#frm').submit(); 
		
		});
		
	});
	
	
</script>
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
						<div class="htc__product__rightidebar">
	<!-- Start Product View -->

<div class="row">
	<h2 class="headName">시승신청 내역</h2>
		<div class="shop__grid__view__wrap">
			<div role="tabpanel" id="grid-view"
				class="single-grid-view tab-pane fade in active clearfix">
				<!-- cart-main-area start -->
				<div class="cart-main-area ptb--30 bg__white">
					<div class="container">
						<div class="row">
							<div class="col-md-12 col-sm-12 col-xs-12">
								<form method="post" action="reservation_cancel.do" id="frm">
									<div class="table-content table-responsive">							
										<table class="table table-hover">
											<thead>
												<tr class="active">
													<th class="product-thumbnail">시승차량</th>
													<th class="product-name">시승센터</th>
													<th class="product-price">시승일시</th>
													<th class="product-price">시승 승인 현황</th>
													<th class="product-quantity">취소</th>
												</tr>
											</thead>
											<tbody>
											 <c:forEach var="vo" items="${list }">
												<tr>
													<td class="product-thumbnail" style="padding-top: 13px;font-size: medium;font-weight: 600;">${vo.model }</td>
													<td class="product-name" style="padding-top: 13px;font-size: medium;font-weight: 600;">${vo.agency_name }</td>
													<td class="product-price" style="padding-top: 13px;font-size: medium;font-weight: 600;">${vo.reserve_date }</td>
													<c:if test="${vo.approval_num == 0 }">
													<td class="product-price" style="padding-top: 13px;font-size: medium;font-weight: 600;">예약 대기</td>
													</c:if>
													<c:if test="${vo.approval_num == 1 }">
													<td class="product-price" style="padding-top: 13px;font-size: medium;font-weight: 600;">예약 완료</td>
													</c:if>
													<c:if test="${vo.approval_num == 0 }">
													<td class="product-quantity">																																	
														<input type="button" class="btn btn-sm btn-active reservation_cancel" value="취소" cancelNo="${vo.no }">
														<input type="hidden" name="no" value="">																															
													</td>
													</c:if>	
													<c:if test="${vo.approval_num == 1 }">
													<td class="product-price" style="padding-top: 13px;font-size: medium;font-weight: 600;">취소 불가</td>
													</c:if>
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
				<div
					class="col-lg-3 col-lg-pull-9 col-md-3 col-md-pull-9 col-sm-12 col-xs-12 smt-40 xmt-40">
					<div class="htc__product__leftsidebar">
						<!-- Start Prize Range -->

						<div class="content-shopby">
							<div class="price_filter s-filter clear"></div>
						</div>
					</div>
					<!-- End Prize Range -->
					<!-- Start Category Area -->
					<div class="htc__category">
						<h4 class="title__line--4">MyPage</h4>
						<ul class="ht__cat__list">
							<li><a href="../mypage/mypage_estimate.do">견적내역</a></li>
							<li><a href="mypage_reservation.do">시승신청내역</a></li>
							<li><a href="../mypage/mypage_accCart.do">액세서리찜</a></li>
							<li><a href="../mypage/mypage_acc.do">액세서리주문내역</a></li>
						</ul>
					</div>
				</div>
			</div>
		</section>
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