package com.davi.app.board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.davi.app.board.vo.BoardCheatVO;
import com.davi.mybatis.config.SqlMapConfig;

public class BoardCheatDAO {

	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession session;
	
	public BoardCheatDAO() {
		session = sessionf.openSession(true);		
	}
	
	// 자유게시판 글쓰기
	public boolean boardCheatWrite(BoardCheatVO bvo) {		
		return session.insert("CheatBoard.cheatWrite", bvo) == 1;
	}
	
	//자유게시판 목록 검색 헤드
	public List<BoardCheatVO> getBoardListSearchHead(int startRow, int endRow, String cheatHead){
		HashMap<String, String> page = new HashMap<>();
		page.put("startRow", String.valueOf(startRow));
		page.put("endRow", String.valueOf(endRow));
		page.put("cheatHead", cheatHead);
		
		return session.selectList("CheatBoard.listSearchHead", page);
	}
	//자유게시판 목록 검색 타이틀
	public List<BoardCheatVO> getBoardListSearchTitle(int startRow, int endRow, String freeTitle){
		HashMap<String, String> page = new HashMap<>();
		page.put("startRow", String.valueOf(startRow));
		page.put("endRow", String.valueOf(endRow));
		page.put("freeTitle", freeTitle);
		
		return session.selectList("CheatBoard.listSearchTitle", page);
	}
	//자유게시판 목록 검색 아이디
	public List<BoardCheatVO> getBoardListSearchId(int startRow, int endRow, String memberId){
		HashMap<String, String> page = new HashMap<>();
		page.put("startRow", String.valueOf(startRow));
		page.put("endRow", String.valueOf(endRow));
		page.put("memberId", memberId);
		
		return session.selectList("CheatBoard.listSearchId", page);
	}
	
	// 자유게시판 목록 개수 
	public int getBoardCnt() {
		return session.selectOne("CheatBoard.getBoardCnt");
	}
	
	//게시글 가져오기
	public BoardCheatVO getDetail(int cheatNum) {
		return session.selectOne("CheatBoard.getDetail", cheatNum);
	}
	
	//게시글 삭제하기
		public boolean deleteCheat(int cheatNum) {
			return session.delete("CheatBoard.deleteFree",cheatNum)==1;
		}
		
	//게시글 업데이트
	public boolean updateCheat(BoardCheatVO bvo) {
		return session.update("CheatBoard.updateFree",bvo)==1;
	}
}
