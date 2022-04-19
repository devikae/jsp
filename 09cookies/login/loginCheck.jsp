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
	// 계정들의 키와, 값이 모두 담김
	
	String msg = "id 또는 pw 입력해라";
	// id or pw 입력 안할 시 출력 할 문자열
	
	String whrong = "id 또는 pw가 틀립니다. ";
	// id or pw가 틀렸을 시 출력 할 문자열
	
	String id = request.getParameter("userId");
	// 사용자가 입력한 id를 담은 변수
	
	String pw = request.getParameter("userPass");
	// 사용자가 입력한 pw를 담은 변수
	
	String yn = request.getParameter("rememberMe");
	// login에서 사용자가 id기억하기를 누른다면 "Y"가 담긴다.
	
	
	if(id.equals("") || pw.equals("")){ // id,pw 모두 입력하지 않았다면
		response.sendRedirect("login.jsp?mag=" + URLEncoder.encode(msg, "utf-8"));
		// 파라미터에 표시, 인코딩 하지 않으면 ??로 나옴.
		
	}else if(userList.getUser(id) != null){ // 사용자가 입력한 id의 값이 있다면?
		
		userList.getUser(id).getUserPass(); // id로 유저의 패스워드를 가져옴.
		
		if(userList.getUser(id).getUserPass().equals(pw)){ // id와 pw 일치 할 시 
			
			if(yn.equals("Y")){ // yn의 값이 "Y"일 때 (사용자가 ID기억을 체크했을 때)
				Cookie ck = CookieUtils.createCookie("SAVE_ID",id,"/",((60*60*24)*7));
				// SAVE_ID라는 이름의 유효기간이 7일인 쿠키 생성
				
				response.addCookie(ck);
				// 응답에 쿠키를 담고
				
				response.sendRedirect("login.jsp");
				// 쿠키를 담아 응답 login.jsp페이지로 전환
				
				
			}else{ // yn의 값이 Y가 아니고, id와 pw가 일치 했을 때 >> ID기억 체크 안하고 로그인 시 
			// 쿠키 저장 후 로그인 jsp redirect로
			
			Cookie ck = CookieUtils.createCookie("AUTH",id);
			// AUTH라는 이름의 쿠키 생성
			
			response.addCookie(ck);
			// 쿠키를 추가
			response.sendRedirect("login.jsp");
			// (쿠키를 담아서) login페이지로 응답
			}
			
		}else{ // 틀릴 때 
			response.sendRedirect("login.jsp?mag=" + URLEncoder.encode(whrong, "utf-8"));
			System.out.println("id 또는 pw가 틀렸다."); // log
		}
		
		
	}else if(userList.getUser(id) == null){ // id/pw를 입력은 했는데 매치가 되지 않았을때 로그인 실패 시 콘솔창에 틀렸다는 말과 함께 
		response.sendRedirect("login.jsp?mag=" + URLEncoder.encode(whrong, "utf-8"));
	}
	
	
	
	
		
%>





</body>
</html>
