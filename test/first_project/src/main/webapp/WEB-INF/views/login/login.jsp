<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%request.setCharacterEncoding("utf-8"); %>
</head>
<body>

	<form action="login.wow" method="post">
		id : <input type="text" name="id"  value=""> <br> 
		pw : <input type="text" name="pw" value=""> <br>
		<button type="submit">로그인</button> 
	</form>

</body>
</html>