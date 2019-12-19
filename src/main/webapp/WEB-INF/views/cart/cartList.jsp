<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	height: 100px;

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
.main_area{
	min-height: 70vh;
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
					<c:choose>
						<c:when test="${fn:length(cart_list) == 0}">
							<div class="col-sm-12">
								<h3>장바구니가 비여있습니다.</h3>
							</div>
						</c:when>
						<c:otherwise>
							<c:forEach var="cart" items="${cart_list}">
								<tr>
									<td>
										<div class="col-sm-12 prod_obj">
											<div class="col-sm-2 preview_image">
												<input type="checkbox">
												<img class="img-thumbnail" alt="" src="${pageContext.request.contextPath}/upload/PROD_MAIN/${cart.main_image_name}">
											</div>
											<div class="col-sm-6 name_area">
												<div class="page-header">
													<h4>
														<a href="${pageContext.request.contextPath}/prod/prodView?prod_no=${cart.prod.prod_no}">${cart.prod.prod_name}</a>
													</h4>
													<h4>
														<small>${cart.prod.prod_type}</small>
													</h4>
												</div>
												<div class="qty_area">
													<h5 id="id_price_area">선택수량 : ${cart.cart_qty}</h5>
												</div>
											</div>
											<div class="col-sm-2 price_area">
												<h3>${cart.cart_qty * cart.prod.prod_price} 원</h3>
												<br>
											</div>
											<div class="col-sm-2">
												<h3>${cart.prod.prod_com}</h3>
											</div>
										</div>
									</td>
								</tr>
							</c:forEach>		
						</c:otherwise>
					</c:choose>
						
				</table>	
			</div>
		<%@include file="/WEB-INF/inc/common_footer.jsp"%>
	</div>
</body>
</html>