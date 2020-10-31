<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${count != 0 }">
		<div class="col-sm-6 contents scroll" id="option">
			<ul class="checkList">
				<c:forEach var="vo" items="${oList}">
					<li><label><input type="checkbox" opname="${vo.option_name}" 
							value="${vo.option_price}" name=chk>
							&nbsp;${vo.option_name}</label>
						<span class="price">${vo.option_price}원</span></li>
				</c:forEach>
			</ul>
		</div>
	</c:if>

	<c:if test="${count == 0 }">
		<div class="col-sm-6 contents scroll" id="option">
			<h2>옵션이 없습니다.</h2>
		</div>
	</c:if>

</body>
</html>