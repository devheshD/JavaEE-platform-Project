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
	 
	 
	  // �����ȣ �˻� 
	  @RequestMapping("register/postfind.do")
	  public String post_find(HttpServletRequest request)
	  {
		  return "../register/postfind.jsp";
	  }
	  
	  
	  @RequestMapping("register/post_result.do")
	  public String post_result(HttpServletRequest request)
	  {
		  // ����ڰ� �Է��� dong�� �޴´� 
		  try
		  {
			  // �ѱ� ��ȯ 
			  request.setCharacterEncoding("UTF-8");
			  // ������ ����ó�� => �ݵ�� ���������� ����ó���� �Ѵ� 
		  }catch(Exception ex){}
		  
		  String dong=request.getParameter("dong");
		  System.out.println(dong);
		  List<ZipcodeVO> list=MemberDAO.postFind(dong);
		  // list=>postfind.jsp�� ���� 
		  request.setAttribute("list", list);
		  // �˻���� 
		  request.setAttribute("count", list.size());
		  return "../register/post_result.jsp";// ���ο� â�� �����ٶ�
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
		  //DAO���� 
		  int count=MemberDAO.idcheck(id);
		  request.setAttribute("count", count);
		  return "../register/idcheck_result.jsp";
	  }
	  
	  @RequestMapping("register/register_ok.do")
	  public String member_join_ok(HttpServletRequest request)
	  {
		// ��û�� �ޱ� 
		  try
		  {
			  //�ѱ� ��ȯ
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
			  
			
			  //DAO���� 
			  MemberDAO.memberInsert(vo);
			  
		  }catch(Exception ex){}

		  return "redirect:../main/main.do";
	  }
	  
	  // join_update.do => MemberModel (�޼ҵ� ����) <=> MemberDAO
	  //                     => ���� ����� JSP�� ���� (request.setAttribute())
	  // ȸ������ 
	  @RequestMapping("register/registerModification.do")
	  public String member_join_update(HttpServletRequest request)
	  {
		  HttpSession session=request.getSession();
		  String id=(String)session.getAttribute("id");
		  // DAO
		  MemberVO vo=MemberDAO.memberJoinUpdateData(id);
		  request.setAttribute("vo", vo);//join_update.jsp�� ������ ����
		  return "../register/registerModification.jsp";
	  }
	  
	  
	  //  ���� ���� 
	  @RequestMapping("register/registerModification_ok.do")
	  public String member_join_update_ok(HttpServletRequest request)
	  {
		  try
		  {
			  //�ѱ� ��ȯ
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
			  // ���࿡ �̸� ����
			  HttpSession session=request.getSession();
			  session.setAttribute("name", name);
			  
		  }catch(Exception ex){}
		  

		  return "redirect:../main/main.do";
	  }
	  
	
	 

}
