
function replyAnd(num, level) {
	var WID = 15;
	var lv = replyLevelLimit(level);
	$("#replyLevel" + num).addClass("replyLevel-" + (level+1));
	//document.id.style.marginLeft = WID*level + 'px';
}

function replyAnswer(num, level) {	
	var lv = replyLevelLimit(level);
	$("#reReplyLevelName" + num).addClass("replyLevel-" + (lv + 1));	
	$("#reReplyLevelText" + num).addClass("replyLevel-" + (lv + 1));	
	$("#replyAnswer" + num).show(300);
	$("#replyWrite" + num).hide();
	$("#replyWriteHide" + num).show();
}

function replyAnswerHide(num, level) {	
	/*var lv = replyLevelLimit(level);
	$("#reReplyLevelName" + num).addClass("replyLevel-" + (lv + 1));	
	$("#reReplyLevelText" + num).addClass("replyLevel-" + (lv + 1));	*/
	$("#replyAnswer" + num).hide(300);
	$("#replyWrite" + num).show();
	$("#replyWriteHide" + num).hide();
	
}

function replyModify(replyNumber) {	
	$("textarea[name='readReply"+ replyNumber +"']").attr("readonly", false);				
	//$("#readReply123").removeAttr("readonly");				
	$("#readReplyDiv" + replyNumber).hide();
	$("textarea[name='readReply"+ replyNumber +"']").show();
	$("textarea[name='readReply"+ replyNumber +"']").focus();
	$("#replyModify").hide();
	$("#replyDelete").hide();
	$("#replyWrite").hide();
	$("#replyModifyOk").show();		
}

function replyLevelLimit(level) {
	if(level > 1){
		return 1;
	}
	return level;
}

function freeReplySubmit() {	
	if($("#freeReplyContent").val() == "" || $("#freeReplyContent").val() == null){
		
	}else{		
		replyForm.submit();
	}	
}

function cheatReplySubmit() {	
	if($("#cheatReplyContent").val() == "" || $("#cheatReplyContent").val() == null){
		
	}else{		
		
		replyForm.submit();
	}	
}
