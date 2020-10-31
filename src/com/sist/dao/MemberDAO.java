package com.sist.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.MemberVO;
import com.sist.vo.ZipcodeVO;

public class MemberDAO {
   private static SqlSessionFactory ssf;
   static
   {
	   try
	   {
		   ssf=CreateSqlSessionFactory.getSsf();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
   }
   
   
   // DAO ==> Model 
   public static MemberVO memberLogin(String id,String pwd)
   {
	   MemberVO vo=new MemberVO();
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession();
		   int count=session.selectOne("memberIdCount", id);
		   if(count==0)//ID�� ���� ����
		   {
			   vo.setMsg("NOID");
		   }
		   else //ID�� �����ϴ� ���� 
		   {
			   //��й�ȣ �˻� 
			   vo=session.selectOne("memberGetPwd", id);
			   if(pwd.equals(vo.getPwd()))
			   {
				   vo.setMsg("OK");
			   }
			   else
			   {
				   vo.setMsg("NOPWD");
			   }
		   }
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   if(session!=null)
			   session.close();
	   }
	   return vo;
   }
     
   
// �����ȣ �˻� 
   public static List<ZipcodeVO> postFind(String dong)
   {
	   List<ZipcodeVO> list=new ArrayList<ZipcodeVO>();
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession(); // autoCommit(false)
		   System.out.println("dong:"+dong);
		   list=session.selectList("postFind",dong);
	   }catch(Exception ex)
	   {
		   // erroró�� 
		   ex.printStackTrace();
	   }
	   finally
	   {
		   // session : Connection,PreparedStatement 
		   // DBCP => �ݵ�� ��ȯ�Ѵ� => session.close()
		   if(session!=null)
			   session.close();
	   }
	   return list;
   }
   
   // idcheck
   public static int idcheck(String id)
   {
	   int count=0;
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession();
		   count=session.selectOne("idcheck", id);
		   /*
		    *  selectOne
		    *  selectList ==> �ڵ� ����ȯ 
		    */
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   if(session!=null)
			   session.close(); //DBCP ��ȯ => ���� 
	   }
	   return count;
   }
   
   //  ȸ�� ����
 
   public static void memberInsert(MemberVO vo)
   {
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession(true);//commit
		   session.insert("memberInsert",vo);
		   
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
   
 
   // ȸ�� ���� ������ �б�
   public static MemberVO memberJoinUpdateData(String id)
   {
	   MemberVO vo=new MemberVO();
	   SqlSession session=null;
	   try
	   {
		   // session��� (Connection,PreparedStatement)
		   session=ssf.openSession();
		   vo=session.selectOne("memberJoinUpdateData", id);
	   }catch(Exception ex)
	   {
		   // error
		   ex.printStackTrace();
	   }
	   finally
	   {
		   if(session!=null)
			   session.close();
	   }
	   return vo;
   }
   
   // ���� 
   public static void memberJoinUpdate(MemberVO vo)
   {
	   SqlSession session=null;
	   try
	   {
		   // session���
		   session=ssf.openSession(true);//commit
		   // INSERT,UPDATE,DELETE
		   session.update("memberJoinUpdate",vo);
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

