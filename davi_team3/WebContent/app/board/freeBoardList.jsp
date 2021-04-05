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
		<title>자유게시판</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/app/board/css/board.css" />
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" 
		integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">			
	</head>
	
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<c:import url="/app/header/header.jsp" />
								<style>	
								table {
									margin: 0 auto 1em auto;
									width: 60%;		
									align-items: center;															
								}
															
								table tbody tr:hover{
									background-color: rgba(230, 235, 237, 0.25);									
								}
								
								a.aboard {	
									/* color: #3d4449; */	
									color: #7f888f;	
									border-bottom: none;		
									text-decoration: none;									
								}
								
								td a{
									cursor: default;
								}
								
								@media screen and (max-width: 620px) {
									.th1{
										width:20%;
									}
									.th2{
										width:60%;
									}
									.th3{
										width:20%;
									}
									
									table{
										width: 100%;
									}			
								}	
								
								</style>

							<!-- Content -->
																
								
								<section>
									<h2 align="center">자유 게시판</h2>										
									<div class="table-wrapper">
										<table id="boardList">
											<thead>
												<tr>
													<th class="th1" width="15%">분류</th>
													<th class="th2" width="70%">제목</th>
													<th class="th3 secret" width="15%">닉네임</th>
												</tr>
											</thead>
											<tbody>
												
												<tr>
													<td>강원/경기</td>													
													<td id="title"><a href="${pageContext.request.contextPath}/index.jsp" class="aboard">아무데나 클릭하면 메인으로</a></td>													
													<td>우리다라</td>													
												</tr>
																								
												<tr>
													<td>서울</td>													
													<td id="title"><a href="#" class="aboard">두번째 제목</a></td>													
													<td>홍길동</td>													
												</tr>																							
											<tfoot>
												<tr>
													<td colspan="2"></td>
													<td><a href="#" style="cursor: pointer;"><i class="fas fa-edit"></i></a></td>
												</tr>
											</tfoot>											
										</table>
										<div align="center">
											<ul class="pagination">
												<li><a href="#" class="aboard">Prev</a></li>
												<c:set var="num" value="5"/>
												<c:forEach var="i" begin="0" end="${num-1}">
													<li onclick="clicked(${i}, ${num})"><a href="#" class="page" id="inners${i}">${i+1}</a></li>											
												</c:forEach>
												<li><a href="#" class="aboard">Next</a></li>
											</ul>
										</div>
										<div style="width:40%; margin: 0 auto;">
											<form method="get" action="#" name="searchListForm">										
												<div style="display:flex;">
													<select name="" id="" style="margin-right:5px; width:30%">
														<option value="">분류1</option>
														<option value="">분류2</option>
														<option value="">분류3</option>
													</select>															
													<input type="text" name="" placeholder="" style="margin-right:5px;width:60%" />
													<input type="submit" value="검색" class="primary" />													
												</div>											
											</form>
										</div>
									</div>
					
								</section>
								<div>
									<c:import url="/app/footer/footer_test.jsp" />
								</div>
						</div>
					</div>

				<!-- Sidebar -->
					<c:import url="/app/footer/footer.jsp" />

			</div>

		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
			<script>
				function clicked(index, len) {					
					console.log(len);
					for(let i=0;i<len;i++){
						if(i == index){					
							document.getElementById("inners" + i).className = "page active";
						}else{
							document.getElementById("inners" + i).className = "page";
						}
					}					
				}
				$('table tbody tr').on('click', function() {
				    location.href = $(this).children('#title').children('a').attr('href');
				    return false;
				});
				const x = window.matchMedia("(max-width: 620px)");
				if(x.matches){
					console.log("컬럼삭제");
					deleteColumn();
				}
				
				
				function deleteColumn() {
					  const table = document.getElementById('boardList');
					  
					  for(let i = 0; i < table.rows.length; i++)  {
					    table.rows[i].deleteCell(-1);
					  }
				}
			</script>

	</body>
</html>