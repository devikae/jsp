<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
04getForm.jsp

<!-- method기본은 get, method속성 안써도 기본값 get -->
<form action="04getResult.jsp" method="get">
	학교: <input type="text" name="school" value""> <br>
	나이: <input type="number" name="age" value""> <br>
	취미: <input type="text" name="hobby" value""> <br>
	<button type="submit">제출</button>	 
</form>

<%

%>

</body>
</html>