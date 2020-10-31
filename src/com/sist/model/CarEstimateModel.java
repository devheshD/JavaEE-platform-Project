package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;

import com.sist.dao.CarDetailDAO;

import java.util.*;
import com.sist.vo.*;

public class CarEstimateModel {
	@RequestMapping("car/car_option.do")
	public String car_option(HttpServletRequest request) {

		String trim_num = request.getParameter("trim_num");

		List<Car_optionVO> list = CarDetailDAO.carOptionData(trim_num);

		request.setAttribute("count", list.size());
		request.setAttribute("oList", list);

		return "car_option.jsp";
	}

	@RequestMapping("car/estimate_ok.do")
	public String estimate_ok(HttpServletRequest request) {
		try {
			// 한글 변환
			request.setCharacterEncoding("UTF-8");
			// 컴파일 예외처리 => 반드시 컴파일 전에 예외처리를 한다
		} catch (Exception ex) {
		}
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		String estimate_car_price = request.getParameter("estimate_car_price");
		String estimate_option_price = request.getParameter("estimate_option_price");
		String estimate_total_price = request.getParameter("estimate_total_price");
		String debt = request.getParameter("debt");
		String model_num = request.getParameter("model_num");
		String trim_num = request.getParameter("trim_num");
		String option_name = request.getParameter("option_name");

		Car_estimateVO vo = new Car_estimateVO();
		vo.setId(id);
		vo.setModel_num(model_num);
		vo.setTrim_num(trim_num);
		vo.setEstimate_car_price(Integer.parseInt(estimate_car_price));
		vo.setEstimate_option_price(Integer.parseInt(estimate_option_price));
		vo.setEstimate_total_price(Integer.parseInt(estimate_total_price));
		vo.setOption_choice(option_name);

		if (debt.equals("yes")) {
			String estimate_budget = request.getParameter("estimate_budget");
			String estimate_debt = request.getParameter("estimate_debt");
			String estimate_months = request.getParameter("estimate_months");
			String monthly_installment = request.getParameter("monthly_installment");

			vo.setEstimate_budget(Integer.parseInt(estimate_budget));
			vo.setEstimate_debt(Integer.parseInt(estimate_debt));
			vo.setEstimate_months(Integer.parseInt(estimate_months));
			vo.setMonthly_installment(Integer.parseInt(monthly_installment));

			CarDetailDAO.estimate_with(vo);
		} else {
			CarDetailDAO.estimate_without(vo);
		}

		return "../mypage/mypage_main.do";
	}
}
