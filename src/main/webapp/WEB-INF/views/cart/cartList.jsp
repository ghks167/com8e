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
	padding-bottom: 150px;
}

</style>
</head>
<body>
	<%@include file="/WEB-INF/inc/common_top_menu.jsp"%>
	<div class="container">
		<h1>장바구니</h1>
		<hr>
		<div class="main_area">
			<form:form action="${pageContext.request.contextPath}/jumun/jumunRegist" method="post" id="id_order_form">
					<table class="table table-striped">
						<c:choose>
							<c:when test="${fn:length(cart_list) == 0}">
								<div class="col-sm-12">
									<h3>장바구니가 비어있습니다.</h3>
								</div>
							</c:when>
							<c:otherwise>
								
									<c:forEach var="cart" items="${cart_list}">
										<tr>
											<td>
												<div class="col-sm-12 prod_obj">
													<div class="col-sm-2 preview_image">
														<input type="checkbox" name="cart_no" value="${cart.cart_no}" >
														<img class="img-thumbnail" alt="" src="${pageContext.request.contextPath}/upload/PROD_MAIN/${cart.main_image_name}">
													</div>
													<div class="col-sm-6 name_area">
														<div class="page-header" style="margin-bottom: 5px;">
															<h4>
																<a href="${pageContext.request.contextPath}/prod/prodView?prod_no=${cart.prod.prod_no}">${cart.prod.prod_name}</a>
															</h4>
															<h4>
																<small>${cart.prod.prod_type}</small>
															</h4>
														</div>
														<div class="qty_area col-sm-12" >
															<div class="col-sm-4">
																<h5 id="id_price_area">선택수량 : </h5>
															</div>
															<div class="col-sm-4" style="margin-top: 0; margin-bottom: 0;">
																<select class="form-control" onchange="f_qty_chage(this)" data-cart_no ="${cart.cart_no}">
																	<c:forEach var="i" begin="1" end="99">
																		<c:choose>
																			<c:when test="${i == cart.cart_qty}">
																				<option value="${i}" selected="selected">${i}</option>
																			</c:when>
																			<c:otherwise>
																				<option value="${i}">${i}</option>	
																			</c:otherwise>
																		</c:choose>															
																	</c:forEach>
																</select>
															</div>
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
				</form:form>
				<div class="col-sm-6" style="text-align: left;">
					<input type="button" value="선택상품삭제" class="btn btn-danger" id="id_select_delect">
				</div>
				<div class="col-sm-6" style="text-align: right;">
					<input type="button" value="전체상품주문" class="btn btn-success" id="id_all_order">
					<input type="button" value="선택상품주문" class="btn btn-success" id="id_select_order">
				</div>
			</div>
		<%@include file="/WEB-INF/inc/common_footer.jsp"%>
		<%@include file='/WEB-INF/views/common/common_side.jsp'%>
	</div>
	<script type="text/javascript">
		function f_qty_chage(aa) {
			para = {
					"cart_qty":$(aa).val(),
					"cart_no":aa.dataset.cart_no
			};
			
			$.ajax({
				url: "<c:url value ='/cart/cartQtyChange'/>",
				data: para,
				type: "post"
			});
			
		}
		
		
		$("#id_all_order").on("click",function(){
			var noarr = $("input[type = checkbox][name = cart_no]");
			$(noarr).attr("checked",true);
			
			
			$("#id_order_form").submit();
		});
		
		
		$("#id_select_order").on("click",function(){
			var noarr = $("input[type = checkbox][name = cart_no]");
			for(var i = 0; i<noarr.length; i++){
				if(noarr[i].checked == true){
					$("#id_order_form").submit();
					return;
				}
			}
			
			alert("선택된 상품이 없습니다.")
			
		});
		
		
		$("#id_select_delect").on("click", function() {
			var noarr = $("input[type = checkbox][name = cart_no]:checked");
			var cart_no = [];
			
			for(var i =0; i<noarr.length; i++){
				cart_no.push($(noarr[i]).val());
			}	
			$.ajax({
				url:"<c:url value='/cart/cartDelete'/>",
				data: {"cart_no" : cart_no},
				type: "post",
				dataType: "json",
				success: function (data) {
					if(data.result){
						alert("삭제되었습니다.");
						location.reload();
					}else {
						alert("삭제에 실패했습니다.")
					}
				}
			});
		});
		
	
	
	</script>
</body>
</html>