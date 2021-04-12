package com.davi.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.davi.action.Action;
import com.davi.action.ActionForward;
import com.davi.app.board.vo.CertificatedBoardVO;

public class CertificatedBoardWriteOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = null;
		
		CertificatedBoardVO c_vo = new CertificatedBoardVO();
		
		c_vo.setMemberId(req.getParameter("memberId"));
		c_vo.setCertificatedTitle(req.getParameter("certificatedTitle"));
		c_vo.setCertificatedContent(req.getParameter("certificatedContent"));
		
		
		
		return null;
	}
}
