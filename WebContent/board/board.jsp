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
<script type="text/javascript">
	$(function() {
		$('.insert').click(function() {
			$.ajax({
				type : 'POST',
				url : 'insert.jsp',
				success : function(res) {
					$('#print').html(res);
				}
			});
		});
	});
</script>
<style type="text/css">

/* 전체적인 틀 */
#contain { margin-left: 400px; }
.ht__bradcaump__area { height: 500px; }
.headName { position: relative; left: 480px; margin-top: 40px; margin-bottom: 40px; }
select.input-sm{ width: 72px;}
input.input-sm{ width: 224px;}
li.menuBtn{float: left;}
ul.paginations{list-style: none;}
td.insert{width:46px;}
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
						<div class="row" id="print">
							<h2 class="headName">문의 게시판</h2>
															
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
										<td width=10% class="text-center">${vo.no }	</td>
										<td width=45% class="text-left"><a href="../board/detail.do?no=${vo.no }" id="detail">${vo.subject }</a>
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
							<table class="table">
								<tr>
									<td class="text-left in" valign="middle">
										<form method="post" action="board_find.do">
											Search: <select name="fs" class="input-sm">
														<option value="name">이름</option>
														<option value="subject">제목</option>
														<option value="content">내용</option>
													</select> 
													<input type=text name=ss size=12 class="input-sm"> 
													<input type=submit value="찾기" class="btn btn-sm btn-info">
										</form>
									</td>
									
									
									<td class="text-center in" valign="top">										
										
										<ul class="pagination modal-1">

										<c:if test="${curPage>BLOCK }">
											<li class="menuBtn">
												<a href="../board/board.do?page=1">&laquo;</a>
											</li>
																					
											<li class="menuBtn">
												<a href="../board/board.do?page=${startPage-1 }">&lt;</a>
											</li>
											</c:if>
										
											<c:set var="type" value=""/>
									           <c:forEach var="i" begin="${startPage }" end="${endPage }">
									             <c:if test="${curPage==i }">
									              <c:set var="type" value="class=active"/>									          
									             </c:if>
									             <c:if test="${curPage!=i }">
									              <c:set var="type" value=""/>
									             </c:if>
									             <li><a ${type } href="../board/board.do?page=${i }">${i }</a></li>
									           </c:forEach>
										
										 <c:if test="${endPage<allPage }">
											<li>
												<a href="../board/board.do?page=${endPage+1 }">&gt;</a>
											</li>
											<li>
												<a href="../board/board.do?page=${allPage }">&raquo;</a>
											</li>
											</c:if>
											
										</ul>
									</td>
								
									<td class="insert"><a class="btn btn-sm btn-info">새글</a></td>
						
								</tr>
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