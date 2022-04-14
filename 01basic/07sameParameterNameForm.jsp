<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
07sameParameterNameForm

<form action="07result.jsp" method="get"> 
	이름: <input type="text" name="name"> <br>
	나이: <input type="text" name="age"> <br>
	
	취미: <br>
		축구<input type="checkbox" name="hobby" value="soccer">
		,농구<input type="checkbox" name="hobby" value="basket">
		,노래<input type="checkbox" name="hobby" value="sing">
		,술<input type="checkbox" name="hobby" value="drinking">
		,기타<input type="text" name="hobby">
	<button type="submit">제출</button>
	

</form>

</body>
</html>