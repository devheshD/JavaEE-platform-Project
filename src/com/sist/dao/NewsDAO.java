package com.sist.dao;

import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.NewsVO;
import com.sist.vo.News_replyVO;

import java.io.*;

public class NewsDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}

	public static List<NewsVO> newsListData(Map map) {
		List<NewsVO> list = new ArrayList<NewsVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("newsListData", map);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return list;
	}

	public static int newsTotalPage() {
		int list = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectOne("newsTotalPage");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return list;
	}
	
	public static NewsVO newsDetailData(int news_no) 
	{
		NewsVO vo = new NewsVO();
		SqlSession session = null;
		try 
		{
			session = ssf.openSession();
			vo = session.selectOne("newsDetailData", news_no);
		} catch (Exception e) 
		{
			e.printStackTrace();
		} 
		finally 
		{
			if (session != null)
				session.close();
		}

		return vo;
	}
	
	public static NewsVO newsBoardData(int no) 
	{
		NewsVO vo = new NewsVO();
		SqlSession session = null;
		try 
		{
			session = ssf.openSession();
			vo = session.selectOne("newsBoardData", no);
		} catch (Exception e) 
		{
			e.printStackTrace();
		} 
		finally 
		{
			if (session != null)
				session.close();
		}

		return vo;
	}
	
	// ´ñ±ÛÃß°¡
	public static void newsReplyInsert(News_replyVO vo)
	{
		SqlSession session=null;
		try
		{
			session=ssf.openSession(true);
			session.insert("newsReplyInsert", vo);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
	}
	
	// ´ñ±Û ¸ñ·Ï
	public static List<News_replyVO> newsReplyList(int news_no)
	{
		List<News_replyVO> list=new ArrayList<News_replyVO>();
		SqlSession session=null;
		try
		{
			session=ssf.openSession();
			list=session.selectList("newsReplyList", news_no);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		
		return list;
	}
	
	// ´ñ±Û ¼öÁ¤
	public static void newsReplyUpdate(News_replyVO vo)
	{
		SqlSession session=null;
		try
		{
			session=ssf.openSession(true);
			session.update("newsReplyUpdate", vo);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
	}
	
	// ´ñ±Û »èÁ¦
	public static void newsReplyDelete(int no)
	{
		SqlSession session=null;
		try
		{
			session=ssf.openSession(true);
			session.delete("newsReplyDelete", no);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		
	}
}




























