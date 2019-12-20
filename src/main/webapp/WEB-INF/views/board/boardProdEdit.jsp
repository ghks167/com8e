<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="/WEB-INF/inc/common_header.jsp"%>
<title></title>
</head>
<body style="padding-top: 0;">
	<div class="container">
		<div class="main_area">
			<h3>상품선택</h3>
			
			<div class="col-xs-10">
				<input class="form-control" type="text" id="search_keyword" placeholder="상품이름">
			</div>
			<div class="col-xs-2">
				<input id="prod_search" type="button" class="btn btn-default" value="검색">
			</div>
			<div class="col-xs-12">
				<table class="table table-striped">
					<tbody id="list_area">
					
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$("#prod_search").on("click",function(){
		
		
		$.ajax({
			url : "<c:url value='/board/search'/>",
			data : "keyword="+$("#search_keyword").val(),
			dataType: "json",
			type: "post",
			success: function (data) {
				var json = data;
				
			}
		})
	});
</script>
</html>