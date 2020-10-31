package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.MemberVO;

public class LoginModel {
	
  @RequestMapping("login/login.do")
  public String member_login(HttpServletRequest request)
  {
	  return "../login/login.jsp";
  }
  
  // 로그인 버튼을 클릭시에 처리 
  @RequestMapping("login/login_ok.do")
  public String member_login_ok(HttpServletRequest request)
  {
	  // {"id":id,"pwd":pwd}
	  String id=request.getParameter("id");
	  String pwd=request.getParameter("pwd");
	  MemberVO vo=MemberDAO.memberLogin(id, pwd);
	  // 로그인시에 필요한 데이터를 저장 (session)
	  if(vo.getMsg().equals("OK"))
	  {
		  HttpSession session=request.getSession();
		  session.setAttribute("id", id);
		  session.setAttribute("pwd", pwd);
		  session.setAttribute("name", vo.getName());
	  }
	  
	  // 결과 
	  request.setAttribute("res", vo.getMsg());
	  return "../login/login_ok.jsp";
  }
  
  
  @RequestMapping("member/logout.do")
  public String member_logout(HttpServletRequest request){
	  
	  // session에 있는 모든 데이터 삭제 => invalidate()
	  // session 생성
	  HttpSession session=request.getSession();
	  session.invalidate();
	  return "redirect:../main/main.do";
	//  return "../main/main.jsp";
  }
}

