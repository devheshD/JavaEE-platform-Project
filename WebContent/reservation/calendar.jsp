<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<script type="text/javascript">
/* 시승 날짜 달력 이벤트 */
$('.sel_date').click(function() {
		var year = $(this).attr("year");
		var month = $(this).attr("month");
		var day = $(this).text();
		$('.model_date').text(year + "년 " + month + "월 " + day + "일");		
		$('#calendarData').val(year + "년 " + month + "월 " + day + "일");
		 
	});

</script>
<body>

<table id="table_content">
		<tr>						
			<c:forEach var="s" items="${strWeek }">		<!-- {"일", "월", "화", "수", "목", "금", "토"} -->
				<c:choose>
					<c:when test="${s eq '일' }">
						<th class="text-center" style="color:red">${s }</th>
					</c:when>
					<c:otherwise>
						<th class="text-center">${s }</th>
					</c:otherwise>
				</c:choose>								
			</c:forEach>
		</tr>
		
		<c:set var="week" value="${week-1 }" />			<!-- week = {"일=1", "월=2", "화=3", "수=4", "목=5", "금=6", "토=7"} -->
		<c:forEach var="i" begin="1" end="${lastDay }">
			<c:if test="${i==1 }">
			
				<!-- 요일 띄어놓기 -->
				<tr height="45">
					<c:forEach var="j" begin="1" end="${week }">	<!-- 1일 전의 날짜들 공백 채우기  -->
						<td>&nbsp;</td>
					</c:forEach>
			</c:if>
			<c:set var="color" value="white" />
			<!-- String color="white" -->
			
			<c:if test="${i!=day }">
				<c:set var="color" value="white" />
			</c:if>
			<td class="text-center" bgcolor="${color }">							
				 <a class="sel_date" year="${year }" month="${month }">${i }</a>								
			</td>
			<c:set var="week" value="${week+1 }" />
			<!-- week=week+1 -->
			<c:if test="${week>6 }">				<!-- 토요일(7)보다 크면 한줄 내리기 -->
				</tr>
				
				<c:set var="week" value="0" />		<!-- 일요일(0)부터 다시 시작 -->
				<tr height="45">
			</c:if>
		</c:forEach>
		</tr>
	</table>
</body>
</html>