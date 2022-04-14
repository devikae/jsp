<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- pageEncoding : jsp파일 소스코드 인코딩
	contextType의 charset : 브라우저가 받은 html 인코딩 하는 방식
 	파라미터는 encoding 어떻게? post방식 일 땐 파라미터가 encoding이 되지 않고 온다
 -->
     
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String name= request.getParameter("name");
	String age= request.getParameter("age");
	String school= request.getParameter("school");
	String hobby= request.getParameter("hobby");
%>

이름: <%=name %> <br>
나이: <%=age %> <br>
학교: <%=school %> <br>
취미: <%=hobby %> <br>
</body>
</html>