<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// 	java.lang.NullPointerException
// 	java.lang.arrayIndexOutOfBoundException
// 	java.sql.SQLException
// 	String a= null;
// 	a.substring(5);

	int[] arr = new int[5];
	out.print(arr[5]);
%>


</body>
</html>