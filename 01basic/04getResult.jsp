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
	String school= request.getParameter("school");
	int age=Integer.parseInt(request.getParameter("age"));
	String hobby = request.getParameter("hobby");
%>
내 학교: <%=school %> <br>
<%out.print("내 나이: " +age + "<br>"); %>
내 취미: <%=hobby %> <br>


</body>
</html>