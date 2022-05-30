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

<form action="userRegist.wow" method="post">
<table border="1">
		<tbody>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="user_id" required="required"  ></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="user_pass"  required="required"></td>
			</tr>
			<tr>
				<th>회원명</th>
				<td><input type="text" name="user_name"  required="required" ></td>
			</tr>
			<tr>
				<th>메일</th>
				<td><input type="text" name="user_email"></td>
			</tr>
			<tr>
				<th>핸드폰</th>
				<td><input type="text" name="user_hp"></td>
			</tr>
			<tr>
				<td>
					<button type="submit">회원가입</button>
				</td>
			</tr>
		</tbody>	
	</table>

</form>
</body>
</html>