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
.preview_image>img {
	width: 100%;
	height: 160px;
}

.price_area {
	border: solid 1px;
	border-left-color: lightgray;
	border-right-color: lightgray;
	border-bottom: hidden;
	border-top: hidden;
	height: 160px;
}

.name_area>a {
	font-size: x-large;
}

.page-header>h4 {
	margin-top: 0px;
	margin-bottom: 3px;
}

.category_area {
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/inc/common_top_menu.jsp"%>
	<div class="container">
		<%@include file="/WEB-INF/inc/common_main_search.jsp"%>
		<h1>상품목록</h1>
		<hr>
		<div class="main_area col-sm-12">
			<form:form commandName="searchVO"
				action="${pageContext.request.contextPath}/prod/prodList"
				method="post" id="id_list_form">


				<div class="btn-group btn-group-justified col-sm-12 category_area"
					role="group" aria-label="...">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default"
							data-value="${type.prod_type}" onclick="f_caterory_select(this)">전체</button>
					</div>
					<c:forEach var="type" items="${prodTypeList}">
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-default"
								data-value="${type.prod_type}" onclick="f_caterory_select(this)">${type.prod_type}</button>
						</div>
					</c:forEach>
				</div>

				<div class="col-md-2">
					<div class="col-sm-1">
						<span class="glyphicon glyphicon-menu-hamburger"
							aria-hidden="true"></span>
					</div>
					<div class="col-sm-9">
						<form:select path="screenListSize" cssClass="form-control"
							id="id_screen_list_size">
							<form:option value="10">10</form:option>
							<form:option value="20">20</form:option>
							<form:option value="30">30</form:option>
						</form:select>
					</div>
				</div>
				<div class="col-md-3">
					<h5>${searchVO.totalRowCount}개상품&emsp; &emsp; 현재Page
						${searchVO.curPage} /전체Page ${searchVO.totalPageCount}</h5>
				</div>
				<div class="col-md-7">
					<div class="col-sm-1">
						<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
					</div>
					<div class="col-sm-3">
						<form:select path="searchType" cssClass="form-control">
							<form:option value="N">상품이름</form:option>
							<form:option value="C">제조사</form:option>
						</form:select>
					</div>
					<div class="col-sm-6">
						<form:input path="searchWord" cssClass="form-control" />
					</div>
					<div class="col-sm-2">
						<input type="submit" class="btn btn-primary btn-sm" value="검색">
						&nbsp;<br>
						<a href="${pageContext.request.contextPath}/prod/prodForm"><button type="button" class="btn btn-success btn-sm" id="id_add_btn">상품추가</button></a>
					</div>


				</div>






				<c:forEach var="prod" items="${prodList}">
					<div class="col-sm-12">
						<hr>
					</div>
					<div class="col-sm-12 prod_obj">
						<div class="col-sm-2 preview_image">
							<img class="img-thumbnail" alt=""
								src="${pageContext.request.contextPath}/upload/PROD_MAIN/${prod.map.PROD_M.image_file_name}">
						</div>
						<div class="col-sm-6 name_area">
							<div class="page-header">
								<h4>
									<a
										href="${pageContext.request.contextPath}/prod/prodView?prod_no=${prod.prod_no}">${prod.prod_name}</a>
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
							<h3 class="price">${prod.prod_price}</h3>
							<br>
						</div>
						<div class="col-sm-2">
							<h3>${prod.prod_com}</h3>
						</div>
					</div>

				</c:forEach>
				<nav class="text-center col-sm-12">
					<ul class="pagination">
						<!-- 이전 페이지  -->
						<li><a href="#" aria-label="Previous"
							onclick="f_pre(${searchVO.startPage})"> <span
								aria-hidden="true">&laquo;</span>
						</a></li>

						<!-- 페이징  -->
						<c:forEach var="i" begin="${searchVO.startPage}"
							end="${searchVO.endPage}">
							<c:if test="${i ==  searchVO.curPage}">
								<li class="active"><a href="#">${i}</a></li>
							</c:if>
							<c:if test="${i !=  searchVO.curPage}">
								<%-- 기존 코드 
				    			<li><a href="?curPage=${i}">${i}</a></li> 
				    		--%>
								<li><a href="#" onclick="fn_go_page(${i})">${i}</a></li>
							</c:if>
						</c:forEach>

						<!-- 다음 페이지  -->
						<li><a href="#" aria-label="Next"
							onclick="f_nex(${searchVO.startPage})"> <span
								aria-hidden="true">&raquo;</span>
						</a></li>


					</ul>
				</nav>
				<form:hidden path="curPage" />
				<form:hidden path="pageListSize" />
				<form:hidden path="totalPageCount" />
				<form:hidden path="searchClass" id="id_searchClass" />

			</form:form>
		</div>
		<%@include file="/WEB-INF/inc/common_footer.jsp"%>
		<%@include file='/WEB-INF/views/common/common_side.jsp'%>
	</div>
	<script type="text/javascript">
	
	$(document).ready(function() {
		v_mem= "${mem_id}"
	if(v_mem !="cyh9629"||v_mem ==''){
		$("#id_add_btn").hide();
	}
	
	});	
	
		var f = document.getElementById("id_list_form");
		// 퐁 서브밋 
		var fn_search_submit = function(){
			
			f.submit();
		};
		
		// 페이지 변경후 서브밋 호출 
		var fn_go_page = function(p){
		
			f.curPage.value = p;
			fn_search_submit();	
		};
		
		document.getElementById("id_screen_list_size").onchange = function () { fn_search_submit(); };
		
		
		function f_pre(p) {
			f.curPage.value = parseInt(p) - parseInt(f.pageListSize.value);
			if(1 > f.curPage.value ){
				f.curPage.value = 1; 
			}
			f.submit();
		}
		
		function f_nex(p) {
			f.curPage.value = parseInt(p) + parseInt(f.pageListSize.value);
			if(f.totalPageCount.value < f.curPage.value){
				f.curPage.value = f.totalPageCount.value;
			}
			f.submit();
		}													
		
		function f_caterory_select(p){
			$("#id_searchClass").val(p.dataset.value);
			f.submit();
		}
		
		var price_arr = document.getElementsByClassName("price");
		
		for(var i = 0; i<price_arr.length; i++){
			$(price_arr[i]).html(numberWithCommas($(price_arr[i]).html()) + "원");
		}
		
		
	</script>
</body>
</html>