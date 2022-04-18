<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h4>main에서 온 데이터 <%= request.getAttribute("main") %></h4>

<%request.setAttribute("sub", "subData"); %>


</body>
</html>