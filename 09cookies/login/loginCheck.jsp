<%@page import="sun.font.CreatedFontTracker"%>
<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@page import="com.study.common.util.CookieUtils"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.study.login.vo.UserVO"%>
<%@page import="com.study.common.util.UserList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="/WEB-INF/inc/header.jsp" %>
<title></title>
</head>
<body>
<%	
	UserList userList= new UserList();
	String msg = "id 또는 pw 입력해라";
	String whrong = "id 또는 pw가 틀립니다. ";
	String id = request.getParameter("userId");
	String pw = request.getParameter("userPass");
	
	String yn = request.getParameter("rememberMe");
	
	
	if(id.equals("") || pw.equals("")){
		response.sendRedirect("login.jsp?mag=" + URLEncoder.encode(msg, "utf-8"));
	}else if(userList.getUser(id) != null){ // 입력한 아이디랑 대치해서 회원이 있다면
		
		userList.getUser(id).getUserPass(); // userVO
		
		
		if(userList.getUser(id).getUserPass().equals(pw)){ // id pw 맞을때
			
			if(yn.equals("Y")){
				Cookie ck = CookieUtils.createCookie("SAVE_ID",id,"/",((60*60*24)*7));
				response.addCookie(ck);
				response.sendRedirect("login.jsp");
				
			}else{
			// 쿠키 저장 후 로그인 jsp redirect로
			Cookie ck = CookieUtils.createCookie("AUTH",id);
			response.addCookie(ck);
			response.sendRedirect("login.jsp");
			}
			
		}else{ // 틀릴 때 
			response.sendRedirect("login.jsp?mag=" + URLEncoder.encode(whrong, "utf-8"));
			System.out.println("틀릴때");
		}
		
		
	}else if(userList.getUser(id) == null){
		response.sendRedirect("login.jsp?mag=" + URLEncoder.encode(whrong, "utf-8"));
	}
	
	
	
	
		
%>





</body>
</html>