<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Mira -  Minimal eCommerce HTML Template</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link rel="apple-touch-icon" href="apple-touch-icon.png">
        <!-- Place favicon.ico in the root directory -->
		
		<!-- all css here -->
        <link rel="stylesheet" href="../css/login_css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/login_css/owl.carousel.min.css">
        <link rel="stylesheet" href="../css/login_css/pe-icon-7-stroke.css">
        <link rel="stylesheet" href="../fonts/login_fonts/font-awesome.min.css">
        <link rel="stylesheet" href="../css/login_css/meanmenu.css">
        <link rel="stylesheet" href="../css/login_css/shortcodes/shortcode.css">
        <link rel="stylesheet" href="../css/login_css/style.css">
        <link rel="stylesheet" href="../css/login_css/responsive.css">
        <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
        
        <style type="text/css">
        .footer-bottom{
         
         margin: 0 auto;
        
        }
        
        .loginbtn{
        padding-left: 95px;
        
        }
        .loginbtn2 {margin-right: 30px;}
     
     .login-toggle-btn{
       padding-bottom: 20px;
     }
        </style>
        
     
        <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
		<script type="text/javascript">
		
		
		$(document).ready(function(){
			 
		    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
		    var key = getCookie("key");
		    $("#lid").val(key); 
		     
		    if($("#lid").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
		        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
		    }
		     
		    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
		        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
		            setCookie("key", $("#lid").val(), 7); // 7일 동안 쿠키 보관
		        }else{ // ID 저장하기 체크 해제 시,
		            deleteCookie("key");
		        }
		    });
		     
		    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
		    $("#lid").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
		        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
		            setCookie("key", $("#lid").val(), 7); // 7일 동안 쿠키 보관
		        }
		    });
		    
		    
		    
		    
		});
		 
		function setCookie(cookieName, value, exdays){
		    var exdate = new Date();
		    exdate.setDate(exdate.getDate() + exdays);
		    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
		    document.cookie = cookieName + "=" + cookieValue;
		}
		 
		function deleteCookie(cookieName){
		    var expireDate = new Date();
		    expireDate.setDate(expireDate.getDate() - 1);
		    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}
		 
		function getCookie(cookieName) {
		    cookieName = cookieName + '=';
		    var cookieData = document.cookie;
		    var start = cookieData.indexOf(cookieName);
		    var cookieValue = '';
		    if(start != -1){
		        start += cookieName.length;
		        var end = cookieData.indexOf(';', start);
		        if(end == -1)end = cookieData.length;
		        cookieValue = cookieData.substring(start, end);
		    }
		    return unescape(cookieValue);
		}

	
		
		function loginOk(){
			
			$('#logBtn').trigger("click");
			
		}

		
	$(function(){
	$('#logBtn').click(function(){
		var id=$('#lid').val();
		if(id.trim()=="")
		{
			$('#lid').html('<font color=red>ID를 입력하세요</font>');
			$('#lid').focus();
			return;
		}
		
		var pwd=$('#lpwd').val();
		if(pwd.trim()=="")
		{
			$('#lpwd').focus();
			return;
		}
		
		// 전송  => login요청 
		/*
		     login_ok.jsp
		     ============
		    	 NOID
		    	 NOPWD
		    	 OK
		*/
		$.ajax({
			type:'post',
			url:'../login/login_ok.do',
			data:{"id":id,"pwd":pwd},
			success:function(response)
			{
				var result=response.trim();
				
				if(result=="NOID"){
					alert("아이디가 존재하지 않습니다!!")
					$('#lid').val("");
					$('#lpwd').val("");
					
					$('#lid').focus();
					
				}else if(result=="NOPWD"){
					
					alert("비밀번호가 틀립니다!!")
					$('#lpwd').val("");
					$('#lpwd').focus();
					
				}else if(result=="NOPWD"){
					
					alert("비밀번호가 틀립니다!!")
					$('#lpwd').val("");
					$('#lpwd').focus();
					
				}else{
					
					window.parent.location.href='../main/main.do';
				}
			}
		});
		
	});
});
</script>
    </head>
    <body>
        <!--[if lt IE 8]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
        <jsp:include page="../cmmn/default-nav.jsp"></jsp:include>
        <!-- Add your site or application content here -->
        <div class="waraper">
            <header>
           
            </header>
            <!-- header end -->
   
            <!-- register-area start -->
            <div class="register-area ptb-50">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12 col-lg-4 col-lg-offset-4">
                            <div class="login">
                                <div class="login-form-container">
                                    <div class="login-text">
                                        <h2>login</h2>
                                        <span>Please login using account detail bellow.</span>
                                    </div>
                                    <div class="login-form">
                                            <input type="text" name="user-id" placeholder="ID" id="lid">
                                            <input type="password" name="user-password" placeholder="Password" id="lpwd"
                                            onkeypress="if(event.keyCode == 13){ loginOk(); return; }">
                                            <div class="button-box">
                                                <div class="login-toggle-btn">
                                                    <input type="checkbox" id="idSaveCheck">
                                                    <label for="remember">Remember ID</label>
                                                </div>
                                               <div class="loginbtn">
                                                <button type="submit" class="default-btn floatright loginbtn2" id="logBtn">Login</button>
                            
                                                <button type="button" class="default-btn floatright"  onclick="javascript:history.back()">Cancel</button>
                                                </div>
                                            </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- register-area end -->
            
            <!-- Modal -->
            <div class="modal fade" id="loginModal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
                        </div>
                        <div class="modal-body">
                            <div class="login">
                                <div class="login-form-container">
                                    <div class="login-text">
                                        <h2>login</h2>
                                        <span>Please login using account detail bellow.</span>
                                    </div>
                                    <div class="login-form">
                                        <form action="login_ok" method="post">
                                            <input type="text" name="user-name" placeholder="ID" id="id">
                                            <input type="password" name="user-password" placeholder="Password" id="pwd">
                                            <div class="button-box">
                                                <div class="login-toggle-btn">
                                                    <input type="checkbox" id="remember">
                                                    <label for="remember">Remember ID</label>           
                                                </div>
                                                <button type="submit" class="default-btn floatright">Login</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal end -->
            
        </div>
        <jsp:include page="../cmmn/default-footer.jsp"></jsp:include>
        
         


		<!-- all js here -->
        <script src="../js/login_js/vendor/jquery-1.12.0.min.js"></script>
        <script src="../js/login_js/bootstrap.min.js"></script>
        <script src="../js/login_js/jquery.meanmenu.js"></script>
        <script src="../js/login_js/isotope.pkgd.min.js"></script>
        <script src="../js/login_js/imagesloaded.pkgd.min.js"></script>
        <script src="../js/login_js/jquery.counterup.min.js"></script>
        <script src="../js/login_js/waypoints.min.js"></script>
        <script src="../js/login_js/ajax-mail.js"></script>
        <script src="../js/login_js/owl.carousel.min.js"></script>
        <script src="../js/login_js/plugins.js"></script>
        <script src="../js/login_js/main.js"></script>
       
    </body>
</html>
