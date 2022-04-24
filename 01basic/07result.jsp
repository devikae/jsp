<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Map.Entry"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
이름: <%= request.getParameter("name") %> <br>
나이: <%= request.getParameter("age") %> <br>
취미: 
<%
	String[] hobbies =request.getParameterValues("hobby");
	// hobby라는 파라미터들의 값을 가져와 배열안에 담음
	for(String hobby : hobbies){
		out.print(hobby + " ");
	}
%>
<hr>
<h1>enum</h1>
<%
	//name, age, hobby 라는 파라미터 들이 있다.
	Enumeration<String> enumParamNames = request.getParameterNames();
	while(enumParamNames.hasMoreElements()){
		String paramName = enumParamNames.nextElement(); //name age hobby
		String[] paramValues= request.getParameterValues(paramName); 
		
		out.print(paramName + ": ");
		for(int i=0; i<paramValues.length; i++){
			String paramVal = paramValues[i];
			out.print(paramVal);
		}
		out.print("<br>");
	}

%>
<hr>

<h1>map - keySet for</h1>

<%
	Map<String, String[]> paraMap= request.getParameterMap();
	
	Set<String> keySet = paraMap.keySet();
	for(String key :keySet){
		String[] values = paraMap.get(key);
		out.print(key + ": ");
		
		for(String val : values){
			out.print(val);
		}
		out.print("<br>");
	}
%>
<hr>
<h1>map keySet Iterator</h1>
<%
	Iterator<String> iterator = keySet.iterator();
	while(iterator.hasNext()){
		String a = iterator.next();
		String [] values = paraMap.get(a);
		out.print(a + ":") ;
		for(String b : values ){
			out.print(b+" ");
		}
		out.print("<br>");
		
	}
%>
<hr>
<h1>map entrySet</h1>
<%
	Set<Entry<String, String[]>> entrySet = paraMap.entrySet();

	for(Entry<String, String[]> entry : entrySet){
		String key= entry.getKey();
		out.print(key + ": ");
		String[] values = entry.getValue();
		
		for(int i=0; i < values.length ; i++){
			out.print(values[i]+" ");
		}
		out.print("<br>");
	}
	
	


/*
	Set set2 = paraMap.entrySet();
	Iterator iterator2 = set2.iterator();
	
	while(iterator2.hasNext()){
		Entry<String, String[]> entry = (Entry)iterator2.next();
		String key = (String)entry.getKey();
		String val[] = entry.getValue();
		
		
	}
*/
%>


</body>
</html>
