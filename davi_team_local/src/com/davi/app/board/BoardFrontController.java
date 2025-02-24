package com.davi.app.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.davi.action.ActionForward;
import com.davi.app.board.cheat.BoardCheatDeleteOkAction;
import com.davi.app.board.cheat.BoardCheatListOkAction;
import com.davi.app.board.cheat.BoardCheatModifyOkAction;
import com.davi.app.board.cheat.BoardCheatViewOkAction;
import com.davi.app.board.cheat.BoardCheatWriteOkAcrion;
import com.davi.app.board.file.SummernoteFileUpload;
import com.davi.app.board.free.BoardFreeDeleteOkAction;
import com.davi.app.board.free.BoardFreeListOkAction;
import com.davi.app.board.free.BoardFreeModifyOkAction;
import com.davi.app.board.free.BoardFreeReplyDeleteOkAction;
import com.davi.app.board.free.BoardFreeReplyUpdateOkAction;
import com.davi.app.board.free.BoardFreeReplyWriteOkAction;
import com.davi.app.board.free.BoardFreeViewOkAction;
import com.davi.app.board.free.BoardFreeWriteOkAcrion;

public class BoardFrontController extends HttpServlet{

	/**
	 * d
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		ActionForward forward = null;
		System.out.println(command);
		
		switch(command) {
		case "/board/freeWriteOk.bo":
			try {
				forward = new BoardFreeWriteOkAcrion().execute(req, resp);
			} catch (Exception e) {				
				e.printStackTrace();
			}			
			break;		
		case "/board/cheatWriteOk.bo":
			try {
				forward = new BoardCheatWriteOkAcrion().execute(req, resp);
			} catch (Exception e) {				
				e.printStackTrace();
			}			
			break;
		case "/board/certificateDeleteOk.bo" :
			try {
				forward = new CertificatedBoardDeleteOkAction().execute(req, resp);
				System.out.println("들어옴 ");
				
			} catch (Exception e) {
				e.printStackTrace();
			}			
			break;
		case "/board/summernoteFile.bo":
			try {				
				forward = new SummernoteFileUpload().fileUpload(req, resp);
			} catch (Exception e) {				
				e.printStackTrace();
			}			
			break;	
		case "/board/certificatePhotoOk.bo" :
			try {
				forward = new CertificatedBoardFileOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/board/certificateWriteOk.bo" :
			try {
				forward = new CertificatedBoardWriteOkAction().execute(req, resp);
				System.out.println("WriteOk 프론트 컨트롤러");
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			break;			
		case "/board/ceritificatedBoard.bo" :
			try {
				forward = new CertificatedBoardViewOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		case "/board/ceritificatedBoardAjax.bo" :
			try {
				forward = new CertificatedBoardViewAjaxOkAction().execute(req, resp);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			break;	
			
		case "/board/ceritificatedBoardLikeOk.bo" :
			try {
				forward = new CertificatedLikeOkAction().execute(req, resp);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			break;	
		case "/board/certificatedBoardReplyList.bo" :
			try {
				forward = new CertificatedBoardReplyListAction().execute(req, resp);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			break;	
		case "/board/certificatedBoardReplyWriteOk.bo" :
			try {
				forward = new CertificatedBoardReplyWriteOkAction().execute(req, resp);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			break;	
			
		case "/board/freeViewOk.bo":
			try {
				forward = new BoardFreeViewOkAction().execute(req, resp);
			} catch (Exception e) {				
				e.printStackTrace();
			}			
			break;	
			
		case "/board/freeList.bo":
			try {
				forward = new BoardFreeListOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("freeList Action 오류");
				e.printStackTrace();
			}
			break;
		
		case "/board/freeDeleteOk.bo":
			try {
				forward = new BoardFreeDeleteOkAction().execute(req, resp);
			} catch (Exception e) {;}
			break;
			
		case "/board/freeModifyOk.bo":
			try {
				forward = new BoardFreeModifyOkAction().execute(req, resp);
			} catch (Exception e) {;}
			break;	
		
		case "/board/cheatViewOk.bo":
			try {
				forward = new BoardCheatViewOkAction().execute(req, resp);
			} catch (Exception e) {;}
			break;	
		
		case "/board/cheatDeleteOk.bo":
			try {
				forward = new BoardCheatDeleteOkAction().execute(req, resp);
			} catch (Exception e) {;}
			break;
			
		case "/board/cheatModifyOk.bo":
			try {
				forward = new BoardCheatModifyOkAction().execute(req, resp);
			} catch (Exception e) {;}
			break;
			
		case "/board/cheatList.bo":
			try {
				forward = new BoardCheatListOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("cheatList Action 오류");
				e.printStackTrace();
			}
			break;	
			
		case "/board/bestList.bo":
			try {
				forward = new CertificatedBestViewAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;	
			
		case "/board/bestBoardDetail.bo":
			try {
				forward = new CertificatedBestPopUpAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;	
		
		case "/board/certificateModifyOk.bo":
			try {
				forward = new CertificatedBoardModifyOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;		
		case "/board/freeReplyWrite.bo":
			try {
				forward = new BoardFreeReplyWriteOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;		
			
		case "/board/freeReplyUpdate.bo":
			try {
				forward = new BoardFreeReplyUpdateOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;		
			
		case "/board/freeReplyDelete.bo":
			try {
				forward = new BoardFreeReplyDeleteOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;		
		default:
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/error/404.jsp");
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {
				resp.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher = req.getRequestDispatcher(forward.getPath());
				dispatcher.forward(req, resp);
			}
		}
	}
	
}