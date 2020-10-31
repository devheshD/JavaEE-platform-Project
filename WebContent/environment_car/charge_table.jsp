<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bbe730b25e58d27f83029a15154fa8af&autoload=false&libraries=services"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('.charge_detail').click(function() {
		var addr = $(this).children('td.addr').text();
		var charge_name = $(this).children('td.charge_name').text();
		
		$.ajax({
			type : "post",
			url : "charge_addr.do",
			data : {
					"addr" : addr,
					"charge_name" : charge_name
			},
			success : function(response){
				$('#addrMap').html(response);
			}
		});		

		var offset = $("#charge_table").offset();
	    $('html, body').animate({scrollTop : offset.top});
	});
});
</script>
<style>
#charge_table {
	width: 100%;
	background-color: #f3f3f3;
	text-align: center;
}

#charge_table tbody {
	display: block;
	height: 500px;
	overflow: auto;
}

#charge_table tr {
	width: 100%;
	display: table;
}

#charge_table th {
	text-align: center;
	background-color: #ffb52f;
	border-color: #e67e22;
}
</style>
</head>
<body>
	<table class="table table-hover" id="charge_table">
		<thead>
			<tr>
				<th class="col-xs-1">연료</th>
				<th class="col-xs-3">충전소 이름</th>
				<th class="col-xs-4">주소</th>
				<th class="col-xs-3">전화번호</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${sessionScope.charge}">
				<tr class="charge_detail">
					<td class="col-xs-1">${vo.fuel}</td>
					<td class="col-xs-3 charge_name">${vo.charge_name}</td>
					<td class="col-xs-4 addr">${vo.addr}</td>
					<td class="col-xs-3">${vo.tel}</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
</body>
</html>