<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
.qwick-view-content{
	width: 700px;
	height: 500px; 
	padding-left: 100px;
}

#mPoster{
	width: 600px;
	height: 300px;	
}

.cbtn{
	margin-left: 500px;
}


</style>
</head>
<body>
	<div class="grid-list-product-wrapper tab-content">
		<div id="new-product"
			class="product-grid product-view tab-pane active">
			<div class="row">


				<%-- --%>
				<c:if test="${cList.size() == 0}">
					<div class="product-width col-md-6 col-xl-4 col-lg-6">
						<h3>검색된 차량이 없습니다.</h3>
					</div>
				</c:if>

				<c:if test="${cList.size() != 0 }">
					<c:forEach var="vo" items="${cList }">
						<div class="product-width col-md-6 col-xl-4 col-lg-6">
							<div class="product-wrapper mb-35">
								<div class="product-img" style="height: 300px;">
									<a href="car_detail.do?cno=${vo.car_num }"> 
										<img src="${vo.car_poster }" alt="">
									</a>

									<div class="product-action">
										<a class="action-plus-2 p-action-none" title="Add To Cart" href="car_estimate.do?cno=${vo.car_num }"> 
											<i class=" ti-shopping-cart"></i>
										</a> 
										<!-- <a class="action-cart-2" title="Wishlist" href="#"> 
											<i class=" ti-heart"></i>
										</a>  -->
										<a class="action-reload" title="Quick View" data-toggle="modal" data-target="#exampleModal" href="#" 
											posterVal="${vo.car_poster }" nameVal="${vo.car_name }">
											<i class=" ti-zoom-in"></i>
										</a>
									</div>

									<div class="product-content-wrapper">
										<div class="product-title-spreed">
											<h4>
												<c:forEach var="bvo" items="${bList }">
													<c:if test="${vo.brand_name eq bvo.brand_name }">
														<img style="width: 40px; height: 30px;"
															src="${bvo.brand_image }">
													</c:if>
												</c:forEach>
												<a href="product-details.html">${vo.car_name }</a>
											</h4>
											
											<c:if test="${vo.car_price eq '미정' }">
												<h5>가격 ${vo.car_price }</h5>
											</c:if>
											<c:if test="${vo.car_price != '미정' }">
												<h5>${vo.car_price }만원</h5>
											</c:if>
											
										</div>
									</div>
									<div class="product-item-dec" style="top: 250px">
										<ul>
											<li>${vo.car_launchDate }출시	</li>
											
											<c:if test="${vo.car_size != null}">
												<li>${vo.car_size }</li>
											</c:if>											
											
											<c:if test="${vo.car_fuelType != null }">
												<li>${vo.car_fuelType }</li>
											</c:if>											
											
											<c:if test="${vo.car_efficiency != null }">
												<li>복합연비 ${vo.car_efficiency }</li>
											</c:if>
											
										</ul>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					
					<!-- modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1"
						role="dialog" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-body">
									<div class="qwick-view">
										<div class="qwick-view-content">
											<img src="" id="mPoster">
																						
											<div class="quickview-plus-minus">
												<div class="quickview-btn-cart">
													<h1 id="mName"></h1>
													<br>
													<a class="btn-style cbtn" data-dismiss="modal"
														aria-label="Close">Close</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:if>

				<%-- --%>


			</div>
		</div>
	</div>
</body>
</html>