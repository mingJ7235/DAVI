<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE HTML>
<!--
	Editorial by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
	<head>
		<title>기본 프레임</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />				
		<link rel="stylesheet" href="${pageContext.request.contextPath}/app/dietary/memberChart.css" />				
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" 
		integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
		<style>
			#data input{
				width:30%;
				font-size:2em;
				margin:auto;
				border:0;
				border-bottom: solid 1px rgba(0, 59, 251, 0.3);
				text-align: center; 
				margin-bottom:1%;
			}
			#notice {
				width:30%;
				margin:auto;
				display:none;
				text-align: center;
				font-size:1em;
				color:red;
			}	
		</style>			
	</head>
	<body class="is-preload">
	<c:set var="rankingList" value="${rankingList}"></c:set>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<c:import url="/app/header/header.jsp" />
					

							<!-- Content -->
							<c:if test="${check == 'true'}">
								<section id="memberChartMain">
								
									<article>
										<h2 align="center" style="margin-bottom:5%; font-size:2.5rem;">${session_id}님의 보고서</h2>
										<div style="width: 80%; margin: auto;text-align: center;">
											<button id="weightDown">
											<i class="fas fa-exclamation-triangle"></i>
											전일 대비 몸무게 확인하기</button>
											
											<button id="weightUp">
											<i class="fas fa-exclamation-triangle"></i>
											전일 대비 몸무게 숨기기&nbsp;&nbsp;&nbsp;</button>
											
											<div id="compareWeight" align="center"  style="width: calc(100%); margin: 0 0 5% 0;" >
												<p>전일대비 몸무게가 <strong style="font-size:2.0rem;">${dailyRate} kg</strong> 달라졌어요 !  <p>							
											</div>
										</div>										
									</article>
									<article>
										<!-- 각오 & 목표 -->
										<!-- border: 1px solid rgba(0, 59, 251, 0.3); -->
									<div class="features" style=" padding: 5% 2%;width: calc(100%);margin: 0 0 3em 0" >
										
										<article class="article">
											<span class="icon solid fa-paper-plane"></span>
											<div class="content">
												<h3>다비의 한마디</h3>
												<p class="report">다이어트 하기로 했으면</p>
												<p class="report">마음만 먹어야지</p>
												<p class="report">자꾸 이것 저것 먹으면 되겠니?</p>
											</div>
										</article>
										<article class="article">
											<span class="icon solid fa-rocket"></span>
											<div class="content">
												<h3>각오 & 목표</h3>
												<p class="report">각오 : <span>날 무시하던 전남친에게 제대로 복수하기!</span></p>
												<p class="report">목표 : <span>20kg 감량!!</span></p>
											</div>
										</article>									
																		
										
									</div>
									</article>
									<article style="padding: 0 2%;">
										<div class="row" style="margin: 0;">
											<div style="width:32%;">
												<h5>그래프</h5>
											</div>
											<div style="width:68%;">
												<h5>나의 프로필</h5>
											</div>
										</div>
										<div class="row chartIcon" style="margin: 0;">											
											<div id="seq1"  style="background-color: white;width:32%;">
												<div id="chart_div3"></div>
											</div>								
											<div class="myProfile" style="margin: 0 2%;">
												<div>
												<i class="fas fa-restroom"></i>
												</div>
												<div>
												<h4>180cm</h4>
												</div>
												<div class="chartDetail">
													키(cm)
												</div>												
											</div>								
											<div class="myProfile">
												<div>
												 <i class="fas fa-weight"></i>
												</div>
												<div>
												<h4>50kg</h4>
												</div>
												<div class="chartDetail">
													몸무게(kg)
												</div>	
											</div>								
											<div class="myProfile" style="margin: 0 2%;">
												<div>
												 <i class="fas fa-signal"></i>
												</div>
												<div>
												<h4>22</h4>
												</div>
												<div class="chartDetail">
													BMI
												</div>	
											</div>								
											<div class="myProfile">
												<div>
												 <i class="fab fa-rocketchat"></i>
												</div>
												<div>
												<h4>150</h4>
												</div>
												<div class="chartDetail">
													출석일수
												</div>	
											</div>
										</div>
									</article>
									
										
									<article>
										<!-- 라인 차트 생성할 영역 -->
								      <div style="padding: 5% 2%;">
									      <div class="row" style="margin-bottom:3%;">
									      	<div class="col-12">
									          <div id="chart_div"></div>
									      	</div>
									      </div>
								          <div class="row">
								          	<div class="col-9"> 
									          	<div id="chart_div2" style="padding-left: 4%"></div>						     
								          	</div>
								          	<div class="col-3"> 
								          		<p class="columChartP" style="padding:1em 0 0 0">18.5미만 : 저체중</p>
								          		<p class="columChartP">18.5이상~23미만: 정상</p>
								          		<p class="columChartP">23이상~25미만 과체중</p>
								          		<p class="columChartP">23이상~30미만 경도비반</p>
								          		<p class="columChartP">30이상 고도비만</p>
								          	</div>
								          </div>
								       </div>									
									</article>
									<article>
									<div style="padding: 0 11%;">
										<table>
										<caption style="text-align:left;"><h3>지난주 다이어트 랭킹</h3></caption>
											<thead>
												<tr>
													<th width="30%">랭킹</th>
													<th width="30%">아이디</th>
													<th width="40%">체중변화량</th>
												</tr>												
											</thead>
											
											<tbody>
											<c:forEach var = "i" begin = "0" end = "4">
												<tr>
													<td>${i+1}</td>
													<td>${rankingList[i].get("MEMBERID") }</td>
													<td>${rankingList[i].get("TOTALRATE")}</td>																								
												</tr>
											</c:forEach>
												
											</tbody>
										</table>
									</div>
									</article>
								

								</section>
							</c:if>	
							
							<!-- 데이터 입력 안했을 시  -->
							<c:if test="${check == 'false'}">
								<section>
									<article id="data">
										<form action="${pageContext.request.contextPath}/member/bodyInsert.me">
											<h2 align="center" style="margin-bottom:5%; font-size:2.5rem;">오늘의 몸무게를 입력해주세요</h2>
											<input type="text" name="bodyWeight" id="weight" placeholder="몸무게 입력후 엔터">
											<p id="notice">세자리 이하의 숫자만 입력해주세요</p>
										</form>
									</article>								
								</section>
							</c:if>	
								
								
							<div>
							<!-- Footer -->
								<c:import url="/app/footer/footer.jsp"/>
							</div>
							
						</div>
					</div>

				<!-- Sidebar -->
					<c:import url="/app/footer/sidebar.jsp" />

			</div>

		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
			<script src="https://www.gstatic.com/charts/loader.js"></script>
			<script src="${pageContext.request.contextPath}/app/dietary/chart.js"></script>
			<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
			
			<script>
		      $(document).ready( function() {
		          $( '#weightDown' ).click( function() {
		            $( '#compareWeight' ).slideDown();
		          } );
		        } );

		      $( document ).ready( function() {
		          $( '#weightUp' ).click( function() {
		            $( '#compareWeight' ).slideUp();
		          } );
		        } );
		      
		      $( document ).ready( function() {
		          $( '#weightUp' ).click( function() {
		            $( '#weightDown' ).fadeToggle(0);
		            $( '#weightUp' ).css('display', 'none');
		          } )
		        } );
		      
		      $( document ).ready( function() {
		          $( '#weightDown' ).click( function() {
		            $( '#weightUp' ).fadeToggle(0);
		            $( '#weightDown' ).css('display', 'none');
		          } )
		        } );
			</script>
			<script>
			$("#weight").keyup(function() {
				
				let regExp = /^[0-9]{1,3}$/;
				
				if(regExp.test($(this).val())){
					$("#notice").hide();
				}else{
					$("#notice").show();
				}
			});
			</script>
			
	</body>
</html>