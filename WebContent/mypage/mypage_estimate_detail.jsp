<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<style type="text/css">
span#installmentBtn {
	vertical-align: text-bottom;
}
</style>
</head>
<body>

	<hr>
	<div class="col-sm-7">
		<h3 class="text-left">차량 기본 정보</h3>
		<div class="car_recipe">
			<table class="table">
				<tr>
					<th>차량 가격</th>
					<td class="text-right car_price"><fmt:formatNumber
							value="${car_estimate_vo.estimate_car_price}" pattern="#,###" />원</td>
				</tr>
				<tr>
					<th>옵션</th>
					<td class="text-right total_option_name"
						style="white-space: nowrap;">${car_estimate_vo.option_choice}</td>
				</tr>
				<tr>
					<th>옵션가격</th>
					<td class="text-right total_option_price"><fmt:formatNumber
							value="${car_estimate_vo.estimate_option_price}" pattern="#,###" />원</td>
				</tr>
				<tr class="total">
					<th>총 금액</th>
					<td class="text-right selected_total"><fmt:formatNumber
							value="${car_estimate_vo.estimate_total_price}" pattern="#,###" />원</td>
				</tr>
			</table>
		</div>
		<hr>

		<div id="installmentInfo">
			<h3 class="text-left">할부 정보</h3>
			<div class="option_recipe">
				<table class="table">
					<tr>
						<th>초기 납입금</th>
						<td class="text-right" id="budget"><fmt:formatNumber
								value="${car_estimate_vo.estimate_budget}" pattern="#,###" />원</td>
					</tr>
					<tr>
						<th>할부 원금</th>
						<td class="text-right debt"><fmt:formatNumber
								value="${car_estimate_vo.estimate_debt}" pattern="#,###" />원</td>
					</tr>
					<tr>
						<th>할부 기간</th>
						<td class="text-right months">${car_estimate_vo.estimate_months}개월</td>
					</tr>
					<tr class="total">
						<th>월 납입 금액</th>
						<td class="text-right option_recipe_monthly"><fmt:formatNumber
								value="${car_estimate_vo.monthly_installment}" pattern="#,###" />원</td>
					</tr>
				</table>
			</div>
			<hr>
		</div>
	</div>

	<div class="col-sm-5" style="padding-left: 100px; margin-top: 80px;">
		<img src="${carvo.car_poster}" width="80%">
		<div class="product_detail">
			<h1>${carvo.car_name }</h1>
			<ul class="pro__prize">
				<li class="old__prize">${carvo.car_launchDate }</li>
				<li class="selected_trim_name">${carvo.car_price }만원</li>
			</ul>
			<p class="pro__info">복합연비 ${carvo.car_efficiency } |
				${carvo.car_size } | ${carvo.car_fuelType }</p>
		</div>
	</div>

</body>
</html>