<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="default-header.jsp"></jsp:include>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script>
	var pageSubmitFn = function(menu) {
		
		if (menu === 'home') {
			location.href = "../main/main.do";
		} else if (menu === 'about') {
			location.href = "../about/about.do";
		} else if (menu === 'car') {
			location.href = "../car/car.do";
		} else if (menu === 'environment') {
			location.href = "../environment_car/environment_car.do";
		} else if (menu === 'guide') {
			location.href = "../guide/guide_main.do";
		} else if (menu === 'reservation') {
			location.href = "../reservation/reservation.do";
		} else if (menu === 'news') {
			location.href = "../news/news.do";
		} else if (menu === 'accessory') {
			location.href = "../acc/acc.do";
		} else if (menu === 'login') {
			location.href = "../login/login.do";
		} else if (menu === 'registration') {
			location.href = "../register/register.do";
		} else if (menu === 'registration modification') {
			location.href = "../register/registerModification.do";
		} else if (menu === 'mypage') {
			location.href = "../mypage/mypage_estimate.do";
		} else if (menu === 'mypage_admin') {
			location.href = "../mypage/mypage_admin.do";
		} else if (menu === 'board') {
			location.href = "../board/board.do"
		}
		
	}
	
	function logout() {
		
		// �ڹٽ�ũ��Ʈ���� ȭ�� �̵�(GET���)
		location.href="../member/logout.do";
		
		// logout.do => DisparcherServlet => MemberModel ==> JSP
		//                                   request.setAttribute()
	}
	
</script>
<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li class="menu active"><a href="#" onclick="pageSubmitFn('home')">Home</a></li>
				<li class="menu"><a href="#" onclick="pageSubmitFn('about')">about</a></li>
				<li class="menu"><a href="#" onclick="pageSubmitFn('car')">����</a></li>
				<li class="menu"><a href="#" onclick="pageSubmitFn('environment')">ģȯ����</a></li>
				<li class="menu"><a href="#" onclick="pageSubmitFn('guide')">���̵�</a></li>
				<c:if test="${sessionScope.id!=null && sessionScope.id!='admin' }">
					<li class="menu"><a href="#" onclick="pageSubmitFn('reservation')">�ý¿���</a></li>
				</c:if>
				<li class="menu"><a href="#" onclick="pageSubmitFn('news')">����</a></li>
				<li class="menu"><a href="#" onclick="pageSubmitFn('accessory')">�׼�����</a></li>
			   <c:if test="${sessionScope.id!=null }">
                <li class="menu"><a href="#" onclick="pageSubmitFn('board')">���ǰԽ���</a></li> 
               </c:if>
			
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li><a href="#"><i class="fa fa-facebook"></i></a></li>
				<li><a href="#"><i class="fa fa-twitter"></i></a></li>
				<li><a href="#"><i class="fa fa-instagram"></i></a></li>
				<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
				<c:if test="${sessionScope.id==null }"> 
                <li><a href="#" onclick="pageSubmitFn('login')">�α���</a></li>
                </c:if>
               <c:if test="${sessionScope.id!=null }">
                <li><a href="#" onclick="logout()">�α׾ƿ�</a></li>
               </c:if>
				
				
				<c:if test="${sessionScope.id==null }">
                <li><a href="#" onclick="pageSubmitFn('registration')">ȸ������</a></li>
                </c:if>
                <c:if test="${sessionScope.id!=null }">
                <li><a href="#" onclick="pageSubmitFn('registration modification')">ȸ������</a></li>
                   </c:if>
                
                
                
                <c:if test="${sessionScope.id!=null && sessionScope.id!='admin' }">
                 <li><a href="#" onclick="pageSubmitFn('mypage')">����������</a></li> 
                </c:if>
                <c:if test="${sessionScope.id!=null && sessionScope.id=='admin' }">
                 <li><a href="#" onclick="pageSubmitFn('mypage_admin')">����������</a></li> 
                </c:if>
                 
                 
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
</nav>
