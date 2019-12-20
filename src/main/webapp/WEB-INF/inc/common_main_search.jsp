<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<div class="col-sm-12 main_search_area">
		<div class="col-sm-3 logo_area">
			<img alt="" class="img-rounded" src="${pageContext.request.contextPath}/images/logo.png">
		</div>
		<div class="col-sm-7 search_text_area">
			<div class="form-group has-success has-feedback">
  				<input type="text" class="form-control" id="inputSuccess2" aria-describedby="inputSuccess2Status">
  				<span class="glyphicon glyphicon-search form-control-feedback" aria-hidden="true"></span>
  				<span id="inputSuccess2Status" class="sr-only">(success)</span>
			</div>
		</div>
		<div class="col-sm-2 search_btn_area">
			<button type="button" class="btn btn-success">통합검색</button>
		</div>
		
	</div>
