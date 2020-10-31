<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자동차 상세보기</title>
<link rel="stylesheet" href="css/style.css">
<style type="text/css">
ul {
	list-style: none;
	padding-left: 5px;
}

.top {
	padding-left: 100px;
}

.accordion-title {
	font-size: 20px;
}

.compare_table td, th {
	width: 30%;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.spec').click(function() {
		var trim_num = $(this).attr('value');
		var winHeight = 600;
		var winWidth = 800;
		
		var popupX = screen.width / 2 - winWidth / 2;
		//만들 팝업창 좌우 크기의 절반 만큼 보정값으로 빼주었음

		var popupY= screen.height / 2 - winHeight / 2;
		//만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음

		var popupOption = "scrollbars=yes, status=no, width=" + winWidth + ", height=" 
						+ winHeight + ', left='+ popupX + ', top='+ popupY;
		window.open("car_spec.do?trim_num=" + trim_num, "", popupOption);
		});
	
		
	});
</script>
</head>
<body>
	<header>
		<jsp:include page="../cmmn/default-nav.jsp"></jsp:include>
	</header>

	<div class="container">
		<div class="row top">
			<div class="col-sm-6">
				<img src="${carvo.car_poster }" width="100%">
			</div>
			<div class="col-sm-6">
				<div class="product_detail">
					<h1>${carvo.car_name }</h1>
					<ul class="pro__prize">
						<li class="old__prize">${carvo.car_launchDate }</li>
						<li>${carvo.car_price }만원</li>
					</ul>
					<p class="pro__info">복합연비 ${carvo.car_efficiency } |
						${carvo.car_size } | ${carvo.car_fuelType }</p>
					<div class="ht__pro__desc">
						<div class="sin__desc">
							<button class="btn btn-md btn-warning brand"
								onclick="location='car_brand.do?keyword=${carvo.brand_name}'">${carvo.brand_name}</button>
							<c:forEach var="modelvo" items="${modellist}">
								<c:set var="model_num" value="${modelvo.model_num}" />
								<c:if test="${fn:contains(model_num, '모델없음')}">
									<c:set var="nomodel" value="0" />
								</c:if>
								<c:if test="${!fn:contains(model_num, '모델없음')}">
									<c:set var="nomodel" value="1" />
								</c:if>

							</c:forEach>
							<c:if test="${fn:contains(carvo.car_price, '미정')}">
								<c:set var="nomodel" value="0" />
							</c:if>
							<c:if test="${nomodel == 1}">
								<button class="btn btn-md btn-primary"
									onclick="location='car_estimate.do?cno=${carvo.car_num}'">견적</button>
							</c:if>
							<button class="btn btn-md btn-success"
								onclick="location.href=document.referrer">목록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<hr>
	</div>

	<div class="container text-center">
		<h3 class="text-left" style="padding-left: 100px">시판중인 모델</h3>
		<c:forEach var="modelvo" items="${modellist}">
			<c:set var="model_num" value="${modelvo.model_num}" />
			<c:if test="${fn:contains(model_num, '모델없음')}">
				<h3>시판중인 모델이 없습니다.</h3>
			</c:if>
		</c:forEach>
		<br>
		<div class="row">
			<c:forEach var="modelvo" items="${modellist}">
				<c:set var="model_num" value="${modelvo.model_num}" />
				<c:if test="${!fn:contains(model_num, '모델없음')}">
					<dl class="accordion">
						<dt class="accordion-title">${modelvo.model_name}</dt>
						<dd class="accordion-list">
							<ul>
								<li><c:forEach var="trimvo" items="${trimlist}">
										<c:if test="${modelvo.model_num eq trimvo.model_num}">
											<div class="item name">${trimvo.trim_name}</div>
											<div class="item fuel">${trimvo.trim_fuel_type}</div>
											<div class="item engine">${trimvo.trim_cc}</div>
											<div class="item mileage">${trimvo.trim_efficiency}</div>
											<div class="item price">${trimvo.trim_price}</div>
											<div class="item button">
												<button class="btn btn-sm btn-info spec"
													value="${trimvo.trim_num}">제원</button>
											</div>
										</c:if>
									</c:forEach></li>
							</ul>
						</dd>
					</dl>
				</c:if>
			</c:forEach>

			<script
				src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
			<script src="js/index.js"></script>
		</div>
		<hr>
	</div>


	<div class="container text-center">
		<h3 class="text-left">경쟁차 비교</h3>
		<br>
		<div class="row">
			<div class="col-sm-4">
				<img src="${carvo.car_poster}">
				<p>${carvo.car_name }</p>
				<div class="well">
					<div class="sin__desc">
						<button class="btn btn-md btn-warning"
							onclick="location='car_brand.do?keyword=${carvo.brand_name}'">${carvo.brand_name}</button>
						<c:if test="${!fn:contains(carvo.car_price, '미정')}">
							<c:set var="nomodel" value="0" />
						</c:if>
						<c:if test="${fn:contains(carvo.car_price, '미정')}">
							<c:set var="nomodel" value="0" />
						</c:if>
						<c:if test="${nomodel == 1}">
							<button class="btn btn-md btn-primary"
								onclick="location='car_estimate.do?cno=${carvo.car_num}'">견적</button>
						</c:if>

					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<img src="http://img.chuing.net/i/NGQGVp/Preview.x.jpg" width="60%">
				<table class="table compare_table">
					<tr>
						<td>${carvo.car_efficiency }</td>
						<th class="text-center">복합연비</th>
						<td>${compvo.car_efficiency }</td>
					</tr>
					<tr>
						<td>${carvo.car_size }</td>
						<th class="text-center">외형</th>
						<td>${compvo.car_size }</td>
					</tr>
					<tr>
						<td>${carvo.car_fuelType }</td>
						<th class="text-center">연료</th>
						<td>${compvo.car_fuelType }</td>
					</tr>
					<tr>
						<td>${carvo.car_launchDate }</td>
						<th class="text-center">출시일</th>
						<td>${compvo.car_launchDate }</td>
					</tr>
					<tr>
						<td>${carvo.car_price }</td>
						<th class="text-center">가격 (만원)</th>
						<td>${compvo.car_price }</td>
					</tr>
				</table>
			</div>
			<div class="col-sm-4">
				<img src="${compvo.car_poster}">
				<p>${compvo.car_name}</p>
				<div class="well">
					<button class="btn btn-md btn-warning"
						onclick="location='car_brand.do?keyword=${compvo.brand_name}'">${compvo.brand_name}</button>
					<button class="btn btn-md btn-primary"
						onclick="location='car_detail.do?cno=${compvo.car_num}'">상세보기</button>
				</div>
			</div>
		</div>
		<hr>
	</div>

	<jsp:include page="../cmmn/default-footer.jsp"></jsp:include>
</body>
</html>