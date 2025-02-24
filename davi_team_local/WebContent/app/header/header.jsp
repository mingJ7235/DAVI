<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<title>header</title>
<style>
.headerul ul{
	border-top:0 !important;
	margin: 0;
	padding: 0;
	list-style: none;
	float: right;
}
#menufont li{
	margin: 0;
	padding: 0 4% 0 0;
	list-style: none;
	float: right;
	font-weight:bold;
	font-size:1rem;
}

#myMenu li{
	margin: 0;
	padding: 0 8px 0 0;
	list-style: none;
	float: right;
	font-weight:bold;
	font-size:1rem;
}


@media screen and (max-width: 1450px) {
		li{
			font-size:1rem;
		}		
}
@media screen and (max-width: 736px) {
		.secret{
			display: none;
		}		
}

/* #main-menu>li {
	float: left;
	position: relative;
}

#main-menu>li>a {
	font-size: 1rem;
	color: #ffaec9;
	text-align: center;
	text-decoration: none;
	letter-spacing: 0.05em;
	display: block;
	padding: 14px 36px;
	text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.2);
} */

#sub-menu {
	position: absolute;
	background: #ffffff9e;
	opacity: 0;
	visibility: hidden;
	transition: all 0.15s ease-in;
}


#sub-menu>li {
	padding: 5px 0;
	border-bottom: 1px solid rgba(0, 0, 0, 0.15);
	margin-top: 5px;
}


#sub-menu>li>a {
	color: #7f888f;
	text-decoration: none;
}


/* #main-menu>li:hover #sub-menu {
	opacity: 1;
	visibility: visible;
} */

#sub-menu>li>a:hover {
	text-decoration: underline;
}

#menuHover:hover #sub-menu{
	opacity: 1;
	visibility: visible;
}

#menufont a{
	color: black;
}

</style>
</head>
<body>
	<!-- Header -->
	<header id="header" style="display: block; border-bottom: solid 2px rgba(210, 215, 217, 0.75);">
		<div class="row headerul" style="display:flex; justify-content:space-between;">
			
			<div style="display:flex; width:70%;">
				<div style="display:flex; margin-right:2%; margin-left:4%;">
					<a href="${pageContext.request.contextPath}/index.jsp" class="logo" style="padding-bottom: 
					0px; font-weight:bold; font-size:3rem; color: rgba(0, 59, 251, 1); font-style:italic">
						DAVI
					</a>
				</div>
				
				<div  style="padding-left:1.5em; display:flex; align-items:center; width:80%;">
					<ul id="menufont" class="secret" style="width:100%; display:flex; justify-content:flex-start;">
						<li><a href="#">메인</a></li>
						<li><a href="#" style="color:rgba(0, 59, 251, 1);">보고서</a></li>
						<li><a href="#" style="color:rgba(0, 59, 251, 1);">식단</a></li>
						<c:choose>
							<c:when test="${not empty session_id }">
								<li id="menuHover"><a href="#">식단인증게시판</a>
									<ul id="sub-menu" style="display: flex;flex-direction: column;">
										<li><a href="${pageContext.request.contextPath}/board/ceritificatedBoard.bo" >일반인증게시판</a></li>
										<li><a href="${pageContext.request.contextPath}/board/bestList.bo" >베스트인증게시판</a></li>
									</ul>
								</li>
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.request.contextPath}/member/login.me?certificatedCheck=true">식단인증게시판</a></li>
							</c:otherwise>
						</c:choose>
						<li><a href="${pageContext.request.contextPath}/board/freeList.bo">자유게시판</a></li>	
								<li id="menuHover"><a href="#">치팅모임</a>
									<ul id="sub-menu" style="display: flex;flex-direction: column;">
										<li><a href="${pageContext.request.contextPath}/board/cheatList.bo?searchWord=서울" >서울/경기</a></li>
										<li><a href="${pageContext.request.contextPath}/board/cheatList.bo?searchWord=강원" >강원도</a></li>
										<li><a href="${pageContext.request.contextPath}/board/cheatList.bo?searchWord=충청" >충청도</a></li>
										<li><a href="${pageContext.request.contextPath}/board/cheatList.bo?searchWord=경상" >경상도</a></li>
										<li><a href="${pageContext.request.contextPath}/board/cheatList.bo?searchWord=전라" >전라도</a></li>
									</ul>
								</li>
						<li><a href="#">홈트레이닝</a></li>
					</ul>
				</div>
			</div>
			
			<div style="display: flex; justify-content: flex-end; align-items:center; width:30%;">
				<ul id="myMenu" style="margin-right: 3%; display:flex;">
					<!-- 세션의 아이디로그인 정보를 이용하여 if문의 조건 검색 -->
					<c:if test="${not empty sessionScope.session_id}">						
						<li>(${sessionScope.session_id})님 환영합니다.&nbsp;</li>
						<li><a href="${pageContext.request.contextPath}/member/logoutOk.me">로그아웃</a>&nbsp;</li>
					</c:if>
					<c:if test="${empty sessionScope.session_id}">					
						<li><a href="${pageContext.request.contextPath}/app/member/join_after.jsp">회원가입</a></li>
						<li><a href="${pageContext.request.contextPath}/app/member/login.jsp">로그인</a>&nbsp;</li>						
					</c:if>
				</ul>
			</div>
		</div>		
	</header>

</body>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
</html>