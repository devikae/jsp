<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 	파라미터의 값도 넘겨줄 수 있음 -->
	<h1>include 전</h1>

	<jsp:include page="01sub.jsp">
		<jsp:param value="valvalvalvalue" name="abc" />
	</jsp:include>


	<h1>include 후</h1>
</body>
</html>