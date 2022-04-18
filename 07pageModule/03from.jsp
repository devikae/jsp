<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP FORWARD</title>
</head>
<body>
<!-- from >> to 로 이동 -->
<!-- jsp:forward >> 요청은 from.jsp로 하지만 내용은 to.jsp의 내용으로 나온다  -->
<!-- redirect와 다르게 요청은 한번 뿐임  -->


<h1>forward</h1>

<h2>forward 전 </h2>
dmdkrdmdkrdmdkrdmdkr
<jsp:forward page="03to.jsp"></jsp:forward>

<h2>forward 후</h2>
<h3>forward 후</h3>
<h4>forward 후</h4>
</body>
</html>