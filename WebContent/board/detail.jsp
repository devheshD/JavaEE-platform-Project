<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>인생 뽑차</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon"
	href="../images/accessory_img/favicon.ico">
<link rel="apple-touch-icon" href="apple-touch-icon.png">
<link rel="stylesheet" href="../css/main_css/bootstrap.min.css">
<link rel="stylesheet" href="../css/accessory_css/owl.carousel.min.css">
<link rel="stylesheet"
	href="../css/accessory_css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="../css/accessory_css/shortcode/shortcodes.css">
<link rel="stylesheet" href="../css/accessory_css/style.css">
<link rel="stylesheet" href="../css/accessory_css/responsive.css">
<link rel="stylesheet" href="../css/accessory_css/custom.css">
<script src="../js/accessory_js/vendor/modernizr-3.5.0.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	var i = 0;
	var j = 0;
	$(function() {
		// 댓글 수정
		$('.uclick').click(function() {
			$('.rupdate').hide();
			var no = $(this).attr("id");
			no = no.substring(1);
			
			if (i === 0) {
				$('#m' + no).show();
				$(this).text("취소");
				i = 1;
			} else {
				$('#m' + no).hide();
				$(this).text("수정");
				i = 0;
			}
			
		});
		
		$('#delBtn').click(function() {
			if (j === 0) {
				$('#del').show();
				$('#delBtn').text("취소");
				j = 1;
			} else {
				$('#del').hide();
				$('#delBtn').text("Delete");
				j = 0;
			}
		});
		
		$('#delReq').click(function() {
			var pwd  = $('#pwd').val();
			var pwd1 = $('#pwd1').val();
			
			if (pwd === pwd1) {
				$('#frm').submit();
			} else {
				alert("비밀번호가 틀립니다.");
				$('#pwd').val("");
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
table.table{margin-bottom: 0px;}
th { background: #ddd;  }

/*---------*/
/* 버튼 */
.btn {display: inline-block;padding: 6px 14px 6px; margin-bottom: 0;font-family: Arial, sans-serif;font-size: 14px;line-height: 20px;
  	  color: #FFFFFF; text-align: center; text-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);text-decoration: none;vertical-align: middle; cursor: pointer;
  	  background-color: #0077C8; background-image: -webkit-linear-gradient(rgba(255, 255, 255, 0.1) 0%, rgba(0, 0, 0, 0.05) 95%);
  	  background-image: -moz-linear-gradient(rgba(255, 255, 255, 0.1) 0%, rgba(0, 0, 0, 0.05) 95%); background-image: -linear-gradient(rgba(255, 255, 255, 0.1) 0%, rgba(0, 0, 0, 0.05) 95%);
  	  background-image: -ms-linear-gradient(rgba(255, 255, 255, 0.1) 0%, rgba(0, 0, 0, 0.05) 95%); background-repeat: repeat-x; border: 0;
  	  -webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; -webkit-box-shadow: inset 0 -2px 0 rgba(0,0,0,.2); -moz-box-shadow: inset 0 -2px 0 rgba(0,0,0,.2);
      box-shadow: inset 0 -2px 0 rgba(0,0,0,.2); -webkit-transition: 0.1s; -moz-transition: 0.1s; transition: 0.1s; -webkit-box-sizing: border-box; /* Safari/Chrome, other WebKit */
  	  -moz-box-sizing: border-box; box-sizing: border-box;}
.btn:hover { background-color: #0098ff; -webkit-box-shadow: inset 0 -4px 0 rgba(0,0,0,.2); -moz-box-shadow: inset 0 -4px 0 rgba(0,0,0,.2);
             box-shadow: inset 0 -4px 0 rgba(0,0,0,.2); margin-top: -2px; padding: 6px 14px 8px; }
body .btn:active { -webkit-box-shadow: none; -moz-box-shadow: none; box-shadow: none; margin-top: 2px; padding: 6px 14px 4px;}
body .btn-gray { color:#000000; background-color: #F5F5F5; }
body .btn-gray:hover { background-color:#DDDDDD; }
body .btn-dkblue { background-color: #054375; }
body .btn-dkblue:hover { background-color:#0066b8; }
body .btn-ltblue { background-color: #00a4d8; }
body .btn-ltblue:hover { background-color:#01c2ff; }
body .btn-black { background-color: #222222; }
body .btn-black:hover { background-color:#444444; }
body .btn-large { padding: 8px 28px; font-size: 20px; line-height: 30px; -webkit-border-radius: 4px; -moz-border-radius: 4px; border-radius: 4px;
  				  -webkit-box-shadow: inset 0 -3px 0 rgba(0,0,0,.2); -moz-box-shadow: inset 0 -3px 0 rgba(0,0,0,.2); box-shadow: inset 0 -3px 0 rgba(0,0,0,.2);}
body .btn-large:hover { -webkit-box-shadow: inset 0 -6px 0 rgba(0,0,0,.2); -moz-box-shadow: inset 0 -6px 0 rgba(0,0,0,.2); box-shadow: inset 0 -6px 0 rgba(0,0,0,.2);
 						margin-top: -4px; padding: 8px 28px 12px;}
body .btn-large:active { -webkit-box-shadow: none; -moz-box-shadow: none; box-shadow: none; margin-top: 3px; padding: 8px 28px 5px;}
body .btn-small { -webkit-box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.2); -moz-box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.2); box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.2);
  				  padding: 0 8px; margin-top: -5px; margin-bottom:-4px; }
body .btn-small:hover { -webkit-box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.2); -moz-box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.2);
          				box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.2); padding: 0 8px 2px;margin-top: -7px; }
body .btn-small:active { -webkit-box-shadow: none; -moz-box-shadow: none; box-shadow: none; padding: 0 8px 0px; margin-top: -5px; }
body .btn-block { padding: 8px 28px; font-size: 20px; line-height: 30px; -webkit-border-radius: 4px; -moz-border-radius: 4px;
          		  border-radius: 4px; -webkit-box-shadow: inset 0 -3px 0 rgba(0,0,0,.2); -moz-box-shadow: inset 0 -3px 0 rgba(0,0,0,.2);
          		  box-shadow: inset 0 -3px 0 rgba(0,0,0,.2); width:100%; max-width:960px;}
body .btn-block:hover { -webkit-box-shadow: inset 0 -6px 0 rgba(0,0,0,.2); -moz-box-shadow: inset 0 -6px 0 rgba(0,0,0,.2); box-shadow: inset 0 -6px 0 rgba(0,0,0,.2);
  					    margin-top: -4px; padding: 8px 28px 12px;}
body .btn-block:active { -webkit-box-shadow: none; -moz-box-shadow: none; box-shadow: none; margin-top: 3px; padding: 8px 28px 5px;}
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

		<section class="htc__product__grid bg__white ptb--100">
			<div class="container" id="contain">
				<div class="htc__product__rightidebar">
					<div class="row row1">
						<table class="table">
							<h2 class="headName">내용 보기</h2>
							<tr>
								<th width=20% class="text-center">번호</th>
								<td width=30% class="text-center">${vo.no }</td>
								<th width=20% class="text-center">작성일</th>
								<td width=30% class="text-center">
									<fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd" />
								</td>
							</tr>
							<tr>
								<th width=20% class="text-center">이름</th>
								<td width=30% class="text-center">${vo.name }</td>
								<th width=20% class="text-center">조회수</th>
								<td width=30% class="text-center">${vo.hit }</td>
							</tr>
							<tr>
								<th width=20% class="text-center">제목</th>
								<td colspan="3" class="text-left">${vo.subject}</td>
							</tr>
							<tr>
								<td colspan="4" class="text-left" valign="top" height="150">
									${vo.content }</td>
							</tr>
							<tr>
								<td colspan="4" class="text-right">
									<a class="btn btn-dkblue btn-sm"  href="update.do?no=${vo.no }">Modify</a>
									<a class="btn btn-ltblue btn-sm" href="#" id="delBtn">Delete</a>
									<a class="btn btn-black btn-sm"  href="board.do">List</a>
								</td>
							</tr>
							<tr id="del" style="display: none">
								<td colspan="4" class="text-right in">
									<form method="post" action="board_delete.do" id="frm">
										비밀번호 : <input type="password" size=10 id="pwd"> 
												 <input type="hidden" id="pwd1" value="${vo.pwd }"> 
												 <input type="hidden" value="${vo.no }" name=no> 
												 <input type="button" value="삭제" class="btn btn-xs btn-success" id="delReq">
									</form>
								</td>
							</tr>
						</table>

						<%-- 댓글 --%>
						<table class="table">
							<c:forEach var="rvo" items="${list }">
								<tr>
									<td class="text-left">
										<span style="color: blue;">${rvo.name }</span>&nbsp;(${rvo.dbday })
										<pre style="white-space: pre-line; width: 920px;">${rvo.msg }</pre>
									</td>
									<td class="text-right">
										<c:if test="${sessionScope.id == rvo.id }">
											<span class="btn btn-xs btn-success uclick" id="u${rvo.no }">수정</span> 
											<a href="reply_delete.do?no=${rvo.no }&bno=${vo.no}" class="btn btn-xs btn-danger">삭제</a>
										</c:if>
									</td>
								</tr>
																		
								
								<tr id="m${rvo.no }" class="rupdate" style="display: none">
									<td class="in">
										<form method="post" action="reply_update.do">
											<input type=hidden name=bno value="${vo.no }"> 
											<input type=hidden name=no value="${rvo.no }">
											<textarea rows="3" cols="80" name="msg" style="float: left">${rvo.msg }</textarea>
											<input type="submit" value="댓글수정" style="height: 65px" class="btn btn-danger">
										</form>
									</td>
								</tr>
								
							</c:forEach>
						</table>
						
						<table class="table">
							<tr>
								<td class="in">
									<form method="post" action="../board/reply_insert.do">
										<input type=hidden name=bno value="${vo.no }">
										<textarea rows="3" cols="90" name="msg" style="float: left; width: 850px;" ></textarea>
										<input type="submit" value="Comment" style="height: 65px" class="btn">
									</form>
								</td>
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



