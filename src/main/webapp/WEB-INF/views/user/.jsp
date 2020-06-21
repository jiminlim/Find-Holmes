<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <table class="table table-striped">
    <tbody>
      <tr>
      	<td>아이디</td>
      	<td>비밀번호</td>
      	<td>이름</td>
      	<td>이메일</td>
      	<td>전화번호</td>
      	<td>주소</td>
      </tr>
	<tr>
       <c:forEach var="article" items="${userlist}"> 
	 		 <td>${article.id}</td>
	 		 <td>${article.password}</td>
	 		 <td>${article.name}</td>
	 		 <td>${article.emailid} @ {article.emaildomain}</td>
	 		 <td>${article.tel1} - {article.tel2} - {article.tel3}</td>
	 		 <td>${article.address} @ {article.address_details}</td>
	      </c:forEach>
	 </tr>
    </tbody>
  </table>
</body>
</html>