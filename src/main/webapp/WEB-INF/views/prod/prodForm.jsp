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
<%@include file="/WEB-INF/inc/common_header.jsp"%>
</head>

<body>

	<div class="container">
		<%@include file="/WEB-INF/inc/common_top_menu.jsp"%>
		<div class="row"><h3>상품등록</h3></div>
		<form:form commandName="prod" action="prodRegist" method="post"
			enctype="multipart/form-data">
			<table class="table">
				<tr>
					<th>상품분류</th>
					<td>
		 			<form:select path="prod_type">
						<option value="">----------------</option>
						<form:options items="${prodTypeList}" itemValue="prod_type" itemLabel="prod_type"></form:options>
					</form:select> 
					<form:errors path="prod_type"/>
					</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td>
					<form:input path="prod_name" />
					<form:errors path="prod_name"/>
					</td>
					<th>제조사</th>
					<td>
					<form:input path="prod_com" /> 
					<form:errors path="prod_com"/>
					</td>
				</tr>
				<tr>
					<th>상품가격</th>
					<td>
					<form:input path="prod_price" />
					<form:errors path="prod_price"/>
					</td>

					<th>상품수량</th>
					<td>
					<form:input type="number" path="prod_qty" /> 
					<form:errors path="prod_qty"/>
					</td>
				</tr>

				<tr>
					<td colspan="4" align="right">
					<a href="prodList"
					    class="btn btn-sm btn-default">
					    등록취소
					</a>
					<button type="submit" class="btn btn-sm btn-success">등록하기</button></td>
				</tr>
			</table>
		</form:form>
	</div>
</body>
</html>