<%@page import="com.study.common.util.ProductList"%>
<%@page import="com.study.common.util.ProdVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/inc/header.jsp" %>
<title>제품 목록</title>
<style>
.prod-list tbody td {border: 1px dashed;}
.prod-list tbody ul {padding-left: 20px;}
.prod-list tbody ul li {list-style: none; line-height: 1.4em;}

.prod-title a ,
.prod-title a:active,
.prod-title a:focus   {text-overflow:ellipsis; text-decoration: none; }

.prod-image {text-align: center;}
.prod-image img {
	 height: 150px; 
}
</style>
</head>
<body>
<%
	List<ProdVO> prodList = ProductList.getProductList();
	request.setAttribute("prodList", prodList);
%>

${count =0;""}

<div class="container">
<h3>제품 목록</h3>
<table class="prod-list">
	<caption class="hidden"><em>컴퓨터 제품 목록</em></caption>
	<colgroup>
		<col style="width: 33%;">
		<col style="width: 33%;">
		<col />
	</colgroup>
	<tbody>
				<c:forEach begin="1" end="3" var="i">
					<tr>
						
						<c:forEach begin="1" end="3" var="j">

							<td>
								<ul>
									<li class="prod-image"><a href="prodView.jsp?prodId=${prodList[count].prodId }"><img alt=""src="/study/resources/images/prod/${prodList[count].prodId }.jpg"></a>
									<li class="prod-title"><a href="prodView.jsp?prodId=${prodList[count].prodId}">${prodList[count].prodName }</a>
									<li class="prod-price">${prodList[count].prodPrice}
									<li class="prod-reg-date">${prodList[count].prodRegDate }
									<c:set var="count" value="${count + 1}" />
								</ul>
							</td>
						</c:forEach>

					</tr>
				</c:forEach>
	</tbody>

</table>
</div>
</body>
</html>
