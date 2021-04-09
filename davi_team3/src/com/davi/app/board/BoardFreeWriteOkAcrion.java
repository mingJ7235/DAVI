package com.davi.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.davi.action.Action;
import com.davi.action.ActionForward;
import com.davi.app.board.dao.BoardDAO;
import com.davi.app.board.vo.BoardFreeVO;

public class BoardFreeWriteOkAcrion implements Action{
 
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		req.setCharacterEncoding("UTF-8");
		
		BoardFreeVO bvo = new BoardFreeVO();
		BoardDAO bdao = new BoardDAO();
		
		ActionForward forward = null;	
		
		
		bvo.setFreeHead(req.getParameter("freeHead"));
		bvo.setMemberId(req.getParameter("memberId"));
		bvo.setFreeTitle(req.getParameter("freeTitle"));
		bvo.setFreeContent(req.getParameter("freeContent"));
		
		if(bdao.boardFreeWrite(bvo)) {
			//등록성공
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/board/freeList.bo");
		}		
		
		return forward;		
	}
}
