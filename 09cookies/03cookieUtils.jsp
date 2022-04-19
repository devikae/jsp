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

cookieUtils
<%
	//han쿠키가 있는지 없는지 확인하고 싶다면?

	// 아래의 과정이 필요한데 항상 하기 귀찮으니 메소드를 만들자 			

// 	Cookie[] cookies = request.getCookies();
// 	if(cookies !=null){
// 		for(Cookie cookie : cookies){
// 			if(cookie.getName().equals("han")){
// 				// 이 if문안에 왔으면 han이라는 cookie가 있다는것.
				
// 			}
// 		}
// 	}

	
// 	Cookie cookie = new Cookie("han","값");
// 	cookie.setMaxAge(60*30); // 30분
// 	cookie.setPath(request.getContextPath()+ "/09cookies/path1");
// 	response.addCookie(cookie);
	
//  	new Cookie("han","값",30분,"경로"); response.addCookie(); 처음부터 이렇게 만들고싶다.





			
%>


</body>
</html>