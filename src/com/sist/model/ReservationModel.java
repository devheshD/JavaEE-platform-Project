package com.sist.model;


import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.sist.controller.RequestMapping;
import com.sist.vo.Driver_reserveVO;
import com.sist.vo.MemberVO;
import com.sist.dao.*;

public class ReservationModel {

	@RequestMapping("reservation/reservation.do")
	public String reservationModel(HttpServletRequest request) {
		Date date = new Date();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d");
	   
	    String today = sdf.format(date);
	    StringTokenizer st = new StringTokenizer(today,"-");
	    
	    String strYear = request.getParameter("year");
	    if(strYear == null)
	       strYear = st.nextToken();
	    
	    String strMonth = request.getParameter("month");
	    if(strMonth == null)
	       strMonth=st.nextToken();
	    
	    int year = Integer.parseInt(strYear);
	    int month = Integer.parseInt(strMonth);
	 
	   
	    Calendar cal = Calendar.getInstance();
	    cal.set(Calendar.YEAR,year);
	    cal.set(Calendar.MONTH,month-1);
	    cal.set(Calendar.DATE,1);

	    request.setAttribute("year", year);
	    request.setAttribute("month", month);
	    
	    HttpSession session = request.getSession();
	    String id = (String) session.getAttribute("id");	    
	    session.setAttribute("loginId", id);
	   
		return "reservation.jsp";
	}
	
	@RequestMapping("reservation/calendar.do")
	public String calendarModel(HttpServletRequest request) {
		Date date=new Date();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d");
	    
	    String today = sdf.format(date);
	    StringTokenizer st = new StringTokenizer(today,"-");
	    
	    String strYear = request.getParameter("year");
	    if(strYear == null)
	       strYear=st.nextToken();
	    
	    String strMonth = request.getParameter("month");
	    if(strMonth == null)
	       strMonth=st.nextToken();
	    
	    int year = Integer.parseInt(strYear);
	    int month = Integer.parseInt(strMonth);	
	    int day = 1;
	   
	    Calendar cal = Calendar.getInstance();
	    cal.set(Calendar.YEAR,year);
	    cal.set(Calendar.MONTH,month-1);	// month=0(1)
	    cal.set(Calendar.DATE,1);
	    int week = cal.get(Calendar.DAY_OF_WEEK);
	   
	    String[] strWeek = {"일","월","화","수","목","금","토"};
	    int lastDay = cal.getActualMaximum(Calendar.DATE);
	    
	    request.setAttribute("year", year);
	    request.setAttribute("month", month);
	    request.setAttribute("day", day);
	    request.setAttribute("week", week);
	    request.setAttribute("strWeek", strWeek);
	    request.setAttribute("lastDay", lastDay);
	    
		return "calendar.jsp";
	}
	
	@RequestMapping("reservation/reservation_ok.do")
	public String reservation_ok(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		
		String modelData = request.getParameter("modelData");	
		String calendarData = request.getParameter("calendarData");		
		String res_name = request.getParameter("res_name");
		String memberId = request.getParameter("memberId");
		String agencyData = request.getParameter("agencyData");
		String tel0 = request.getParameter("tel0");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");

		Driver_reserveVO vo = new Driver_reserveVO();
		vo.setModel(modelData);
		vo.setReserve_date(calendarData);
		vo.setPassenger(res_name);
		vo.setId(memberId);
		vo.setAgency_name(agencyData);
		vo.setTel(tel0 + "-" + tel1 + "-" + tel2);
		
		ReservationDAO.reserveInsertData(vo);
		
		return "redirect:../main/main.do";
	}
}
