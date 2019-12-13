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
<%@include file="/WEB-INF/inc/common_header.jsp"%>
<title>상품리스트</title>
<style type="text/css">


.preview_image > img{
	width: 100%;
	height: 160px;

}
.price_area{
	border: solid 1px;
	border-left-color: lightgray;
	border-right-color: lightgray;
	border-bottom: hidden;
	border-top: hidden;
	height: 160px;
	
}
.name_area > a{
	font-size: x-large;

}
.page-header > h4{
	margin-top: 0px;
	margin-bottom: 3px;
	
}


</style>
</head>
<body>
	<%@include file="/WEB-INF/inc/common_top_menu.jsp"%>
	<div class="container">
		<%@include file="/WEB-INF/inc/common_main_search.jsp" %>
		<h1>상품목록</h1>
		<div class="main_area">
			<form:form commandName="searchVO" action="/prod/prodList" method="post" id="id_list_form">
				<c:forEach var="prod" items="${prodList}">
					<div class="col-sm-12">
						<hr>
					</div>
					<div class="col-sm-12 prod_obj">
						<div class="col-sm-2 preview_image">
							<img class="img-thumbnail" alt="" src="${pageContext.request.contextPath}/upload/PROD_MAIN/${prod.map.PROD_M.image_file_name}">
						</div>
						<div class="col-sm-6 name_area">
							<div class="page-header">
								<h4>
									<a href="/prod/prodView?prod_no=${prod.prod_no}">${prod.prod_name}</a>
								</h4>
								<h4>
									<small>${prod.prod_type} </small>
								</h4>
							</div>
							<div class="qty_area">
								<h5>잔여수량 : ${prod.prod_qty}</h5>
							</div>
						</div>
						<div class="col-sm-2 price_area">
							<h3>${prod.prod_price} 원</h3>
							<br>
						</div>
						<div class="col-sm-2">
							<h3>${prod.prod_com}</h3>
						</div>
					</div>
	
				</c:forEach>
				<nav class="text-center">
				  <ul class="pagination">
				  	<!-- 이전 페이지  -->
				    <li>
				      <a href="#" aria-label="Previous" onclick="f_pre(${searchVO.startPage})">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    
				    <!-- 페이징  -->
				    <c:forEach var="i" begin="${searchVO.startPage}" end="${searchVO.endPage}" >
				    	<c:if test="${i ==  searchVO.curPage}">
				    		<li class="active"><a href="#">${i}</a></li>
				    	</c:if>
				    	<c:if test="${i !=  searchVO.curPage}">
				    		<%-- 기존 코드 
				    			<li><a href="?curPage=${i}">${i}</a></li> 
				    		--%>
				    		<li><a href="#" onclick="fn_go_page(${i})" >${i}</a></li>
				    	</c:if>
				    </c:forEach>		    
				    
				    <!-- 다음 페이지  -->
				    <li>
				      <a href="#" aria-label="Next" onclick="f_nex(${searchVO.startPage})">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				    
				    
				  </ul>
				</nav>
				<input type="hidden" name="curPage" value="${searchVO.curPage }">
				<input type="hidden" name="screenListSize" value="${searchVO.screenListSize}" id="screenListSize">
				<input type="hidden" name="pageListSize" value="${searchVO.pageListSize}">
				<input type="hidden" name="totalPageCount" value="${searchVO.totalPageCount}">
			</form:form>
		</div>
		<%@include file="/WEB-INF/inc/common_footer.jsp"%>
	</div>
	<script type="text/javascript">
	
		var f = document.getElementById("id_list_form");
		// 퐁 서브밋 
		var fn_search_submit = function(){
			
			f.submit();
		}
		
		// 페이지 변경후 서브밋 호출 
		var fn_go_page = function(p){
		
			f.curPage.value = p;
			fn_search_submit();	
		}
		
	</script>
</body>
</html>