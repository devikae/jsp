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
	String star="*";
	for(int i=0; i<=4; i++){
		out.print(star);
		star += "*";	
		out.print("<br>");
	}
%>
<%
	 star="*";
	String blank="&nbsp&nbsp";
	for(int i=0; i<=4; i++){
		
		for(int j=1; j<=2; j++){
			out.print(blank);
		}
		blank += "&nbsp";
		
		for(int k=0; k<5-i; k++){// 한개씪 -1
			out.print(star);
		}

		out.print("<br>");
	}
	
%>
<hr>
<%
	int a =2;
	 star="*";
	 blank="&nbsp&nbsp";
	for(int i=0; i<=4; i++){// 0 1 2 3 4
		//i가 0일때 아래 조건이 5
		//i가 1일때 아래 조건이 4
		
		for(int j=0; j<5-i; j++){ // 0 1 2 3 4
			//공백 5번찍고 -1번씩 빠짐
			out.print(blank);
		}
				
		for(int k=0; k<2*i+1; k++){ //
			// 1 3 5 7 9 
			// 두개씩 증가 (홀수)
			out.print(star);
		}

		out.print("<br>");
	}
	
%>
</body>
</html>