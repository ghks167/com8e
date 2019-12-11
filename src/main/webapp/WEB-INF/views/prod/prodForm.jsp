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
<title>타이틀 입력</title>
<%@include file="/WEB-INF/inc/common_header.jsp"%>
<style>
	.imgwrap{
		width: 300px;
		margin-top: 50px;
	}
	.img_wrap img {
		max-width : 100%;
	}
</style>
</head>

<body>

	<div class="container">
		<%@include file="/WEB-INF/inc/common_top_menu.jsp"%>
		<div class="row"><h3>제품등록</h3></div>
		<form:form commandName="prod" action="prodRegist" method="post"
			enctype="multipart/form-data">
			<table class="table">
				<tr>
					<th>제품분류</th>
					<td>
		 			<form:select path="prod_type">
						<option value=""> - - - - - - - - - - - - - - - - </option>
						<form:options items="${prodTypeList}" itemValue="prod_type" itemLabel="prod_type"></form:options>
					</form:select> 
					<form:errors path="prod_type"/>
					</td>
				</tr>
				<tr>
					<th>제품명</th>
					<td>
					<form:input path="prod_name" />
					<form:errors path="prod_name"/>
					</td>
					<th>제조사</th>
					<td>
					<form:input path="prod_com" /> 
					<form:errors path="prod_com"/>
					</td>
				</tr>
				<tr>
					<th>제품 이미지</th>
					<td>
						<input type="text" id="fileName" class="file_input_image_textbox"
											readonly="readonly">
						<div class="file_input_div">
							<input type="button" value="등록"
								class="file_input_button" /> 
								<input type="file" class="file_input_image_hidden" onchange="javascript: document.getElementById('fileName').value = this.value" />
						</div>
					</td>
					
					
					<th>제품 설명</th>
					<td>
						<input type="text" id="fileName2" class="file_input_info_textbox" readonly="readonly">
						<div class="file_input_div">
							<input type="button" value="등록" class="file_input_button" />
							 <input type="file" class="file_input_info_hidden" onchange="javascript: document.getElementById('fileName2').value = this.value" />
						</div>
					</td>
				</tr>
				<tr>
				<th></th>
				<td>
				<div>
					
				</div>
				<div class="img_wrap">
				<h2><b>제품 이미지 미리보기</b></h2>
					<img id="img1" />
				</div>
				</td>
				<th></th>
				<td>
				<div class="img_wrap">
				<h2><b>제품 상세정보 미리보기</b></h2>
					<img id="img2" />
				</div>
				</td>
				</tr>
				<tr>
					<th>제품가격</th>
					<td>
					<form:input path="prod_price" />
					<form:errors path="prod_price"/>
					</td>

					<th>제품수량</th>
					<td>
					<form:input type="number" path="prod_qty" /> 
					<form:errors path="prod_qty"/>
					</td>
				</tr>
				<tr>
					<td colspan="4" align="right">
					<a href="prodList"
					    class="btn btn-sm btn-default">
					    등록취소
					</a>
					<button type="submit" class="btn btn-sm btn-success">등록하기</button></td>
				</tr>
			</table>
		</form:form>
	</div>
</body>
<script type="text/javascript">
						var v_sel_file;
						
						$(document).ready(function(){
							$(".file_input_image_hidden").on("change",handleImgFileSelect);
						});
						
						function handleImgFileSelect(e){
							var files = e.target.files;
							var filesArr = Array.prototype.slice.call(files);
							
							filesArr.forEach(function (f) {
								if(!f.type.match("image.*")){
									alert("이미지 파일이 아닙니다.");
							
									document.getElementsByClassName("file_input_image_hidden")[0].value = "";
									return;
								}
								
								v_sel_file = f;
								
								var reader = new FileReader();
								reader.onload = function(e){
									$("#img1").attr("src",e.target.result);
								}
								reader.readAsDataURL(f);
								});
							}
						
						$(document).ready(function(){
							$(".file_input_info_hidden").on("change",handleInfoFileSelect);
						});
						
						function handleInfoFileSelect(e){
							var files = e.target.files;
							var filesArr = Array.prototype.slice.call(files);
							
							filesArr.forEach(function (f) {
								if(!f.type.match("image.*")){
									alert("이미지 파일이 아닙니다.");
							
									document.getElementsByClassName("file_input_info_hidden")[0].value = "";
									return;
								}
								
								var reader = new FileReader();
								reader.onload = function(e){
									$("#img2").attr("src",e.target.result);
								}
								reader.readAsDataURL(f);
								});
							}
						
					</script>
</html>