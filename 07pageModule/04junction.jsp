<%@page import="java.util.ArrayList"%>
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
	String idol=request.getParameter("idol");
	// 04form.jsp랑 04juction은 다른 request
	
	// 04juction이랑 bts, rv, bp.jsp는 같은 request
	
	List<String> memberList = new ArrayList<>();
	String viewPage="";
	if(idol.equals("rv")){
		memberList.add("조이");
		memberList.add("아이린");
		memberList.add("웬디");
		memberList.add("슬기");
		memberList.add("예리");
		viewPage="rv.jsp";
	}else if(idol.equals("bts")){
		memberList.add("뷔");
		memberList.add("정국");
		memberList.add("진");
		viewPage="bts.jsp";
	}else if(idol.equals("bp")){
		memberList.add("로제");
		memberList.add("제니");
		memberList.add("지수");
		viewPage="bp.jsp";
	}
	request.setAttribute("memberList", memberList);
	
%>

<jsp:forward page="<%= viewPage %>"></jsp:forward>



</body>
</html>