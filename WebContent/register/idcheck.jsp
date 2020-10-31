<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#checkBtn').click(function(){
		// ID읽기
		var id=$('#id').val();
		if(id.trim()=="")
		{
			$('#id').focus();
			return;
		}
		
		// 전송(id) == 결과값 받기 
		/*
		    $('#id') ==> 태그를 가지고 온다 
		    $(.id) , $('input')
		    $.ajax({}) ==> 함수 호출 
		    $.each({}) => for문
		*/
		$.ajax({
			type:'POST',
			url:'../register/idcheck_result.do',
			data:{"id":id},
			success:function(response)
			{
				var no=response.trim();
				if(no==0)
				{
					var html="<td class='text-center'>"+id+"는(은) 사용가능합니다</td>";
					var html2="<td class='text-center'><input type=button value='확인' class='btn btn-sm btn-success' onclick=ok()></td>";
					$('#print').html(html);
					$('#ok').html(html2);
				}
				else
				{
					var html="<td class='text-center'>"+id+"는(은) 이미 사용중인 아이디입니다</td>";
					$('#print').html(html);
					$('#ok').html("");
				}
			}
			
		});
	});
});
function ok()
{
	parent.registerFrm.id.value=$('#id').val();
	parent.Shadowbox.close();
}
</script>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<style type="text/css">
.row{
   width:300px;
}
</style>
</head>
<body>
  <div class="container">
    <div class="row">
     <table class="table table-hover">
      <tr>
        <td>
         ID:<input type=text id="id" size=15>
           <input type=button value="중복체크"
             class="btn btn-xs btn-danger" id="checkBtn">
        </td>
      </tr>
      <tr id="print">
        <%-- 결과값 출력  --%>
      </tr>
      <tr id="ok">
        
      </tr>
     </table>
    </div>
  </div>
</body>
</html>






