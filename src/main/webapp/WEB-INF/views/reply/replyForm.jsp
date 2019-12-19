<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<c:forEach var="reply" items="${replyList}">
	<div class="col-sm-12 reply_list_area" data-re_no = "${reply.re_no}">
		<div class="col-sm-2">${reply.re_mem } : </div>
		<div class="col-sm-9 text_over">${reply.re_content}</div>
		<div class="col-sm-1"><button type="button" class="btn btn-default btn-xs" onclick="f_comment_set(this)">답글달기</button></div>
	</div>
	<c:forEach var="comment" items="${reply.comment}">
		<div class="col-sm-12 recomend_area">
			<div class="col-sm-1" style="text-align: right;">&#8618;</div>
			<div class="col-sm-2">${comment.re_mem}</div>
			<div class="col-sm-9 text_over">${comment.re_content}</div>
		</div>
	</c:forEach>
</c:forEach>
