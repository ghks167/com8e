<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="/WEB-INF/inc/common_header.jsp"%>
<title>장바구니</title>
<style type="text/css">
.preview_image > img{
	width: 80%;
	height: auto;

}
.price_area{
	border: solid 1px;
	border-left-color: lightgray;
	border-right-color: lightgray;
	border-bottom: hidden;
	border-top: hidden;
	height: 100px;
}
.name_area > a{
	font-size: x-large;

}
.page-header > h4{
	margin-top: 0px;
	margin-bottom: 3px;
}
.page-header {
	margin-top: 0;
}

</style>
</head>
<body>
	<%@include file="/WEB-INF/inc/common_top_menu.jsp"%>
	<div class="container">
		<h1>장바구니</h1>
		<hr>
		<div class="main_area">
				<table class="table table-striped">
					
					<tr>
						<td>
							<div class="col-sm-12 prod_obj">
								<div class="col-sm-2 preview_image">
									<input type="checkbox">
									<img class="img-thumbnail" alt="" src="${pageContext.request.contextPath}/upload/PROD_MAIN/091c0e1e-3675-4279-b27a-e9c0d1ee9d94">
								</div>
								<div class="col-sm-6 name_area">
									<div class="page-header">
										<h4>
											<a href="${pageContext.request.contextPath}/prod/prodView?prod_no=1"></a>
										</h4>
										<h4>
											<small>cpu </small>
										</h4>
									</div>
									<div class="qty_area">
										<h5>선택수량 : 2</h5>
									</div>
								</div>
								<div class="col-sm-2 price_area">
									<h3>484848 원</h3>
									<br>
								</div>
								<div class="col-sm-2">
									<h3>intel</h3>
								</div>
							</div>
						</td>
					</tr>				
				</table>	
			</div>
		<%@include file="/WEB-INF/inc/common_footer.jsp"%>
	</div>
</body>
</html>