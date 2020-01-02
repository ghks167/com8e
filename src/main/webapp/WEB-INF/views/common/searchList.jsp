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
<title>통합검색</title>
<style type="text/css">
#id_title_tr > th{
	text-align: center;
}
.aa,.bb,.cc {
   padding-left: 0;
   padding-right: 0;
}
.a{
	text-align: left;
}
.b{
	text-align: right;
}
 .notice_area{
	min-height: 20vh;
} 
 .main_area{
 	min-height: 75vh;
  }
  .prodList_area{
  overflow:hidden;
  height: auto;
  }
</style>
</head>
<body>
	<%@include file="/WEB-INF/inc/common_top_menu.jsp"%>
	<div class="container">
	<%@include file="/WEB-INF/inc/common_main_search.jsp" %> 
	<div style="height: 150px">&nbsp;</div>
		<div class="main_area">
		<h1><font color="#368AFF"> <%= request.getParameter("keyword") %>에 대한 통합검색 결과</font></h1>	
		<hr><br>
		<div class="notice_area">
			<h2>공지사항<a href="${pageContext.request.contextPath}/notice/noticeList?searchWord=${param.keyword}"><font color="tomato">&nbsp;&nbsp;☜</font></a></h2>
			<div class="boardList_area col-sm-12">
				<table class="table table-striped">
					<colgroup>
						<col width="10%"/>
						<col width="40%"/>
						<col width="20%"/>
						<col width="10%"/>
						<col width="20%"/>
					</colgroup>
					<tr id="id_title_tr">
						<th>NO.</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>조회수</th>
						<th>작성날짜</th>
					</tr>
					<c:forEach var="board" items="${noticeList}">
						<tr>
							<td align="center">${board.bo_no}</td>
							<td><a
								href="${pageContext.request.contextPath}/notice/noticeView?bo_no=${board.bo_no}">${board.bo_title}&nbsp;&nbsp;</a><a
								href=""><font color=tomato>[${board.bo_re_cnt}]</font></a></td>
							<td align="center">${board.bo_mem}</td>
							<td align="center">${board.bo_hit}</td>
							<td align="center">${board.bo_date}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			</div>
			<hr><br>
			<div class="freeboard_area">
			<h2>자유게시판<a href="${pageContext.request.contextPath}/board/boardList?searchWord=${param.keyword}"><font color="tomato">&nbsp;&nbsp;☜</font></a></h2>
			<div class="top_area col-sm-12 a">
			<div class="boardList_area col-sm-12">
				<table class="table table-striped">
					<colgroup>
						<col width="10%"/>
						<col width="40%"/>
						<col width="20%"/>
						<col width="10%"/>
						<col width="20%"/>
					</colgroup>
					<tr id="id_title_tr">
						<th>NO.</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>조회수</th>
						<th>작성날짜</th>
					</tr>
					<c:forEach var="board" items="${boardList}">
						<tr>
							<td align="center">${board.bo_no}</td>
							<td><a
								href="${pageContext.request.contextPath}/board/boardView?bo_no=${board.bo_no}">${board.bo_title}&nbsp;&nbsp;</a><a
								href=""><font color=tomato>[${board.bo_re_cnt}]</font></a></td>
							<td align="center">${board.bo_mem}</td>
							<td align="center">${board.bo_hit}</td>
							<td align="center">${board.bo_date}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			</div>
			<hr><br> 
			</div>
			<div class="prod_area">
			<hr><br> 
			<h2>상품목록<a href="${pageContext.request.contextPath}/prod/prodList?keyword=${param.keyword}"><font color="tomato">&nbsp;&nbsp;☜</font></a></h2>
			<br>
			<div class="prodList_area">
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
									<a href="${pageContext.request.contextPath}/prod/prodView?prod_no=${prod.prod_no}">${prod.prod_name}</a>
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
		</div>
			<hr>
		</div> 
		</div>
		<%@include file="/WEB-INF/inc/common_footer.jsp"%>
		<%@include file='/WEB-INF/views/common/common_side.jsp'%>
		
	</div>
		
	<script type="text/javascript">
	

	// 페이지 변경 후 서브밋 호출
	var fn_go_page = function (p) {
		var f = document.forms["frm_boardSearch"];
		f.curPage.value = p;
		fn_search_submit(); 
	}

	// 목록갯수 변경 후 선택 버튼 클릭 시 서브밋 호출

	var fn_screen_size_change = function(){
		var f = document.forms["frm_boardSearch"];
		 var v_size = document.getElementById("ListSize");
		 f.screenListSize.value= v_size.value;
		fn_search_submit();
		
	}
	
	</script>
</body>
</html>