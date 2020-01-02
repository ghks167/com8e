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
<title>${prod.prod_name}</title>
<style type="text/css">

	
.main_image {
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
}
.main_image > img {
	width: 400px;
	height: 400px;
}
.main_info{
	margin-top: 50px;

}
.info_image{
	margin-bottom: 50px;
}
.info_image > img {
	width: 100%;
}


</style>
</head>
<body>
	<%@include file="/WEB-INF/inc/common_top_menu.jsp"%>
	<div class="container">
		<div class="main_area col-sm-12">
			<h1>${prod.prod_name}</h1>	
			<hr>
			
			<div class="col-sm-6 main_image">
				<img class="img-thumbnail" alt="" src="${pageContext.request.contextPath}/upload/PROD_MAIN/${prod.map.PROD_M.image_file_name }">
			</div>
			<div class="col-sm-6 main_info">
				<table class="table">
					<tr>
						<td><h4>상품명 : &nbsp;&nbsp; ${prod.prod_name}</h4></td>
					</tr>
					<tr>
						<td><h4>분류 : &nbsp;&nbsp; ${prod.prod_type}</h4></td>
					</tr>
					<tr>
						<td><h4>제조사 : &nbsp;&nbsp; ${prod.prod_com}</h4></td>
					</tr>
					<tr>
						<td><h4>잔여수량 : &nbsp;&nbsp; ${prod.prod_qty}</h4></td>
					</tr>
					<tr>
						<td><h2 id="price">가격 : &nbsp;&nbsp;&#8361;&nbsp; ${prod.prod_price}</h2></td>
					</tr>
					<tr>
						<td>
							<div class="col-sm-2" style="margin-top: 5px;">
								수량 :
							</div> 
							<div class="col-sm-3" id="id_select_qty">
								<select class="form-control" id="id_cart_qty">
									  <option value="1">1</option>
									  <option value="2">2</option>
									  <option value="2">3</option>
									  <option value="4">4</option>
									  <option value="5">5</option>
									  <option value="6">6</option>
									  <option value="7">7</option>
									  <option value="8">8</option>
									  <option value="9">9</option>
									  <option value="10">10</option>
								</select>
							</div>
							<div class="col-sm-2">
								<input id="id_input_free" type="button" class="btn btn-default btn-xs" value="직접입력" style="margin-top: 5px;">
							</div>
							<div class="col-sm-5" style="text-align: right;">
								<input id="id_add_cart" type="button" class="btn btn-default" value="장바구니에 담기">
							</div>
						</td>
					</tr>
				</table>	
			</div>
			<br>
			<h2> &nbsp;</h2>
			<hr>
			
			<div class="col-sm-12 info_image">
				<img class="img-thumbnail" alt="" src="${pageContext.request.contextPath}/upload/PROD_INFO/${prod.map.PROD_I.image_file_name }">	
			</div>	
		</div>
		
		<%@include file="/WEB-INF/inc/common_footer.jsp"%>
		<%@include file='/WEB-INF/views/common/common_side.jsp'%>
	</div>
	<script type="text/javascript">
		$("#id_add_cart").on("click",function(){
			if("${LOGIN_INFO}" == ""){
				location.href = "${pageContext.request.contextPath}/login/loginForm";	
			}
			var para = {
					"cart_prod":${prod.prod_no},
					"cart_qty":$("#id_cart_qty").val()
			}
			$.ajax({
				url: "<c:url value='/cart/cartAdd'/>",
				data: para,
				type: "post",
				dataType:"json",
				success: function (data) {
					if(data.result){
						alert("장바구니에 등록되었습니다.");
					}else {
						alert("등록에 실패하였습니다.");
					}
				}
			});//ajax
			
		});
		
		$("#id_input_free").on("click",function(){
			console.log($("#id_select_qty").html());
			$("#id_select_qty").html('<input type="text" id="id_cart_qty" class="form-control" placeholder="수량">');
		});
		
		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
		$("#price").html(numberWithCommas(${prod.prod_price}));

		
	
	</script>
</body>
</html>