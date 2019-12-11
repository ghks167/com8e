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
</head>

<body>
	<div class="container">
		<%@include file="/WEB-INF/inc/common_top_menu.jsp"%>
		<form:form method="post" action="prodRegist"
					 commandName="prod" enctype="multipart/form-data">
					 
		
		</form:form>
		 
		
	</div>
</body>
</html>