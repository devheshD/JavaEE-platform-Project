<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link rel="stylesheet" href="../css/accessory_css/shortcode/shortcodes.css">
<link rel="stylesheet" href="../css/accessory_css/style.css">
<link rel="stylesheet" href="../css/accessory_css/responsive.css">
<link rel="stylesheet" href="../css/accessory_css/custom.css">
<script src="../js/accessory_js/vendor/modernizr-3.5.0.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<style type="text/css">

/* 전체적인 틀 */
#contain { margin-left: 400px; }
.ht__bradcaump__area { height: 500px; }
.headName { position: relative; left: 480px; margin-top: 40px; margin-bottom: 40px; float: left;}
select.input-sm{ width: 72px;}
input.input-sm{ width: 224px;}
li.menuBtn{float: left;}
ul.paginations{list-style: none;}
a.insert{width:46px; position:relative; left: 930px; top: 39px;}
td.insert a {position:relative; right:30px;}

/*---------*/
/* 테이블  */
th, td { padding: 6px 8px; vertical-align: top; white-space: nowrap;}
th { background: #ddd; font-weight: 900; text-align: left; white-space: nowrap; }
tbody tr:nth-child(odd) { background: #f3f3f3;}
/*---------*/
/* 페이지 버튼  */
.pagination { list-style: none; display: inline-block; padding: 0;}
.pagination li { display: inline; text-align: center; }
.pagination a { float: left; display: block; font-size: 14px; text-decoration: none; padding: 5px 12px; color: #fff; margin-left: -1px; border: 1px solid transparent;line-height: 1.5;}
.pagination a.active {cursor: default;}
.pagination a:active {outline: none;}
.modal-1 li:first-child a {-moz-border-radius: 6px 0 0 6px; -webkit-border-radius: 6px; border-radius: 6px 0 0 6px;}
.modal-1 li:last-child a { -moz-border-radius: 0 6px 6px 0; -webkit-border-radius: 0; border-radius: 0 6px 6px 0;}
.modal-1 a { border-color: #ddd; color: #4285F4; background: #fff;}
.modal-1 a:hover {background: #eee; }
.modal-1 a.active, .modal-1 a:active { border-color: #4285F4; background: #4285F4; color: #fff;}
ul.pagination { margin-top: 0px; margin-bottom: 0px;}
/*---------*/
</style>
</head>
<body>
	<jsp:include page="../cmmn/default-nav.jsp"></jsp:include>
	<!-- Body main wrapper start -->
	<div class="wrapper">
		<!-- Start Bradcaump area -->
		<div class="ht__bradcaump__area"
			style="background: rgba(0, 0, 0, 0) url(../images/board_img/board.jpg) no-repeat scroll center center/cover;">
			<div class="ht__bradcaump__wrap">
				<div class="container">
					<div class="row">
						<div class="col-xs-12">
							<div class="bradcaump__inner">
								<nav class="bradcaump-inner"></nav>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End Bradcaump area -->
	
		<!-- Start Product Grid -->
		<section class="htc__product__grid bg__white ptb--100">
			<div class="container" id="contain">
					<div class="htc__product__rightidebar">
						<!-- Start Product View -->
						<div class="row">
							<h2 class="headName">검색결과:${count }개</h2>
							<a class="btn btn-sm btn-info insert" href="board.do">목록</a>
											
							<table class="table table-hover">							
								<tr>
									<th width=10% class="text-center">번호</th>
									<th width=45% class="text-center">제목</th>
									<th width=15% class="text-center">이름</th>
									<th width=20% class="text-center">작성일</th>
									<th width=10% class="text-center">조회수</th>
								</tr>
														
								<c:forEach var="vo" items="${list }">
									<tr>
										<td width=10% class="text-center">${vo.no }</td>
										<td width=45% class="text-center"><a href="../board/detail.do?no=${vo.no }" id="detail">${vo.subject }</a>
										&nbsp;
								           <c:if test="${vo.rcount>0 }">
								            (${vo.rcount })
								           </c:if>
										</td>
										<td width=15% class="text-center">${vo.name }</td>
										<td width=20% class="text-center">    
											<fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/>
										</td>
										<td width=10% class="text-center">${vo.hit }</td>
									</tr>
								</c:forEach>
							</table>						
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