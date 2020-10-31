<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"
   import="java.util.*,java.text.*,com.sist.dao.*,com.sist.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Single Blog 1</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
<link
   href='https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700'
   rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="../css/news_css/bootstrap.min.css">
<link rel="stylesheet" href="../css/news_css/font-awesome.min.css">
<link rel="stylesheet" href="../css/news_css/owl.carousel.css">
<link rel="stylesheet" href="../css/news_css/owl.theme.css">
<link rel="stylesheet" href="../css/news_css/owl.transitions.css">
<link rel="stylesheet" href="../css/news_css/meanmenu.css">
<link rel="stylesheet" href="../css/news_css/normalize.css">
<link rel="stylesheet" href="../css/news_css/main.css">
<link rel="stylesheet" href="../css/news_css/style.css">
<link rel="stylesheet" href="../css/news_css/responsive.css">
<script src="../js/news_js/vendor/modernizr-2.8.3.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>

<script type="text/javascript">
var i=0;
$(function(){
	$('.updateNewsReply').click(function(){
		$('.rupdate').hide();
		var no = $(this).attr("id");	//trId18
		no = no.substring(5);
		
		if(i==0){
			$('#trId' + no).show();
			$(this).text("취소");
			i=1;			
		}
		else{
			$('#trId' + no).hide();
			$(this).text("수정");
			i=0;
		}
	});
});
$(function(){
	$('.submit-btn').click(function(){
		if($('#trim').val()=="")
		{
			alert("내용을 입력해주세요.");
			return false;
		}
	});
});
$(function(){
	$('.update').click(function(){
		if($('#trim2').val()=="")
		{
			alert("내용을 입력해주세요.");
			return false;
		}
	});
});
</script>
<style>
.button submit-btn{
	float:right;
} 
.post-tags span a {
    color: #999;
    font-style: italic;
    font-weight: 600;
    margin-right: 5px;
    text-transform: uppercase;
}

.comment-info p.author-name a:hover {
    color: #66cc99;
}
</style>

</head>
<body class="single-blog-1">
   
   <jsp:include page="../cmmn/default-nav.jsp"></jsp:include>

   <!-- search-area start -->
   <div class="search-area">
      <div class="container">
         <div class="row">
            <div class="col-md-12">
               <div class="search-form">
                  <span class="search-close"></span>
                  <form action="#" method="post">
                     <input type="text" placeholder="Search here..." />
                     <button type="submit" class="search-btn">
                        <i class="fa fa-search"></i>
                     </button>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- search-area end -->

   <!-- single-blog-area start -->
   <div id="single-blog" class="single-blog-area">
      <div class="single-blog-heading">
         <div class=""></div>
         <img src="../images/news_img/single-blog/8.jpg">
      </div>
      <div class="container">
         <div class="row">
            <div class="col-md-8 col-md-offset-2">
               <div class="single-blog-details" style="margin-bottom: 50px;">
                  <h1 class="text-center">${nvo.title }</h1>
                  <div class="post-long-desc">
                  <p class="post-date">${nvo.news_date }</p>
                  <div class="post-long-desc">
                  <div>
                     <img src="${nvo.detail_img }" alt="" /></a>
                  </div>
                  <div class="post-long-desc"></div>
                  <div class="post-long-desc"></div>
                     <p class="post-short-desc">${nvo.content }</p>
                     </p>
                  </div>
                  <div class="single-blog-bottom fix">
                     <div class="post-social-links pull-left">
                        <p>
                           <span class="lbl">Share on&nbsp;&nbsp;-</span> <span> <a
                              href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
                                 class="fa fa-twitter"></i></a> <a href="#"><i
                                 class="fa fa-google-plus"></i></a> <a href="#"><i
                                 class="fa fa-pinterest"></i></a>
                           </span>
                        </p>
                     </div>
                     <div class="post-tags pull-right">
                        <p>
                           <span class="lbl">reporter&nbsp;-</span> 
                           <span style="color: #999;font-style: italic;font-weight: 600;margin-right: 5px;text-transform: uppercase;">${nvo.reporter }</span>
                        </p>
                     </div>
                     
                     <br>
                     <div class="post-long-desc">
                     <div class="post-tags pull-right">
                        <p>
                           <a href="news.do" class="btn btn-sm btn-info">목록</a>
                        </p>
                     </div>
                     </div>
                  </div>
               </div>
               
               
              <!-- /.about-author -->
                     <div class="comments-area" style="width: 652px;padding-left: 126px;padding-right: 126px;">
                        <h6 class="title">&nbsp;&nbsp;comments</h6>
                        <!-- /.single-comment -->
							<ul class="comments-list">
								<li class="single-comment">
									<div class="comment-box">										
										<div class="comment-info" style="width: 458px;">
										  <c:forEach var="rvo" items="${list }">
											<p class="author-name">
												<tr style="line-height:30px;">${rvo.id }</tr>
											</p>
											<span class="comment-date">${rvo.regdate }</span>
												<pre style="white-space: pre-line; width: 458px;">${rvo.content }</pre>
											<c:if test="${sessionScope.id==rvo.id }">
										    	<span class="btn btn-sm btn-success updateNewsReply" id="ulike${rvo.no }">수정</span>
										    	<a href="news_reply_delete.do?news_no=${rvo.news_no }&no=${rvo.no}" type="button" class="btn btn-sm btn-success">삭제</a>
										    </c:if>
										    
										 
										    <table class="table">
										    
										    <tr id="trId${rvo.no }" class="rupdate" style="display:none;">
					                           <td class="in text-right ">
					                              <form method="post" action="news_reply_update.do">
					                                 <input type=hidden name=news_no value="${rvo.news_no }">
					                                 <input type=hidden name=no value="${rvo.no}">
					                                 <textarea rows="3" cols="80" name="content" style="float: left;width: 440px;" id="trim2">${rvo.content }</textarea>
					                                 <input type="submit" value="수정" class="btn btn-sm btn-info update" style="margin-top: 3px">
					                              </form>
					                           </td>
					                        </tr>
					                        </table>
					                      					                        
										 </c:forEach>	
												
										</div>
									</div>
									
									<!-- /.comments-area -->
									<c:if test="${sessionScope.id == null }">
										<a href="../login/login.do" type="button" class="btn3" style="margin-left:100px;margin-bottom: 100px;'">로그인 후 댓글을 입력할 수 있습니다.click</a>
									</c:if>
									<c:if test="${sessionScope.id != null }">
					                     <div class="comment-form-area" style="margin-left: 0px;padding-right: 0px;">
					                        <p>leave a comment</p>
					                        <form action="news_replyInsert.do?news_no=${nvo.news_no }" method="post">
					                           <textarea placeholder="Message" name="content" id="trim" ></textarea>
					                           <button type="submit" class="submit-btn">submit</button>
					                        </form>
					                     </div>
					                </c:if>
                     				<!-- /.comment-form-area -->
								</li>
							</ul>
						</div>
            </div>
         </div>
      </div>
   </div>
   </div>
   <!-- single-blog-area end -->
   
   
   

   <!-- footer-area start -->
   <jsp:include page="../cmmn/default-footer.jsp"></jsp:include>
   <!-- footer-area end -->

   <!-- jquery
      ============================================ -->
   <script src="../js/news_js/vendor/vendor/jquery-1.11.3.min.js"></script>
   <!-- bootstrap JS
      ============================================ -->
   <script src="../js/news_js/vendor/bootstrap.min.js"></script>
   <!-- meanmenu JS
      ============================================ -->
   <script src="../js/news_js/vendor/jquery.meanmenu.js"></script>
   <!-- owl.carousel JS
      ============================================ -->
   <script src="../js/news_js/vendor/owl.carousel.min.js"></script>
   <!-- scrollUp JS
      ============================================ -->
   <script src="../js/news_js/vendor/jquery.scrollUp.min.js"></script>
   <!-- plugins JS
      ============================================ -->
   <script src="../js/news_js/vendor/plugins.js"></script>
   <!-- main JS
      ============================================ -->
   <script src="../js/news_js/vendor/main.js"></script>
</body>
</html>