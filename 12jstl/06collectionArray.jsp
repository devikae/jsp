<%@page import="com.study.login.vo.UserVO"%>
<%@page import="java.util.Map"%>
<%@page import="com.study.common.util.UserList"%>
<%@page import="com.study.common.util.ProductList"%>
<%@page import="com.study.common.util.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	// 자바를 이렇게 직접 쓰는 경우가 앞으로는 적어짐 >> JSP는 보통 화면 만들때 사용하기 때문에 EL많이 사용 
	// ELfh 사용할 수 있도록 req
	request.setAttribute("kindPeople", kindPeope);

	List<ProdVO> prodList = ProductList.getProductList();
	request.setAttribute("prodList", prodList);
	
	UserList userList = new UserList();
	Map<String, UserVO> userMap = userList.getUsersMap();
	request.setAttribute("userMap", userMap);
	request.setAttribute("userMap", userMap);
	
	// 이 부분이 아래 맵 forEach와 같음 
	for(Map.Entry<String, UserVO> entry : userMap.entrySet()){
		entry.getKey(); // String으로 된 key를 얻을 수 있음
		entry.getValue(); // UserVO 객체를 value로 얻을 수 있음
	}
	
	
	// EL로 쓴다면?
	// 배열이나 컬렉션은 items 
%>
배열<br>
<c:forEach var="kindPerson" items="${kindPeople }">
	${kindPerson },
</c:forEach>
<hr>


리스트<br>
<c:forEach var="prod" items="${prodList }">
	제품번호: ${prod.prodId }, 이름: ${prod.prodName }<br>
</c:forEach>
<hr>

맵<br>
<% // c:forEach는 맵을 사용할 때 entry를 사용 %>
<c:forEach var="entry" items="${userMap }">
	key : ${entry.key } <br> 
	value : ${entry.value }<br>
</c:forEach>




</body>
</html>