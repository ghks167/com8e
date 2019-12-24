<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<div class="col-sm-12 main_search_area">
		<a href="${pageContext.request.contextPath}"><div class="col-sm-3 logo_area">
			<img alt="" class="img-rounded" src="${pageContext.request.contextPath}/images/logo.png">
		</div></a>
		<form action="${pageContext.request.contextPath}/common/searchList" id="search_form">
		<div class="col-sm-7 search_text_area">
			<div class="form-group has-success has-feedback">
  				<input type="text" name="keyword" class="form-control" id="inputSuccess2" aria-describedby="inputSuccess2Status">
  				<span class="glyphicon glyphicon-search form-control-feedback" aria-hidden="true"></span>
  				<span id="inputSuccess2Status" class="sr-only">(success)</span>
			</div>
		</div>
		<div class="col-sm-2 search_btn_area">
			
			<button id="id_search" type="button" class="btn btn-success">통합검색</button>
			
		</div>
		</form>	
	</div>
	
	<script type="text/javascript">
	var btn = document.getElementById("id_search");
	
	btn.onclick = function () {
		console.log($('[name="keyword"]').val());
		if($('[name="keyword"]').val() == ""){
			alert("검색어를 입력해주세요");
		}
		else if($('[name="keyword"]').val().length < 2 ){
			alert("두 글자 이상부터 검색 가능합니다.")
		}
		 else if ($('[name="keyword"]').val() != "" || $('[name="keyword"]').val().length >= 2 ){
		$("#search_form").submit();
		} 
	}
	
	
	
	</script>
