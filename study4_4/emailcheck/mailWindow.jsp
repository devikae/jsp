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
	<h1>인증번호</h1><input type="text" name="authKey" value="" class="form-control input-sm">
	<br>
	<button type="button" id="authKeyCompare" onclick="mailAuth()">메일 인증키 확인</button> 
</body>
<script type="text/javascript">
	$(document).ready(function(){
		$("#authKeyCompare").on("click", function(){
// 			alert(opener.document.getElementById("memMail").value)
			var mail = opener.document.getElementById("memMail").value;
			var authKey = $("input[name='authKey']").val();
			$.ajax({
				url : "<c:url value='/join/authKeyCompare.wow'/>",
				data : {"mail" : mail ,  "authKey" : authKey },
				// 사용자가 입력한 authKey
				success : function(data) {
					alert(data)
				},
				error : function (req) {
					
				}
			
		}); // ajax
			
			
		})	// 메일 인증키 확인버튼 
	});

</script>
</html>