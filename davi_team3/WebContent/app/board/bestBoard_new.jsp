<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<!DOCTYPE HTML>
<!--
	Editorial by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
<head>
<title>bestBoard</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/app/board/css/bestBoard.css" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
	integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
	crossorigin="anonymous">
<style>


</style>
</head>
<body class="is-preload">
<c:set var="listsVO" value="${listsVO}"></c:set>
<c:set var="likeCntList" value="${likeCntList}"></c:set>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<c:import url="/app/header/header.jsp" />

				<!-- Section -->
				<div style="display: flex; flex-direction: column; align-items: center; padding:5em 0 2em 0;">
					<img style="width:80%; height:auto;" src="https://cdn.discordapp.com/attachments/829186101029502990/829186131043287060/28e4f757ba966512.png">
				</div>
				<section style="padding-top: 30px; width: 80%; margin: auto;">
					<form name="detailForm" method="post">
					<div id="best_posts" class="best_posts">
						<c:forEach var="i" begin="0" end="${fn:length(listsVO) - 1}">
								<div style="width:30%; margin-bottom:5%; ">
									<a href="javascript:bestDetail(${i + 1})" id="border-${i}" class="image" style="border:1px solid rgba(210, 215, 217, 0.75); ">
									<img
										src="${listsVO[i].getCertificatedPath()}"
										alt=""
										style="display: inline-block; width: 100%; height: 100%; position: absolute; top: 0; left: 0;" />
									<div id="cover" style="color:white;">
										<i class="fas fa-gem fa-lg"></i> &nbsp; ${likeCntList[i]}개
									</div>
									</a>
								</div>
								<input type="hidden" name = "path${i + 1}" value="${listsVO[i].getCertificatedPath()}">
								<input type="hidden" name = "id${i + 1}" value="${listsVO[i].getMemberId()}">
								<input type="hidden" name = "content${i + 1}" value="${listsVO[i].getCertificatedContent()}">
								<input type="hidden" name = "title${i + 1}" value="${listsVO[i].getCertificatedTitle()}">
						</c:forEach>
					</div>
					</form>
				</section>
			<div>
				<c:import url="/app/footer/footer.jsp"/>
			</div>
			</div>
		</div>

		<!-- Sidebar -->
		<c:import url="/app/footer/sidebar.jsp" />
	</div>

	<!-- Scripts -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	<script>
		function bestDetail(num) {
			var width = '1100';
		    var height = '530';
		    var left = Math.ceil(( window.screen.width - width )/2);
		    var top = Math.ceil(( window.screen.height - height )/2); 
		    window.open('${pageContext.request.contextPath}/board/bestBoardDetail.bo', 'bestDetail', 'width='+ width +', height='+ height +', left=' + left + ', top='+ top ); 
		    detailForm.action = "${pageContext.request.contextPath}/board/bestBoardDetail.bo?num=" + num;
		    detailForm.target = 'bestDetail';
		    detailForm.submit(); 
		}
	</script>

</body>
</html>