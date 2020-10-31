<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Oswan - eCommerce HTML5 Template</title>
<meta name="description"
	content="Live Preview Of Oswan eCommerce HTML5 Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="../images/car_img/favicon.png">

<!-- all css here -->
<link rel="stylesheet" href="../css/car_css/animate.css">
<link rel="stylesheet" href="../css/car_css/owl.carousel.min.css">
<link rel="stylesheet" href="../css/car_css/chosen.min.css">
<link rel="stylesheet" href="../css/car_css/jquery-ui.css">
<link rel="stylesheet" href="../css/car_css/meanmenu.min.css">
<link rel="stylesheet" href="themify-icons/themify-icons.css">
<link rel="stylesheet" href="../css/car_css/icofont.css">
<link rel="stylesheet" href="../css/car_css/font-awesome.min.css">
<link rel="stylesheet" href="../css/car_css/bundle.css">
<link rel="stylesheet" href="../css/car_css/style.css">
<link rel="stylesheet" href="../css/car_css/responsive.css">
<script src="../js/car_js/vendor/modernizr-2.8.3.min.js"></script>
<jsp:include page="../cmmn/default-nav.jsp"></jsp:include>

<style type="text/css">
.col-lg-6 {width: 30%; }

div.price input {
	width: 20%;
	height: 25px;
}

.button-group input{
  display: none;
}

.button-group input:checked + label,
.button-group input:checked + label:active {
  color: white;
  background-color: #ffb52f;
}

.product-tags .button-group label:hover {
    border: 1px solid #ffb52f;
    background-color: #ffb52f;
    color: #fff;
}

.fa-angle-end:before{
	content:">>";
}
.fa-angle-start:before{
	content:"<<";
}
.icofont-rounded-up:before{
	content:"∧";
}

</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	
	//modal
	$('.action-reload').click(function(){
		var mPoster=$(this).attr('posterVal');
		var mName=$(this).attr('nameVal');
		
		$('#mPoster').attr("src",mPoster);
		$('#mName').text(mName);
	});
	
	
	var offset = $(".container-fluid").offset();
	
	var cate = ${cateNo};		
	$('.cate').children().removeClass('active');
	$('#cate'+cate).addClass('active');		
	
	$('#findBtn').click(function(){
		$('html, body').animate({scrollTop : offset.top});
		var keyword=$('#keyword').val();
		if(keyword.trim()=="")
		{
			alert("검색어 입력");
			$('#keyword').focus();
			return;
		}			
		
		$.ajax({
			type:'post',
			url:'car_search.do',
			data:{"keyword":keyword},
			success:function(response)
			{
				$('#print').html(response)
			}
		});
	});
	
	$('#findPriceBtn').click(function(){
		var lowPrice=$('#lowPrice').val();
		var highPrice=$('#highPrice').val();	
		$('html, body').animate({scrollTop : offset.top});
		
		$.ajax({
			type:'post',
			url:'carPrice_search.do',
			data:{"lowPrice":lowPrice, "highPrice":highPrice},
			success:function(response)
			{
				$('#print').html(response)
			}
		});
	});
	
	$('#findDetailBtn').click(function(){
		
		
	    $('html, body').animate({scrollTop : offset.top});
	    
		var carsizeArr=[];
		var carfueltypeArr=[];
		$("input[name=chk1]:checked").each(function(){
			carsizeArr.push($(this).val());
		});
		$("input[name=chk2]:checked").each(function(){
			carfueltypeArr.push($(this).val());
		});				
		
		$.ajax({
			type:'post',
			url:'carDetail_search.do',
			traditional : true,
			data:{"carsizeArr":carsizeArr, "carfueltypeArr":carfueltypeArr},
			success:function(response)
			{	
				$('#print').html(response)
			}
		});
	});
});
</script>

</head>
<body>
	<div class="wrapper">
		<div class="breadcrumb-area pt-255 pb-170"
			style="background-image: url(../images/car_img/mainback.jpg)">
			<div class="container-fluid">
				<div class="breadcrumb-content text-center">
					<h2>인생뽑차 자동차</h2>
					<ul>
						<li>new car</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="shop-wrapper fluid-padding-2 pt-120 pb-150">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-3">
						<div class="product-sidebar-area pr-60">
							
							<!-- 자동차 검색(차 이름) -->
							<div class="sidebar-widget pb-55" style="margin-bottom: 0px;">
								<h3 class="sidebar-widget">Search Car</h3>
								<div class="sidebar-search">
									<form>
										<input type="text" placeholder="Search Products..." id="keyword">										
										<button type="button" id="findBtn">
											<i class="ti-search"></i>											
										</button>
									</form>
								</div>
							</div>
							
							<!-- 자동차 검색(가격) -->
							<div class="sidebar-widget mb-55">
								<h3 class="sidebar-widget">by price</h3>
								<div class="price_filter mr-60">
									<div class="price_slider_amount">
										<div class="price">
											<form>
												<input type="text" name="minprice" id="lowPrice"/> 만원 ~ 
												<input type="text" name="minprice" id="highPrice"/> 만원  					
											    <button type="button" class="btn btn-xs btn-warning" id="findPriceBtn">
											    	<i class="ti-search"></i>
											    </button>
										    </form>
										</div>
									</div>
								</div>
							</div>
							
							<!-- 자동차 상세검색(체크박스) -->
							<div class="sidebar-widget mb-45">
								<h3 class="sidebar-widget">Detail Search</h3>
								<div class="product-tags">
									<div class="button-group">
										<h6>차종</h6>
											<input id="checkbox1" type="checkbox" value="경형" name="chk1"> 
											<label class="button" for="checkbox1">경형</label> 
											<input id="checkbox2" type="checkbox" value="소형" name="chk1"> 
											<label class="button" for="checkbox2">소형</label> 
											<input id="checkbox3" type="checkbox" value="준중형" name="chk1"> 
											<label class="button" for="checkbox3">준중형</label>
											<input id="checkbox4" type="checkbox" value="중형" name="chk1"> 
											<label class="button" for="checkbox4">중형</label>
											<input id="checkbox5" type="checkbox" value="준대형" name="chk1"> 
											<label class="button" for="checkbox5">준대형</label> 
											<input id="checkbox6" type="checkbox" value="대형" name="chk1"> 
											<label class="button" for="checkbox6">대형</label> 
											<input id="checkbox7" type="checkbox" value="스포츠카" name="chk1"> 
											<label class="button" for="checkbox7">스포츠카</label> 
									</div>
									<hr>
									<div class="button-group">
										<h6>연료</h6>
											<input id="checkbox8" type="checkbox" value="휘발유" name="chk2"> 
											<label class="button" for="checkbox8">휘발유</label> 
											<input id="checkbox9" type="checkbox" value="경유" name="chk2"> 
											<label class="button" for="checkbox9">경유</label> 
											<input id="checkbox10" type="checkbox" value="LPG" name="chk2"> 
											<label class="button" for="checkbox10">LPG</label>
											<input id="checkbox11" type="checkbox" value="전기" name="chk2"> 
											<label class="button" for="checkbox11">전기</label>										
									</div>
									<hr>
									<div class="sidebar-search" style="padding-bottom: 80px;">
										<form>
											<button type="button" id="findDetailBtn">
												<i class="ti-search"></i>											
											</button>
										</form>
									</div>
								</div>
							</div>
							
							<!-- 최근 본 자동차 목록 -->
							<div class="sidebar-widget">
								<h3 class="sidebar-widget">최근 본 목록</h3>
								<c:forEach var="vo" items="${cookieList }" varStatus="s">
									<div class="best-seller">
										<c:if test="${cookieList.size() == 0 }">
											<h5>최근 본 목록이 없습니다.</h5>
										</c:if>	
										
										<c:if test="${cookieList.size() != 0 && s.index<10}">											
											<div class="single-best-seller">
												<div class="best-seller-img">
													<a href="car_detail.do?cno=${vo.car_num }"><img src="${vo.car_poster }" alt="" width="200px" height="90px"></a>
												</div>
												<div class="best-seller-text">
													<h3>
														<a href="car_detail.do?cno=${vo.car_num }">${vo.car_name }</a>
													</h3>
													<span>${vo.car_price }</span>
													<hr>																							
												</div>												
											</div>
										</c:if>																		
									</div>
								</c:forEach>
								
							</div>
						</div>
					</div>
					
					<div class="col-lg-9">
						<div class="shop-topbar-wrapper">
							<div class="grid-list-options">
								<h4>인생 뽑차 구매</h4>
							</div>
							<div class="product-sorting">
								<div class="shop-product-sorting nav cate">								
									<a id="cate1" class="active" href="car.do?cateNo=1">전체 </a>								
									<a id="cate2" class="" href="car.do?cateNo=2">최신순 </a>								 
									<a id="cate3" class="" href="car.do?cateNo=3">연비순 </a>								
									<a id="cate4" class="" href="car.do?cateNo=4">가격순</a>								
								</div>
							</div>
						</div>
						
						<%--자동차 리스트 출력 --%>
						<div id="print">
							<jsp:include page="${carList_jsp }"></jsp:include>

							<div class="paginations text-center mt-20">
								<ul>
									<c:if test="${curpage>BLOCK }">
										<li>
										  	<a href="car.do?page=1&cateNo=${cateNo}"><i class="fa fa-angle-start"></i></a>
										</li>
										<li>
											<a href="car.do?page=${startPage-1 }&cateNo=${cateNo}">
												<i class="fa fa-angle-left"></i>
											</a>
										</li>
									</c:if>
									<c:forEach var="i" begin="${startPage }" end="${endPage }">
										<c:choose>
											<c:when test="${curpage eq i }">
												<c:set var="type" value="class=active"></c:set>
											</c:when>
											<c:otherwise>
												<c:set var="type" value=""></c:set>
											</c:otherwise>
										</c:choose>
										<li ${type }><a href="car.do?page=${i }&cateNo=${cateNo}">${i }</a></li>
									</c:forEach>
									<c:if test="${endPage<allPage }">
										<li>
											<a href="car.do?page=${endPage+1 }&cateNo=${cateNo}">
												<i class="fa fa-angle-right"></i>
											</a>
										</li>
										<li>
											<a href="car.do?page=${allPage}&cateNo=${cateNo}">
												<i class="fa fa-angle-end"></i>											
											</a>
										</li>
									</c:if>
								</ul>
							</div>
						</div>
						<%-- --%>						
					</div>
				</div>
			</div>
		</div>
		



	</div>
	<jsp:include page="../cmmn/default-footer.jsp"></jsp:include>

	<!-- all js here -->
	<script src="../js/car_js/bootstrap.min.js"></script>
	<script src="../js/car_js/isotope.pkgd.min.js"></script>
	<script src="../js/car_js/imagesloaded.pkgd.min.js"></script>
	<script src="../js/car_js/jquery.counterup.min.js"></script>
	<script src="../js/car_js/waypoints.min.js"></script>

	<script src="../js/car_js/owl.carousel.min.js"></script>
	<script src="../js/car_js/plugins.js"></script>
	<script src="../js/car_js/main.js"></script>
</body>
</html>
