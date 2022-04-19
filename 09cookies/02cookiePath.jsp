<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%request.setCharacterEncoding("UTF-8") ;%>
<%@include file="/WEB-INF/inc/header.jsp" %>
</head>
<body>
<%@include file="/WEB-INF/inc/top.jsp" %>
<!-- 경로를 지정해서 쿠키를 여러개 만들어보기  -->

<%
	Cookie path1 = new Cookie("path1","path1");
	Cookie path2 = new Cookie("path2","path2");
	Cookie basic = new Cookie("basic","basic");
	Cookie absolute = new Cookie("absolute","absolute");
	
	path1.setPath(request.getContextPath()+"/09cookies/path1");
	path2.setPath(request.getContextPath()+"/09cookies/path2");
	absolute.setPath(request.getContextPath());
	
	response.addCookie(path1); response.addCookie(path2);
	response.addCookie(basic); response.addCookie(absolute);
	// 경로를 지정하면 해당경로 포함 하위 경로에서 쿠키 사용 가능 (관찰가능)
	// absolute는 아무곳에서나 볼 수 있음
	// basic은 현재폴더, path1, path2 폴더에서
	// path1은 path1에서, 2는 2에서만 
	
%>

</body>
</html>