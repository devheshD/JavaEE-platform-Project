<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function ok(zip,addr)
{
	parent.registerFrm.post.value=zip;
	parent.registerFrm.addr1.value=addr;
	parent.Shadowbox.close();
}
</script>
</head>
<body>
     <c:if test="${count==0 }">
       <table class="table table-hover">
         <tr>
          <td class="text-center">검색된 결과가 없습니다</td>
         </tr>
       </table>
      </c:if>
      <c:if test="${count!=0 }">
        <table class="table table-hover">
         <tr class="success">
           <th width="25%" class="text-center">우편번호</th>
           <th width="75%" class="text-center">주소</th>
         </tr>
         <%--
             for(ZipcodeVO vo:list)
          --%>
         <c:forEach var="vo" items="${list }">
           <tr>
            <td class="text-center">${vo.zipcode }</td>
            <td><a href="javascript:ok('${vo.zipcode }','${vo.address }')">${vo.address }</a></td>
           </tr>
         </c:forEach>
        </table>
      </c:if>
</body>
</html>





