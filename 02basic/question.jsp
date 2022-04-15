<%@page import="java.util.Collections"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStreamReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 기본 객체 사용하여 자원 읽기</title>
</head>
<body>

<%
	List<Integer> list1=new ArrayList<Integer>();
	List<Integer> list2=new ArrayList<Integer>();
	list1.add(1);	list1.add(3);
	list1.add(4);list1.add(5);list1.add(8);
	
	list2.add(1);list2.add(8);
	list2.add(5);list2.add(7);list2.add(10);
	
	// kyo     1,8,5     cha   list1-list2    3,4   hap 1,3,4,5,7,8,10   
	// 순서는 신경쓰지마세요.
	List<Integer> kyo=new ArrayList<Integer>();
	List<Integer> cha=new ArrayList<Integer>();
	List<Integer> hap=new ArrayList<Integer>();
	
	
	// list1 = 1 3 4 5 8
	// list2 = 1 5 7 8 10		
	
    //kyo, cha, hap 구하는 코드
    // 작성하세요.
    
    
    //kyo
    for(int i=0; i<list1.size(); i++){
    	
		for(int j=0; j<list2.size(); j++){
	
	if(list1.get(i) == list2.get(j)){
		kyo.add(list1.get(i));
	}
	
		}
    	
    }
	
    //cha
    // 
	for (int i = 0; i < list1.size(); i++) {

		for (int j = 0; j < list2.size(); j++) {
			
			
			}
		
		}


	//hap
	// 어떻게?
	// List1에 있는 요소를 일단 "전부" hap에 넣고 

	// List2와 hap의 요소들일 비교하고 겹치지 않을때 넣는다

	for (int i = 0; i < list1.size(); i++) {

		for (int j = 0; j < list1.size(); j++) {
			if (hap.size() < list1.size()) {
				hap.add(list1.get(j)); // 일단 다 넣는다

			} else {
				continue;
			}
		}

		for (int j = 0; j < list2.size(); j++) {

			if (hap.indexOf(list2.get(j)) == -1) {
				hap.add(list2.get(j));

			}

		}

	}

	request.setAttribute("kyo", kyo);
	request.setAttribute("cha", cha);
	request.setAttribute("hap", hap);
%>
list1 : <%=list1%><br>
list2 : <%=list2%><br>

kyo <%=request.getAttribute("kyo") %> <br>
cha <%=request.getAttribute("cha") %> <br>
hap <%=request.getAttribute("hap") %> <br>

</body>
</html>