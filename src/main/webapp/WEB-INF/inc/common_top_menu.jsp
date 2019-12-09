<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
  <head>
    <!-- 부트스트랩 -->
    <link href="${pageContext.request.contextPath}/bootstrap-3.3.2/css/bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap-3.3.2/js/bootstrap.js"></script>
  </head>
<link rel="stylesheet" href="./bootstrap-3.3.2/css/bootstrap.css">
<nav class="navbar navbar-default navbar-fixed-top">
        <div class="bg-success container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed"
                    data-toggle="collapse" data-target="#navbar" aria-expanded="false"
                    aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span> <span
                        class="icon-bar"></span> <span class="icon-bar"></span> 
                        <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">[기업 로고 이미지]</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <!-- <li class="active bg-warning"><a href="./">Default
                        <span class="sr-only">(현재페이지)</span></a>
                    </li> -->
                    	
						<!-- 로그인 되어있지 않을 경우 -->
					 <%-- <c:if test="${empty ??????}"> --%>
                    <li class="bg-warning"><a href="login/loginForm">로그인</a></li>
                    <li class="bg-warning"><a href="">회원가입</a></li>
					<%-- </c:if> --%>
					
						<!-- 로그인 되어 있을 경우 -->
			<!-- 		<li class="bg-warning"><p> 아이디 님 환영합니다.</p></li> -->
			
                    <li class="bg-warning"><a href="">마이페이지</a></li>
                    <li class="bg-warning"><a href="">장바구니</a></li>

                    <!-- <li class="bg-info"><a href="#">맨 위로</a></li> -->

                </ul>

            </div>
    </div>
</nav>
