var certificatedNum = 3;

var check = true;

	function getList(){
				$.ajax({
					url : contextPath + "/board/ceritificatedBoardAjax.bo?certificatedNum=" + certificatedNum,
					//data: {'certificatedNum': certificatedNum},
					type : "get",
					dataType : "json",
					success : showList
				});
			}
		var num = 1;
 		function showList(pages){			
 			var text = "";
 			if(pages != null && pages.length != 0){
 				$.each(pages, function(index, page){	
 					//JSON.parse(page)
 					text += '<div class="certificated_box" style="height: auto; margin-top: 20px; border-bottom: none;">' ;
 					text += '<!-- 작성자 -->' +
 					          '<div style="display : flex; justify-content: center; height: auto;">' +
 					          '<div style="width:10%;">' +
 					          '<img id="" name="" class="profile" src="' + contextPath + '/images/logo_blue.png" alt=""' + 
 					          'style="margin:5px; width: 35px; height: 35px;cursor: pointer;" onclick="#"/> <!-- 프로필 사진 클릭시 해당 계정으로 이동 -->' +
 					          '</div><div id="" style="width:10%; padding-top: 10px; margin-left: 5px;">' + page.memberId + '</div>' +
 					          '<div class="icon_color" style="display: flex; justify-content: flex-end; width:80%; padding-top: 10px; padding-right: 10px;">';
 					  			if(sessionId == page.memberId){
 					  				text += '<div id="menuHover"><i class="fas fa-ellipsis-h" onclick="#" style="cursor: pointer;"></i>' +  				
 					  				'<ul id="sub-menu" style="display: flex;flex-direction: column;">' +
 					  				'<li><a href="javascript:modifyPopup(' + page.certificatedNum +', '+ page.certificatedTitle + ',' + page.certificatedContent + ',' + 
 					  					page.certificatedPath + ')" type="button">수정</a></li>' +
 					  				'<li><a href="' + contextPath + '/board/certificateDeleteOk.bo?certificatedNum=' + page.certificatedNum + '" type="button">삭제</a></li></ul></div> '; 				
 					  			}
 					             
 					 text +=   '</div></div>   <!-- 게시판 제목 -->' +                     
 					           '<div style="height: 30px; padding-top: 5px; margin:5px;"><h4>' + page.certificatedTitle + '</h4></div>';
 	                     	
 					 
 					 
 	                     	getReplyList(page.certificatedNum);
 				});
 			}
 			//새로운 요소 만들어서 값넣고 끝에 추가하기
 			var newDIV = document.createElement("div");
 			newDIV.innerHTML = text;
 			document.getElementById("listAJAX").appendChild(newDIV); 
 			check = true;
 			certificatedNum = certificatedNum +2;			
 		} 
 		
 		$(window).scroll(function(){
 			var div = document.getElementById('scrollDiv');
 			var winH = window.innerHeight;
 			var postFromBottom = div.getBoundingClientRect().bottom;
 			if(winH > postFromBottom){
 				if(check){
 					check = false;
 					setTimeout(function(){
 						getList();
 					},500);
 				}
 			}
 		});
 		
 		
		var diamondCheck = false; 
 		
 		function changeDiamond(num) {
 			var diamond = $("#diamond_" + num);
 			var checkedDiamond = $("#checkedDiamond_" + num);
 			var likeMarkDiamond = $("img#likeMark");
 			
			diamond.css('display', 'none');
			checkedDiamond.css('display','');
			diamondCheck = true;
			likeMarkDiamond.fadeIn(500);
			likeMarkDiamond.fadeOut(500);
			/*var id = sessionStorage.getItem("session_id");*/
			var id = sessionId;			
			$.ajax({
				url: contextPath + "/board/ceritificatedBoardLikeOk.bo?memberId="+ id +"&certificatedNum=" + num + "&likeCheck=1" ,
				type : "get",
				dataType : "text",
				success : function(result){
					$("#diamond_num_" + num ).text(result.trim());
				}	
			});
		}
		
		function unchangeDiamond(num){
			var diamond = $("#diamond_" + num);
 			var checkedDiamond = $("#checkedDiamond_" + num);
			var likeMarkDiamond = $("img#likeMark");
			
			diamond.css('display','');
			checkedDiamond.css('display', 'none');
			diamondCheck = false;
			var id = sessionId;
			$.ajax({
				url: contextPath + "/board/ceritificatedBoardLikeOk.bo?memberId="+ id +"&certificatedNum=" + num + "&likeCheck=0",
				type : "get",
				dataType : "text",
				success : function(result){
					$("#diamond_num_" + num).text(result.trim());
				}		
			});
			
		}
 		
 		