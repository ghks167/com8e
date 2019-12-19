<%@page import="com.com8e.prod.service.IProdService"%>
<%@page import="com.com8e.prod.dao.IProdDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@include file="/WEB-INF/inc/common_header.jsp"%>
	<jsp:useBean id="searchVO" class="com.com8e.prod.vo.ProdSearchVO"></jsp:useBean>
	<jsp:setProperty property="*" name="searchVO" />
	


	
<div class="col-sm-12">
	<ul class="nav nav-tabs nav-justified category_list">
	<li role="presentation" class="active"><a href="${pageContext.request.contextPath}/prod/prodList">전체</a></li>
	


	<c:forEach var="type" items="${typeList}" varStatus="i">
	
	<c:if test="${i.count eq 5}">
	<br>
	</c:if>
	
	
			<li role="presentation" class="active">
			<a href='<c:url value="/prod/prodList?searchClass=${type.prod_type}" />'>
				${type.prod_type}
			</a>
		</li>	
	</c:forEach>
	
	
	</ul>
</div>