package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;
import com.sist.vo.ZipcodeVO;

public class RegisterModel {

	 @RequestMapping("register/register.do")
	  public String member_join(HttpServletRequest request)
	  {
		  return "../register/register.jsp";// main.jsp=> include
	  }
	 
	 
	  // 우편번호 검색 
	  @RequestMapping("register/postfind.do")
	  public String post_find(HttpServletRequest request)
	  {
		  return "../register/postfind.jsp";
	  }
	  
	  
	  @RequestMapping("register/post_result.do")
	  public String post_result(HttpServletRequest request)
	  {
		  // 사용자가 입력한 dong을 받는다 
		  try
		  {
			  // 한글 변환 
			  request.setCharacterEncoding("UTF-8");
			  // 컴파일 예외처리 => 반드시 컴파일전에 예외처리를 한다 
		  }catch(Exception ex){}
		  
		  String dong=request.getParameter("dong");
		  System.out.println(dong);
		  List<ZipcodeVO> list=MemberDAO.postFind(dong);
		  // list=>postfind.jsp로 전송 
		  request.setAttribute("list", list);
		  // 검색결과 
		  request.setAttribute("count", list.size());
		  return "../register/post_result.jsp";// 새로운 창을 보여줄때
		  // 1. shadow , window.open... => ajax
	  }
	  
	  @RequestMapping("register/idcheck.do")
	  public String id_check(HttpServletRequest request)
	  {
		  return "../register/idcheck.jsp";
	  }
	  
	  @RequestMapping("register/idcheck_result.do")
	  public String idcheck_result(HttpServletRequest request)
	  {
		  String id=request.getParameter("id");
		  //DAO연결 
		  int count=MemberDAO.idcheck(id);
		  request.setAttribute("count", count);
		  return "../register/idcheck_result.jsp";
	  }
	  
	  @RequestMapping("register/register_ok.do")
	  public String member_join_ok(HttpServletRequest request)
	  {
		// 요청값 받기 
		  try
		  {
			  //한글 변환
			  request.setCharacterEncoding("UTF-8");
			  
			  String id=request.getParameter("id");
			  String pwd=request.getParameter("pwd");
			  String name=request.getParameter("name");
			  String post=request.getParameter("post");
			  String addr=request.getParameter("addr");
			  String detail_addr=request.getParameter("detail_addr");
			 
			  String birthday=request.getParameter("birth");
			  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			  Date birth = sdf.parse(birthday);
			  
			  String sex=request.getParameter("sex");
			
			  String tel1=request.getParameter("tel1");
			  String tel2=request.getParameter("tel2");
			  String tel="010-"+tel1+"-"+tel2;
			  
			  String email1=request.getParameter("email1");
	          String email2=request.getParameter("selbox");
	          
	          if(email2.contains("direct")){
	        	  email2=request.getParameter("selboxDirect");
	          }else{
	        	  email2=request.getParameter("selbox");
	          }
	          String email=email1+"@"+email2;
	          
			  String min=request.getParameter("min");
			  String max=request.getParameter("max");
			  String budget=min+"~"+max;
			  
			  MemberVO vo=new MemberVO();

			  vo.setId(id);
			  vo.setPwd(pwd);
			  vo.setName(name);
			  vo.setAddr(addr);
			  vo.setBirth(birth);
			  vo.setSex(sex);
			  vo.setTel(tel);
			  vo.setEmail(email);
			  vo.setBudget(budget);
			  vo.setPost(post);
			  vo.setDetail_addr(detail_addr);
			  
			
			  //DAO연결 
			  MemberDAO.memberInsert(vo);
			  
		  }catch(Exception ex){}

		  return "redirect:../main/main.do";
	  }
	  
	  // join_update.do => MemberModel (메소드 수행) <=> MemberDAO
	  //                     => 수행 결과를 JSP로 전송 (request.setAttribute())
	  // 회원수정 
	  @RequestMapping("register/registerModification.do")
	  public String member_join_update(HttpServletRequest request)
	  {
		  HttpSession session=request.getSession();
		  String id=(String)session.getAttribute("id");
		  // DAO
		  MemberVO vo=MemberDAO.memberJoinUpdateData(id);
		  request.setAttribute("vo", vo);//join_update.jsp로 데이터 전송
		  return "../register/registerModification.jsp";
	  }
	  
	  
	  //  실제 수정 
	  @RequestMapping("register/registerModification_ok.do")
	  public String member_join_update_ok(HttpServletRequest request)
	  {
		  try
		  {
			  //한글 변환
              request.setCharacterEncoding("UTF-8");
			  
			  String id=request.getParameter("id");
			  String name=request.getParameter("name");
			  String post=request.getParameter("post");
			  String addr=request.getParameter("addr");
			  String detail_addr=request.getParameter("detail_addr");
			 
			  String tel1=request.getParameter("tel1");
			  String tel2=request.getParameter("tel2");
			  String tel="010-"+tel1+"-"+tel2;
			 
			  String email1=request.getParameter("email1");
	          String email2=request.getParameter("selbox");
	          
	          if(email2.contains("direct")){
	        	  email2=request.getParameter("selboxDirect");
	          }else{
	        	  email2=request.getParameter("selbox");
	          }
	          String email=email1+"@"+email2;
	          
			  String min=request.getParameter("min");
			  String max=request.getParameter("max");
			  String budget=min+"~"+max;
			  
			  MemberVO vo=new MemberVO();

			  vo.setId(id);
			  vo.setName(name);
			  vo.setAddr(addr);
			  vo.setTel(tel);
			  vo.setEmail(email);
			  vo.setBudget(budget);
			  vo.setPost(post);
			  vo.setDetail_addr(detail_addr);
			  MemberDAO.memberJoinUpdate(vo);
			  // 만약에 이름 변경
			  HttpSession session=request.getSession();
			  session.setAttribute("name", name);
			  
		  }catch(Exception ex){}
		  

		  return "redirect:../main/main.do";
	  }
	  
	
	 

}
