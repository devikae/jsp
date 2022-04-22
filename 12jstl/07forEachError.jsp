<%@page import="com.study.login.vo.UserVO"%>
<%@page import="java.util.Map"%>
<%@page import="com.study.common.util.UserList"%>
<%@page import="com.study.common.util.ProductList"%>
<%@page import="com.study.common.util.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%
	String[] kindPeope = {"민우","재훈","서준","원태"};
	request.setAttribute("kindPeople", kindPeope);

	List<ProdVO> prodList = ProductList.getProductList();
	request.setAttribute("prodList", prodList);
	
	UserList userList = new UserList();
	Map<String, UserVO> userMap = userList.getUsersMap();
	request.setAttribute("userMap", userMap);
	request.setAttribute("userMap", userMap);
	
	for(Map.Entry<String, UserVO> entry : userMap.entrySet()){
		entry.getKey(); // String으로 된 key를 얻을 수 있음
		entry.getValue(); // UserVO 객체를 value로 얻을 수 있음
	}
%>
<% // String랑 EL쓰고 띄어쓰기 주의. %>
									<% // "}" 와 " (큰따옴표) 이 사이에 공백이 생기면 안된다.  %>
<C:forEach var="prod" items="${prodList 				}">

</C:forEach>






</body>
</html>