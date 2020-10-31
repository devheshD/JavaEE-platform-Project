package com.sist.model;

import java.util.*;
import com.sist.vo.*;
import com.sist.dao.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;

public class BoardModel {

	@RequestMapping("board/board.do")
	public String boardList(HttpServletRequest request) {
		String page = request.getParameter("page");
		if (page == null)
			page = "1";
		int curPage = Integer.parseInt(page);
		Map map = new HashMap();
		int rowSize = 10;
		int start = (curPage * rowSize) - (rowSize - 1);
		int end = curPage * rowSize;
		map.put("start", start);
		map.put("end", end);
		List<BoardVO> list = BoardDAO.boardListData(map);
		int totalPage = BoardDAO.boardListCount();
		
		final int BLOCK = 5;
		int startPage = ((curPage - 1) / BLOCK * BLOCK) + 1;
		int endPage   = ((curPage - 1) / BLOCK * BLOCK) + BLOCK;
		int allPage   = totalPage;
		
		if (endPage > allPage)
			endPage = allPage;
		
		request.setAttribute("curPage", curPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("list", list);
		
		request.setAttribute("BLOCK", BLOCK);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("allPage", allPage);
		
		return "board.jsp";
	}
	
	@RequestMapping("board/insert_ok.do")
	public String boardInsert(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		
		String name    = request.getParameter("name");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String pwd     = request.getParameter("pwd");
		
		BoardVO vo = new BoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		BoardDAO.boardInsert(vo);
		
		return "redirect:../board/board.do";
	}
	
	@RequestMapping("board/detail.do")
	public String boardDetail(HttpServletRequest request) {
		String no = request.getParameter("no");
		BoardVO vo = BoardDAO.boardDetail(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		
		List<ReplyVO> list = BoardDAO.replyListData(Integer.parseInt(no));
		request.setAttribute("list", list);
	
		return "detail.jsp";
	}
	
	@RequestMapping("board/update.do")
	public String boardUpdate(HttpServletRequest request) {
		String no = request.getParameter("no");
		BoardVO vo = BoardDAO.boardUpdateData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		
		return "update.jsp";
	}
	
	@RequestMapping("board/update_ok.do")
	public String board_update_ok(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		
		String no = request.getParameter("no");
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String pwd = request.getParameter("pwd");
	 
	    BoardVO vo = new BoardVO();
	    vo.setNo(Integer.parseInt(no));
	    vo.setName(name);
	    vo.setSubject(subject);
	    vo.setContent(content);
	  
	    BoardDAO.boardUpdate(vo);
	
		return "redirect:detail.do?no=" + no;
	}
	
	@RequestMapping("board/reply_insert.do")
	public String reply_insert(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		String bno = request.getParameter("bno");
		String msg = request.getParameter("msg");
		
		// session
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String name = (String) session.getAttribute("name");
		
		ReplyVO vo = new ReplyVO();
		vo.setBno(Integer.parseInt(bno));
		vo.setId(id);
		vo.setName(name);
		vo.setMsg(msg);
		BoardDAO.replyInsert(vo);
		
		return "redirect:detail.do?no=" + bno;
		
	}
	
	@RequestMapping("board/reply_update.do")
	public String reply_update(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		String bno = request.getParameter("bno");
		String msg = request.getParameter("msg");
		String no  = request.getParameter("no");
		
		ReplyVO vo = new ReplyVO();
		vo.setNo(Integer.parseInt(no));
		vo.setMsg(msg);
		BoardDAO.replyUpdate(vo);
		
		return "redirect:detail.do?no=" + bno;
		
	}
	
	@RequestMapping("board/reply_delete.do")
	public String reply_delete(HttpServletRequest request) {
		String no  = request.getParameter("no");
		String bno = request.getParameter("bno");
		
		BoardDAO.replyDelete(Integer.parseInt(no), Integer.parseInt(bno));
		
		return "redirect:detail.do?no=" + bno;
	}
	
	@RequestMapping("board/board_delete.do")
	public String board_delete(HttpServletRequest request) {
		String no = request.getParameter("no");
		
		BoardDAO.boardDelete(Integer.parseInt(no));
		
		return "redirect:board.do";
	}
	
	@RequestMapping("board/board_find.do")
	public String board_find(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		String fs = request.getParameter("fs");
		String ss = request.getParameter("ss");
		
		HashMap map = new HashMap();
		map.put("fs", fs);
		map.put("ss", ss);
	
		int count = BoardDAO.boardFindCount(map);
		
		if (count != 0) {
			List<BoardVO> list = BoardDAO.boardFindData(map);
			request.setAttribute("list", list);
		}
		
		request.setAttribute("count", count);
		
		return "board_find.jsp";
	}
	
}
