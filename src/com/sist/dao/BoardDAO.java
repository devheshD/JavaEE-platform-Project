package com.sist.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.BoardVO;
import com.sist.vo.ReplyVO;

public class BoardDAO {
	
	private static SqlSessionFactory ssf;
	static {
		try{
		ssf = CreateSqlSessionFactory.getSsf();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
	}
	
	// 전체 목록 출력
	public static List<BoardVO> boardListData(Map map) {
		List<BoardVO> list = new ArrayList<BoardVO>();
		SqlSession session = null;

		try {
			session = ssf.openSession();
			list = session.selectList("boardListData", map);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) session.close();
		}
		return list;
	}
	
	// 총 페이지
	public static int boardListCount() {
		int count = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			count = session.selectOne("boardCount");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) session.close();
		}
		return count;
	}
	
	// 글 추가
	public static void boardInsert(BoardVO vo) {		
		SqlSession session = null;
		
		try {
			session = ssf.openSession(true);
			session.insert("boardInsert", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) session.close();
		}
		
	}
	
	// 상세보기
	public static BoardVO boardDetail(int no) {
		BoardVO vo = new BoardVO();
		SqlSession session = null;
		try {
			// 조회수 증가
			session = ssf.openSession();
			session.update("hitIncrement", no);
			session.commit();
			
			vo = session.selectOne("boardDetail", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) session.close();
		}
		
		return vo;
	}
	
	// 게시글 수정
	public static void boardUpdate(BoardVO vo) {
		SqlSession session = null;
		
		try {
			session = ssf.openSession(true);
			session.update("boardUpdate", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) session.close();
		}
		
	}
	
	// 게시글 수정 데이터
	public static BoardVO boardUpdateData(int no) {
		BoardVO vo = new BoardVO();
		SqlSession session = null;
		
		try {
			session = ssf.openSession();
			vo = session.selectOne("boardDetail", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) session.close();
		}
		
		return vo;
		
	}
	
	// 게시글 삭제
	public static void boardDelete(int no) {
		SqlSession session = null;
		
		try {
			session = ssf.openSession();
			session.delete("boardChildReplyDelete", no);
			session.delete("boardDelete", no);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) session.close();
		}
	}
	
	// 댓글 읽기
	public static List<ReplyVO> replyListData(int bno) {
		List<ReplyVO> list = new ArrayList<ReplyVO>();
		SqlSession session = null;
		
		try {
			session = ssf.openSession();
			list = session.selectList("replyListData", bno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) session.close();
		}
		
		return list;
	}
	
	// 댓글 추가
	public static void replyInsert(ReplyVO vo) {
		SqlSession session = null;
		
		try {
			session = ssf.openSession();
			session.insert("replyInsert", vo);
			session.update("replyCount", vo.getBno());
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) session.close();
		}
	}
	
	// 댓글 수정
	public static void replyUpdate(ReplyVO vo) {
		SqlSession session = null;
		
		try {
			session = ssf.openSession(true);
			session.update("replyUpdate", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) session.close();
		}
	}
	
	// 댓글 삭제
	public static void replyDelete(int no, int bno) {
		SqlSession session = null;
		
		try {
			session = ssf.openSession();
			session.delete("replyDelete", no);
			session.update("replyDecrement", bno);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) session.close();
		}
	}
	
	// 찾기 
	public static List<BoardVO> boardFindData(Map map) {
		List<BoardVO> list = new ArrayList<BoardVO>();
		SqlSession session = null;
		
		try {
			session = ssf.openSession();
			list = session.selectList("boardFindData", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) session.close();
		}
		
		return list;
	}
	
	// 검색 결과
	public static int boardFindCount(Map map) {
		int count = 0;
		SqlSession session = null;
		
		try {
			session = ssf.openSession();
			count = session.selectOne("boardFindCount", map);
		} catch (Exception e) {
			if (session != null) session.close();
		}
		
		return count;
				
	}
	

	
	
}
