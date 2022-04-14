<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

nextit라는 파라미터가 없어서 null 리턴 
<br>
String nextit = request.getParameter("nextit");
<br>
String sub =nextit.substring(3,5);	
<br>
nullpointerException 오류 
<br>
오류가 나면 오류페이지 > 응답 

 
<hr>

<%
	String nextit = request.getParameter("nextit");
	String sub =nextit.substring(3,5);	
%>
<%=nextit %> 
<%=sub %> 


</body>
</html>