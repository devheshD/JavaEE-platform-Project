<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<style type="text/css">
.row{
   width:450px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
 $(function(){
	$('#findBtn').click(function(){
		var dong=$('#dong').val();
		if(dong.trim()=="")
		{
			$('#dong').focus();
			return;
		}
		
		$.ajax({
			type:'post',
			url:'../register/post_result.do',
			data:{"dong":dong},
			success:function(response)
			{
				//alert(response);
				$('#print').html(response);
			}
		});
	});
 });
</script>
</head>
<body>
   <div class="container">
     <div class="row">
      <table class="table table-hover">
         <tr>
          <td>
                    입력:<input type="text" size=15 id="dong">
               <input type="button" value="검색" id="findBtn"
                class="btn btn-xs btn-danger"
               >
          </td>
         </tr>
       </table>
       <div id="print"></div>
     </div>
   </div>
</body>
</html>










