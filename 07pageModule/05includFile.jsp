<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- sub의 내용을 합쳐서 한개의 jsp 파일로 만들었기 때문에(include file을 이용해) 00main과 다르게  -->
<!-- sub에서 선언한 변수 내용도 05main으로 가지고 올 수 있다. -->



<h1>05 sub전 </h1>
<br>
<% int a= 5; %>
<%@ include file="05sub.jsp" %>
<br>
<h1>05 sub후 </h1>

</body>
</html>