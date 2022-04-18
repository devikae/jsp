<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 선택을 하면 junction에서 선택한 종류에 따라 jsp파일을 다르게 열도록 해줌 -->
<!-- 선택의 따라 다른 페이지  -->
<form action="04junction.jsp" method="POST">
	<h1>서준</h1>
	RedVelbet : <input type="radio" name="idol" value="rv"> <br>
	BTS		:	<input type="radio" name="idol" value="bts"> <br>
	BlackPink		: <input type="radio" name="idol" value="bp"> <br>
	<button type="submit">제출</button>	
	
	
</form>

</body>
</html>