<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>타이틀 입력</title>
<link
	href="${pageContext.request.contextPath}/bootstrap-3.3.2/css/bootstrap.css"
	rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<script
	src="${pageContext.request.contextPath}/bootstrap-3.3.2/js/bootstrap.js"></script>
</head>

<body>

	<abbr></abbr>
	<div class="container">
		<%@include file="/WEB-INF/inc/common_top_menu.jsp"%>
		<form:form commandName="prod" action="prodRegist" method="post"
			enctype="multipart/form-data">
			<table class="table">
				<tr>
					<th>상품분류</th>
					<form:select path="prod_type">
						<option value="">----------------</option>
						<form:options items="" itemValue="" itemLabel=""></form:options>
					</form:select>
				</tr>
				<tr>
					<th>상품명</th>
					<td><form:input path="prod_name" /> <form:errors
							path="prod_name" delimiter="span" /></td>
					<th>상품ID</th>
					<td><form:input path="prod_id" /> <form:errors
							path="prod_name" delimiter="span" /></td>
				</tr>
				<tr>
					<th>상품가격</th>
					<td><form:input path="prod_price" /> <form:errors
							path="prod_name" delimiter="span" /></td>

					<th>상품수량</th>
					<td><form:input type="number" path="prod_qty" /> <form:errors
							path="prod_name" delimiter="span" /></td>
				</tr>
				<tr>
					<th>제조사</th>
					<form:input path="prod_com" />
					<form:errors path="prod_name" delimiter="span" />
				</tr>
				<tr>
					<td colspan="4" align="right"><a href="prodList"
					    class="btn btn-sm btn-default">등록취소</a>
					<button type="submit" class="btn btn-sm btn-success">등록하기</button>
				</tr>
			</table>
		</form:form>
	</div>
</body>
</html>