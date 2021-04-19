package com.davi.app.recipe;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.davi.action.Action;
import com.davi.action.ActionForward;
import com.davi.app.member.dao.MemberDAO;

public class WeekMenuAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		MemberDAO m_dao = new MemberDAO();
		List<Map<String, Integer>> list = m_dao.weekMenu();
		ActionForward forward = new ActionForward();
		

		
		if(list.size() != 0) {
			forward.setRedirect(false);
			forward.setPath("/app/dietary/memberMenu.jsp");
			req.setAttribute("menus", list);
		}else {
			forward.setRedirect(true);
			forward.setPath(req.getContextPath()+"/index.jsp");
		}
		
		
		return forward;
	}
}
