<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("UTF-8");
%>

<%@ include file="/WEB-INF/inc/header.jsp" %>
<title></title>
</head>
<body>
	<form action="todoRegist.wow" method="post">
		<table border="1" style="margin: 0 auto;">
			<tr>
				<th>Content</th>
				<td><input type="text" name="tdContent" value="" required="required"></td>
			</tr>
			<tr>
				<th>마감기한</th>
				<td><input type="text" name="tdDeadline" value="" required="required"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="tdNm" value=""></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="tdPass" value="" required="required"></td>
			</tr>

			<tr>
				<td>
					<button type="submit" > 등록</button>
				</td>
			</tr>
		</table>
	</form>







</body>
</html>