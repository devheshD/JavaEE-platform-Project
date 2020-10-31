package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sist.vo.*;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;

import java.util.*;

public class NewsModel {

	@RequestMapping("news/news.do")
	public String reservationModel(HttpServletRequest request) {
		String strPage = request.getParameter("page");
		if (strPage == null)
			strPage = "1";
		int curpage = Integer.parseInt(strPage);
		int rowSize = 9;
		int start = (curpage * rowSize) - (rowSize - 1);
		int end = (curpage * rowSize);
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<NewsVO> list = NewsDAO.newsListData(map);
		int totalpage = NewsDAO.newsTotalPage();

		final int BLOCK = 5;
		int allPage = totalpage;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		/*
		 * curpage : 1~5 ==> BLOCK 1 (6-1)/5*5 => 5+1 => 6
		 * 
		 * 현재 페이지 ==> 1~5 : 1 ==> 6~10 : 6 ==> 11~15 : 11
		 */
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
		if (endPage > allPage)
			endPage = allPage;

		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("allPage", allPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("BLOCK", BLOCK);
		request.setAttribute("endPage", endPage);
		request.setAttribute("list", list);

		return "../news/news.jsp";

	}

	@RequestMapping("news/newsDetail.do")
	public String news_detail_Model(HttpServletRequest request) {
		String news_no = request.getParameter("news_no");
		NewsVO vo = NewsDAO.newsDetailData(Integer.parseInt(news_no));
		List<News_replyVO> list=NewsDAO.newsReplyList(Integer.parseInt(news_no));
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		request.setAttribute("id", id);
		request.setAttribute("list", list);
		request.setAttribute("nvo", vo);
		return "newsDetail.jsp";
	}
	
	
	@RequestMapping("news/news_replyInsert.do")
	public String news_reply_Model(HttpServletRequest request)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex) {}
		
		String news_no=request.getParameter("news_no");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String pwd=(String)session.getAttribute("pwd");
		String content=request.getParameter("content");

		News_replyVO vo=new News_replyVO();
		
		vo.setId(id);
		vo.setNews_no(Integer.parseInt(news_no));
		vo.setPwd(pwd); 	
		vo.setContent(content);	
		
		NewsDAO.newsReplyInsert(vo);
		return "redirect:newsDetail.do?news_no="+news_no;
	}

	@RequestMapping("news/news_reply_update.do")
	public String news_update_Model(HttpServletRequest request)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception e) {}
		String news_no=request.getParameter("news_no");
		String content=request.getParameter("content");
		String no=request.getParameter("no");
		

		News_replyVO vo=new News_replyVO();
		
		vo.setNews_no(Integer.parseInt(news_no));
		vo.setContent(content);
		vo.setNo(no);
		
		NewsDAO.newsReplyUpdate(vo);
		return "redirect:newsDetail.do?news_no="+news_no;
	}
	
	@RequestMapping("news/news_reply_delete.do")
	public String news_delete_Model(HttpServletRequest request)
	{
		String news_no=request.getParameter("news_no");
		String no=request.getParameter("no");
		
		NewsDAO.newsReplyDelete(Integer.parseInt(no));
		return "redirect:newsDetail.do?news_no="+news_no;
	}
}
