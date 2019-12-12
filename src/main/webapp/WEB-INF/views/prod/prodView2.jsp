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
				<div class="row"><h3>제품 상세</h3></div>
		
		<form:form method="post" action="prodEdit"
					 commandName="prod" enctype="multipart/form-data">
			<table class="table">
				<tr>
					<th>제품명</th>
					<td>
						${prod.prod_name}
					</td>
				</tr>
				
				<tr>
					<th>제조사</th>
					<td>
						 ${prod.prod_com}
					</td>
				</tr>
				
				<tr>
					<th> 가격</th>
					<td> 
						${prod.prod_price}
					</td>
				</tr>
				
				<tr>
					<th>수량 </th>
					<td>
						${prod.prod_qty}
					</td>
				</tr>
				
				<tr>
					<th> 제품 분류</th>
					<td>
						${prod.prod_type}
					</td>
				</tr>
				
				<tr>
					<th> 제품 설명 </th>
					<td>
						제품 설명
					</td>
				</tr>
				
				<tr>
					<th>제품 이미지</th>
				</tr>
				
				<tr>
					<td>
						제품 이미지 들어감						
					</td> 
				</tr>
				
				<tr>
					<td>
						<a href="prodList" class="btn btn-default"> 제품 목록 </a>
						<button type="submit" class="btn btn-default"> 수정 </button>
					 </td>
					
				</tr>
			</table>
			
	
			
		</form:form>
		 
		
	</div>
</body>
</html>