package com.davi.app.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.davi.action.Action;
import com.davi.action.ActionForward;
import com.davi.app.member.dao.MemberDAO;
import com.davi.app.member.vo.DaviMemberVO;

public class MemberJoinOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
req.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		
		DaviMemberVO mvo = new DaviMemberVO();
		MemberDAO mdao = new MemberDAO();
		
		
		
		mvo.setMemberId(req.getParameter("memberId"));
		mvo.setMemberPw(req.getParameter("memberPw"));
		mvo.setMemberName(req.getParameter("memberName"));
		mvo.setMemberPhone(req.getParameter("memberPhone"));
		mvo.setMemberEmail(req.getParameter("memberEmail"));
		mvo.setMemberGender(req.getParameter("memberGender"));
		
		int memberHeight = 0;
		int memberWeight = 0;
		int memberGoalWeight = 0;
		
		try {
			memberHeight = Integer.parseInt(req.getParameter("memberHeight"));
			memberWeight = Integer.parseInt(req.getParameter("memberWeight"));
			memberGoalWeight = Integer.parseInt(req.getParameter("memberGoalWeight"));
		} catch (NumberFormatException e) {			
		}
		
		mvo.setMemberHeight(memberHeight);
		mvo.setMemberWeight(memberWeight);
		mvo.setMemberGoalWeight(memberGoalWeight);
		mvo.setMemberResolution(req.getParameter("memberResolution"));		
		
		if(mdao.join(mvo)) {
			
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/member/joinOk.me?result=true");
			
		}else {	
			
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/member/joinOk.me?result=false");
			
		}		
		return forward;	
	}
	
}
