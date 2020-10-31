package com.sist.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.AccDAO;
import com.sist.dao.CarDetailDAO;
import com.sist.dao.MypageDAO;
import com.sist.vo.*;


public class MypageModel {

	@RequestMapping("mypage/mypage_main.do")
	public String MainModel(HttpServletRequest request) {
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		List<MyEstimateVO> mList=MypageDAO.myEstimate(id);
		request.setAttribute("mList", mList);
		for(MyEstimateVO vo : mList){
			System.out.println(vo.getMy_model_name());
		}
		return "mypage_main.jsp";
	}
	
	@RequestMapping("mypage/mypage_acc.do")
	public String AccModel(HttpServletRequest request) {
		
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		List<AccTotalVO> list=MypageDAO.accPay(id);
		request.setAttribute("list", list);
		
		return "mypage_acc.jsp";
	}
	//악세사리 찜 내역
	@RequestMapping("mypage/mypage_accCart.do")
	public String AccCartModel(HttpServletRequest request) {
		
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		//jjim
		List<Acc_jjimVO> aList=AccDAO.accGetData(id);
		
		for (int i = 0; i < aList.size(); i++) {
			System.out.println(aList.get(i));
		}
		
		//jjim end
		request.setAttribute("aList", aList);
		
		return "mypage_accCart.jsp";
	}
	
	//마이페이지 견적 내역
	@RequestMapping("mypage/mypage_estimate.do")
	public String estimateModel(HttpServletRequest request) {
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		List<MyEstimateVO> mList=MypageDAO.myEstimate(id);
		request.setAttribute("mList", mList);
		
		return "mypage_estimate.jsp";
	}
	
	//마이페이지 견적 내역 취소
	@RequestMapping("mypage/estimate_cancel.do")
	public String estimate_cancel(HttpServletRequest request) {
		String eno=request.getParameter("eno");
		
		MypageDAO.estimate_cancel(Integer.parseInt(eno));
		
		return "mypage_estimate.do";
	}
	
	@RequestMapping("mypage/estimate_detail.do")
	public String estimate_detail(HttpServletRequest request) {
		String eno=request.getParameter("eno");
		
		Car_estimateVO car_estimate_vo = MypageDAO.estimatevo_detail(Integer.parseInt(eno));
		String car_num = MypageDAO.estimate_carnum(car_estimate_vo.getModel_num());
		CarVO carvo = CarDetailDAO.carDetailData(car_num);
		
		request.setAttribute("car_estimate_vo", car_estimate_vo);
		request.setAttribute("carvo", carvo);
		
		return "mypage_estimate_detail.jsp";
	}
	
	@RequestMapping("mypage/mypage_reservation.do")
	public String reservationModel(HttpServletRequest request) {
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		List<Driver_reserveVO> list=MypageDAO.reserveMypage(id);
		request.setAttribute("list", list);
		return "mypage_reservation.jsp";
	}
	
	@RequestMapping("mypage/mypage_admin.do")
	public String adminModel(HttpServletRequest request) {
		String no = request.getParameter("no");
		if (no == null) {
			List<Driver_reserveVO> list=MypageDAO.adminMypage();
			request.setAttribute("list", list);
		} else {
			MypageDAO.reserveOkUpdate(Integer.parseInt(no));
			
			List<Driver_reserveVO> list=MypageDAO.adminMypage();
			request.setAttribute("list", list);
		}
		
		return "mypage_admin.jsp";
	}			
	
	@RequestMapping("mypage/reservation_cancel.do")
	public String reservationCancelModel(HttpServletRequest request) {
		String no = request.getParameter("no");

		MypageDAO.reserveDelete(Integer.parseInt(no));
		return "redirect:mypage_reservation.do";
	}
	
	@RequestMapping("mypage/acc_cancel.do")
	public String acc_cancel(HttpServletRequest request) {
		String ano=request.getParameter("ano");
		
		MypageDAO.acc_cancel(Integer.parseInt(ano));
		
		return "mypage_accCart.do";
	}
	
	
	
}
