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
<!-- 기본 -->
<body>
	<%@include file="/WEB-INF/inc/common_top_menu.jsp"%>
	<div class="container">
		<div class="main_area col-sm-12">
			<h1>주문</h1>
			<hr>		
			<table class="table table-striped">
				<c:forEach var="jumun" items="${jumun_list}">
					<tr>
						<td>
							<div class="col-sm-2 preview_image">
								
								<img class="img-thumbnail" alt="" src="${pageContext.request.contextPath}/upload/PROD_MAIN/${jumun.jl_image_name}">
							</div>
							<div class="col-sm-7 name_area">
								<div class="page-header" style="margin-bottom: 5px;">
									<h4>
										${jumun.jl_prod_name}
									</h4>
								</div>
								<div class="qty_area col-sm-12" >
									<h5 id="id_price_area">선택수량 : ${jumun.jl_prod_qty}</h5>
								</div>
								
							</div>
							<div class="col-sm-3 price_area">
								<h3>${jumun.jl_prod_qty * jumun.jl_prod_price} 원</h3>
								<input type="hidden" value="${jumun.jl_prod_qty * jumun.jl_prod_price}" class="prod_price">
								<br>
							</div>
						</td>
					</tr>			
				</c:forEach>
				<tr>
					<td>
						<div class="col-sm-12" style="text-align: right;">
							<h3 id="id_total_price"></h3>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<%@include file="/WEB-INF/inc/common_footer.jsp"%>
	</div>
</body>
<script type="text/javascript">

	$(document).ready(function name() {
		var arr_price = document.getElementsByClassName("prod_price");
		var total = 0;
		for(var i = 0; i<arr_price.length; i++){
			console.log(arr_price[i]);
			total += parseInt($(arr_price[i]).val());
		}
		$("#id_total_price").html("총 금액 : "+total);
	});



</script>
</html>