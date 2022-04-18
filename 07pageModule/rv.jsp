<%@page import="java.util.List"%>
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
	List<String> memberList = (List<String>)request.getAttribute("memberList");
%>
레드벨벳 memberList가 위에 <br>

<%
	out.print("<ul>");
	for(int i=0; i < memberList.size(); i++){
		out.print("<li>"+memberList.get(i) + "</ul>");
	}
%>

<img alt="" src="rv.jpeg">
</body>
</html>