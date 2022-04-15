<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// int num = (int)request.getAttribute("num");	
	// String str = (String) request.getAttribute("str");
	// 이렇게 하면 오류남 
	request.setAttribute("num", 5);
	request.setAttribute("str", "문자");
	
%>
num: <%=request.getAttribute("num") %> <br>
str: <%=request.getAttribute("str")%> <br>



</body>
</html>