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
 	min-height: 55vh;
  }
</style>
</head>
<body>
	<%@include file="/WEB-INF/inc/common_top_menu.jsp"%>
	<div class="container">
	<%@include file="/WEB-INF/inc/common_main_search.jsp" %> 
		<div class="main_area">
		<h1><font color="#368AFF">통합검색 결과</font></h1>	
		<hr><br>
		<div class="notice_area">
			<h2>공지사항</h2>
						<div class="top_area col-sm-12 a">
				<div class="form-group">
					<label class="col-sm-6 control-label b">전체 : ${searchVO.totalRowCount},${searchVO.curPage}/${searchVO.totalPageCount}pages </label>
					<div class="col-sm-6 a">
						<div class="col-sm-3 a">
							<select id="ListSize" class="form-control input-sm">
								<option value="10"
									${searchVO.screenListSize == 10 ? 'selected="selected"' : '' }>10개씩
									보기</option>
								<option value="15"
									${searchVO.screenListSize == 15 ? 'selected="selected"' : '' }>15개씩
									보기</option>
								<option value="20"
									${searchVO.screenListSize == 20 ? 'selected="selected"' : '' }>20개씩
									보기</option>
								<option value="30"
									${searchVO.screenListSize == 30 ? 'selected="selected"' : '' }>30개씩
									보기</option>
							</select>
						</div>
						<div class="col-sm-3 a">
							<button type="button" class="btn btn-sm btn-default" onclick="fn_screen_size_change()">선택</button>
						</div>
					</div>
				</div>
				<div class="col-sm-1">
				
				</div>
			</div>
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
							<div class ="paging area col-sm-12">
			<div class = col-sm-10 style="text-align: center">
				<nav>
					<ul class="pagination">
						<c:if test="${searchVO.curPage != searchVO.startPage}">
							<li><a href="#" onclick="fn_go_page(${searchVO.curPage-1})"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:if test="${searchVO.curPage <= searchVO.startPage}">
							<li><a href="#" onclick="" aria-label="Previous"> <span
									aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>

						<!-- 페이징 -->
						<c:forEach var="i" begin="${searchVO.startPage}"
							end="${searchVO.endPage}">
							<c:if test="${i==searchVO.curPage}">
								<li class="active"><a href="#">${i}</a></li>
							</c:if>
							<c:if test="${i!= searchVO.curPage}">
								<li><a href="#" onclick="fn_go_page(${i})">${i}</a></li>
							</c:if>

						</c:forEach>
						<!-- 다음 페이지 -->
						<c:if test="${searchVO.curPage < searchVO.totalPageCount}">
							<li><a href="#" onclick="fn_go_page(${searchVO.curPage+1})"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a>
						</c:if>
						<c:if test="${searchVO.curPage >= searchVO.totalPageCount}">
							<li><a href="#" onclick="" aria-label="Next"> <span
									aria-hidden="true">&raquo;</span> 
							</a>
						</c:if>

					</ul>
				</nav>
				</div>
			</div>
			</div>
			</div>
			<hr><br>
			<div class="freeboard_area">
			<h2>자유게시판</h2>
			<div class="top_area col-sm-12 a">
				<div class="form-group">
					<label class="col-sm-6 control-label b">전체 : ${searchVO.totalRowCount},${searchVO.curPage}/${searchVO.totalPageCount}pages </label>
					<div class="col-sm-6 a">
						<div class="col-sm-3 a">
							<select id="ListSize" class="form-control input-sm">
								<option value="10"
									${searchVO.screenListSize == 10 ? 'selected="selected"' : '' }>10개씩
									보기</option>
								<option value="15"
									${searchVO.screenListSize == 15 ? 'selected="selected"' : '' }>15개씩
									보기</option>
								<option value="20"
									${searchVO.screenListSize == 20 ? 'selected="selected"' : '' }>20개씩
									보기</option>
								<option value="30"
									${searchVO.screenListSize == 30 ? 'selected="selected"' : '' }>30개씩
									보기</option>
							</select>
						</div>
						<div class="col-sm-3 a">
							<button type="button" class="btn btn-sm btn-default" onclick="fn_screen_size_change()">선택</button>
						</div>
					</div>
				</div>
				<div class="col-sm-1">
				
				</div>
			</div>
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
							<div class ="paging area col-sm-12">
			<div class = col-sm-10 style="text-align: center">
				<nav>
					<ul class="pagination">
						<c:if test="${searchVO.curPage != searchVO.startPage}">
							<li><a href="#" onclick="fn_go_page(${searchVO.curPage-1})"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:if test="${searchVO.curPage <= searchVO.startPage}">
							<li><a href="#" onclick="" aria-label="Previous"> <span
									aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>

						<!-- 페이징 -->
						<c:forEach var="i" begin="${searchVO.startPage}"
							end="${searchVO.endPage}">
							<c:if test="${i==searchVO.curPage}">
								<li class="active"><a href="#">${i}</a></li>
							</c:if>
							<c:if test="${i!= searchVO.curPage}">
								<li><a href="#" onclick="fn_go_page(${i})">${i}</a></li>
							</c:if>

						</c:forEach>
						<!-- 다음 페이지 -->
						<c:if test="${searchVO.curPage < searchVO.totalPageCount}">
							<li><a href="#" onclick="fn_go_page(${searchVO.curPage+1})"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a>
						</c:if>
						<c:if test="${searchVO.curPage >= searchVO.totalPageCount}">
							<li><a href="#" onclick="" aria-label="Next"> <span
									aria-hidden="true">&raquo;</span> 
							</a>
						</c:if>

					</ul>
				</nav>
				</div>
			</div>
			</div>
			</div>
			<hr>
		</div> 
		
		<%@include file="/WEB-INF/inc/common_footer.jsp"%>
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