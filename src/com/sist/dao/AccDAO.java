package com.sist.dao;


import java.util.*;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;


public class AccDAO {
	private static SqlSessionFactory ssf;
	static
	{
		ssf=CreateSqlSessionFactory.getSsf();
		
	}
	
	public static AccVO accDetailData(String product_id)
	{
		AccVO list =new AccVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectOne("accDetailData",product_id);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		finally {
			if(session!=null)
			session.close();
		}
		return list;
	}
	public static Acc_jjimVO accDetailData2(String product_id)
	{
		Acc_jjimVO list =new Acc_jjimVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectOne("accDetailData2",product_id);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		finally {
			if(session!=null)
			session.close();
		}
		return list;
	}
	   public static List<AccVO> accListData(Map map)
	   {
		   List<AccVO> list=new ArrayList<AccVO>();
		   // ���� => SqlSession (Connection,PreparedStatement)
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();//connection����
			   list=session.selectList("accListData",map);
			   
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();//Erroró�� 
			   /*session.rollback();*/
		   }
		   finally
		   {
			   // ��ȯ => DBCP ==> �ݵ�� ����Ŀ� ��ȯ 
			   if(session!=null)
				   session.close();
		   }
		   return list;
	   }
	   
	   public static int accTotalPage(Map map)
	   {
		   int list=0;
		   // ���� => SqlSession (Connection,PreparedStatement)
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();//connection����
			   list=session.selectOne("accTotalPage",map);
			   
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();//Erroró�� 
			   /*session.rollback();*/
		   }
		   finally
		   {
			   // ��ȯ => DBCP ==> �ݵ�� ����Ŀ� ��ȯ 
			   if(session!=null)
				   session.close();
		   }
		   return list;
	   }
	   public static List<AccVO> accCate(String name)
		{
			List<AccVO> list =new ArrayList<AccVO>();
			//���� =>SqlSession (Connection ,PreparedStatement)
			SqlSession session=null;
			try {
				session=ssf.openSession();
				list=session.selectList("accCate",name);

				
			} catch (Exception ex) {
				ex.printStackTrace();
				
			}
			finally {
				if(session!=null)
					session.close();
			}
			return list;
		}
	   public static List<AccVO> accSearchData(String keyword)
		{
			List<AccVO> list=new ArrayList<AccVO>();
			SqlSession session=null;
			try
			{
				session=ssf.openSession();
				list=session.selectList("accSearchData",keyword);
			}
			catch(Exception ex)
			{
				ex.printStackTrace(); 
			}
			finally
			{
				if(session!=null)
	    			session.close();
			}
			return list;
		}
	   

		// �� ����
		public static void accInsert(Acc_cartVO vo) {
			SqlSession session = null;
			try {
				// session����
				session = ssf.openSession(true);
				session.insert("accInsert", vo);

			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				if (session != null)
					session.close();
			}
		}


		// Ȯ��
		public static int accOkCount(Acc_cartVO vo) {
			int count = 0;
			SqlSession session = null;
			try {
				// session����
				session = ssf.openSession();
				count=session.selectOne("accOkCount", vo);

			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				if (session != null)
					session.close();
			}

			return count;

		}
		//��� ���
		public static List<Acc_jjimVO> accGetData(String id)
		{
			List<Acc_jjimVO> list=new ArrayList<Acc_jjimVO>();
			SqlSession session=null;
			
			try {
				session=ssf.openSession();
				list=session.selectList("accGetData",id);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			finally {
				if (session != null)
					session.close();
				
			}
			return list;
			
		}
		
		
		 public static void acc_buy(Acc_payVO vo)
		   {
			   SqlSession session=null;
			   try
			   {
				   session=ssf.openSession(true);//commit
				   session.insert("acc_buy",vo);
				   
			   }catch(Exception ex)
			   {
				   ex.printStackTrace();
			   }
			   finally
			   {
				   if(session!=null)
					   session.close();
			   }
		   }
		

}
