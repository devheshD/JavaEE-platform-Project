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
		$('#updateBtn').click(function() {
			var pwd  = $('#pwd').val();
			var pwd1 = $('#pwd1').val();
			
			if (pwd === pwd1) {
				$('#frm').submit();
			} else {
				alert("비밀번호가 틀립니다.");
				$('#pwd').val();
				$('#pwd').focus();
			}
		});
	});
</script>
<style type="text/css">

/* 전체적인 틀 */
#contain { margin-left: 400px; }
.ht__bradcaump__area { height: 500px; }
.headName { position: relative; left: 510px; margin-top: 40px; margin-bottom: 40px; }
select.input-sm{ width: 72px;}
input.input-sm{ width: 224px;}
li.menuBtn{float: left;}
ul.paginations{list-style: none;}
td.insert{width:46px;}
.row1{ margin: 0px auto; width:700px; }
table.table{ width: 470px; margin-left: 340px;}
th { background: #ddd;  }

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
															
							<form method="post" action="update_ok.do" id="frm">
						      <table class="table">
						      	<h2 class="headName">수정 하기</h2>
						       <tr>
						        <th width=20% class="text-right">이름</th>
						        <td width=80% class="text-left">
						         <input type="hidden" name=no value="${vo.no }">
						         <input type=text name=name size=15 class="input-sm" autocomplete="off" value="${vo.name }">
						        </td>
						       </tr>
						       <tr>
						        <th width=20% class="text-right">제목</th>
						        <td width=80% class="text-left">
						         <input type=text name=subject size=40 class="input-sm" autocomplete="off" value="${vo.subject }">
						        </td>
						       </tr>
						       <tr>
						        <th width=20% class="text-right">내용</th>
						        <td width=80% class="text-left">
						         <textarea rows="8" cols="45" name="content">${vo.content }</textarea>
						        </td>
						       </tr>
						       
						       <tr>
						        <th width=20% class="text-right">비밀번호</th>
						        <td width=80% class="text-left">
						         <input type=password name=pwd class="input-sm" size=10 id=pwd>
						         <input type="hidden" id=pwd1 value="${vo.pwd }">
						        </td>
						       </tr>
						       <tr>
						        <td colspan="2" class="text-center">
						         <input type="button" value="수정하기" class="btn btn-sm btn-primary" id="updateBtn">
						         <input type="button" value="취소"
						           onclick="javascript:history.back()" class="btn btn-sm btn-info">
						        </td>
						       </tr>
						     </table>
						     </form>							
						
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