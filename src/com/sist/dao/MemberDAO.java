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
		   if(count==0)//ID가 없는 상태
		   {
			   vo.setMsg("NOID");
		   }
		   else //ID가 존재하는 상태 
		   {
			   //비밀번호 검색 
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
     
   
// 우편번호 검색 
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
		   // error처리 
		   ex.printStackTrace();
	   }
	   finally
	   {
		   // session : Connection,PreparedStatement 
		   // DBCP => 반드시 반환한다 => session.close()
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
		    *  selectList ==> 자동 형변환 
		    */
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   if(session!=null)
			   session.close(); //DBCP 반환 => 재사용 
	   }
	   return count;
   }
   
   //  회원 가입
 
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
   
 
   // 회원 수정 데이터 읽기
   public static MemberVO memberJoinUpdateData(String id)
   {
	   MemberVO vo=new MemberVO();
	   SqlSession session=null;
	   try
	   {
		   // session얻기 (Connection,PreparedStatement)
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
   
   // 수정 
   public static void memberJoinUpdate(MemberVO vo)
   {
	   SqlSession session=null;
	   try
	   {
		   // session얻기
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

