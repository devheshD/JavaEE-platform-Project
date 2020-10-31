<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		
		
		$('.writeBtn').click(function() {
			var name = $('input[name=name]').val();
			var subject = $('input[name=subject]').val();
			var content = $('textarea[name=content]').val();
			var pwd = $('input[name=pwd]').val();
			
			if (name === "") {
				alert("이름을 입력해주세요!");
				$('input[name=name]').focus();
				
			} else if (subject === "") {
				alert("제목을 입력해주세요!");
				$('input[name=subject]').focus();
			
			} else if (content === "") {
				alert("내용을 입력해주세요!");
				$('textarea[name=content]').focus();
			
			} else if (pwd === "") {
				alert("비밀번호를 입력해주세요!");
				$('input[name=pwd]').focus();
				
			} else {
				$('#subBtn').submit();
			}
			
 			
		});
		
		
	});
</script>
<style type="text/css">
.row1{ margin: 0px auto; width:700px;}
.table{width: 450px; margin-left: 300px; }
</style>
</head>
<body>
     <form method="post" action="../board/insert_ok.do" id="subBtn">
      <table class="table">
      	<h2 class="headName">글쓰기</h2>
       <tr>
        <th width=20% class="text-right">이름</th>
        <td width=80% class="text-left">
         <input type=text name=name size=15 class="input-sm" autocomplete="off">
        </td>
       </tr>
       <tr>
        <th width=20% class="text-right">제목</th>
        <td width=80% class="text-left">
         <input type=text name=subject size=40 class="input-sm" autocomplete="off">
        </td>
       </tr>
       <tr>
        <th width=20% class="text-right">내용</th>
        <td width=80% class="text-left">
         <textarea rows="8" cols="45" name="content"></textarea>
        </td>
       </tr>
       
       <tr>
        <th width=20% class="text-right">비밀번호</th>
        <td width=80% class="text-left">
         <input type=password name=pwd class="input-sm" size=10>
        </td>
       </tr>
       <tr>
        <td colspan="2" class="text-center">
         <input type="button" value="글쓰기" class="btn btn-sm btn-primary writeBtn">
         <input type="button" value="취소"
           onclick="location.href='board.do'" class="btn btn-sm btn-info">
        </td>
       </tr>
     </table>
     </form>

</body>
</html>