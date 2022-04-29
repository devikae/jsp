
<%@page import="com.study.free.service.FreeBoardServiceImpl"%>
<%@page import="com.study.free.service.IFreeBoardService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.study.free.vo.FreeBoardVO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html lang="ko">
<head>
<%@include file="/WEB-INF/inc/header.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/inc/top.jsp"%>

<jsp:useBean id="searchVO" class="com.study.free.vo.FreeBoardSearchVO"></jsp:useBean>
<jsp:setProperty property="*" name="searchVO"/>

${searchVO }

<%
	IFreeBoardService freeBoardService = new FreeBoardServiceImpl();
	List<FreeBoardVO> freeBoardList= freeBoardService.getBoardList(searchVO);
	request.setAttribute("freeBoardList", freeBoardList); 
%>
<hr>
${searchVO }

<div class="container">
	<div class="page-header">
		<h3>자유게시판 - <small>글 목록</small></h3>
	</div>
	
		<!-- START : 검색 폼  -->
		<div class="panel panel-default collapse in" id="id_search_area">
			<div class="panel-body">
				<form name="search" action="memberList.jsp" method="post" class="form-horizontal">
					<input type="hidden" name="curPage" value=""> <input type="hidden" name="rowSizePerPage" value="">
					<div class="form-group">
						<label for="id_searchType" class="col-sm-2 control-label">검색</label>
						<div class="col-sm-2">
							<select id="id_searchType" name="searchType" class="form-control input-sm">
								<option value="NM" >이름</option>
								<option value="ID" >아이디</option>
								<option value="HP" >핸드폰번호</option>
							</select>
						</div>
						<div class="col-sm-2">
							<input type="text" name="searchWord" class="form-control input-sm" value="" placeholder="검색어">
						</div>
						<div>
							<label for="id_searchJob" class="col-sm-1 col-sm-offset control-label">직업</label>
							<div class="col-sm-2">
								<select id="id_searchJob" name="searchJob" class="form-control input-sm">
									<option value="">-- 전체 --</option>
									<c:forEach items="${jobList}" var="code">
										<option value="${code.commCd}" >${code.commNm}</option>
									</c:forEach>
								</select>
							</div>
							<label for="id_searchHobby" class="col-sm-1 col-sm-offset control-label">취미</label>
							<div class="col-sm-2">
								<select id="id_search" name="searchHobby" class="form-control input-sm">
									<option value="">-- 전체 --</option>
									<c:forEach items="${hobbyList}" var="code">
										<option value="${code.commCd}" >${code.commNm}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-2 col-sm-offset-9 text-right">
							<button type="button" id="id_btn_reset" class="btn btn-sm btn-default">
								<i class="fa fa-sync"></i> &nbsp;&nbsp;초기화
							</button>
						</div>
						<div class="col-sm-1 text-right">
							<button type="submit" class="btn btn-sm btn-primary ">
								<i class="fa fa-search"></i> &nbsp;&nbsp;검 색
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- END : 검색 폼  -->
		
			<!-- START : 목록건수 및 새글쓰기 버튼  -->
		<div class="row" style="margin-bottom: 10px;">
			<div class="col-sm-3 form-inline">
				전체 1000건 조회
				<select id="id_rowSizePerPage" name="rowSizePerPage" class="form-control input-sm">
					<c:forEach var="i" begin="10" end="50" step="10">
						<option value="" ></option>
					</c:forEach>
				</select>
			</div>
		</div>
<!-- END : 목록건수 및 새글쓰기 버튼  -->
	
<div class="row">
    <div class="col-sm-2 col-sm-offset-10 text-right" style="margin-bottom: 5px;" >
        <a href="freeForm.jsp" class="btn btn-primary btn-sm"> 
        	<span class="glyphicon glyphicon-plus-sign" aria-hidden="true"></span>
        	&nbsp;새글쓰기
		</a>
    </div>
</div>
	<table class="table table-striped table-bordered table-hover">
	<colgroup>
		<col width="10%" />
		<col width="15%" />
		<col />
		<col width="10%" />
		<col width="15%" />
		<col width="10%" />
	</colgroup>
	<thead>
		<tr>
			<th>글번호</th>
			<th>분류</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
			<th>조회수</th>
		</tr>
	</thead>	
	<tbody>
	
	<c:forEach items="${freeBoardList }" var="free">
			<tr class="text-center">
			
				<td>${free.boNo }</td>
				<td>${free.boCategoryNM }</td>
				<td class="text-left">
					<a href="freeView.jsp?boNo=${free.boNo }"> 
					${free.boTitle } </a>
				</td>
				<td>${free.boWriter  }</td>
				<td>${free.boRegDate  }</td>
				<td>${free.boHit  }</td>
			</tr>
	</c:forEach>
			
	</tbody>
	</table>
	
	<!-- START : 페이지네이션  -->
		<nav class="text-center">
			<ul class="pagination">

				<!-- 첫 페이지  -->
				<li><a href="memberList.jsp?curPage=1" data-page="1"><span aria-hidden="true">&laquo;</span></a></li>


				<!-- 이전 페이지 -->
				<c:if test="">
					<li><a href="memberList.jsp?curPage=" data-page=""><span aria-hidden="true">&lt;</span></a></li>
				</c:if>

				<!-- 페이지 넘버링  -->
				<!-- 페이지 넘버링  -->
		        <li><a href="memberList.jsp?curPage=6"  data-page="6" >6</a></li>
		        <li><a href="memberList.jsp?curPage=7"  data-page="7" >7</a></li>
		        <li><a href="memberList.jsp?curPage=8"  data-page="8" >8</a></li>
		        <li class="active"><a href="#">9</a></li>
		        <li><a href="memberList.jsp?curPage=10"  data-page="10" >10</a></li>

				<!-- 다음  페이지  -->
				<c:if test="">
					<li><a href="memberList.jsp?curPage=" data-page=""><span aria-hidden="true">&gt;</span></a></li>
				</c:if>

				<!-- 마지막 페이지 -->
				<li><a href="memberList.jsp?curPage=" data-page=""><span aria-hidden="true">&raquo;</span></a></li>
			</ul>
		</nav>
		<!-- END : 페이지네이션  -->
	
	
</div><!-- container --> 
</body>
</html>






