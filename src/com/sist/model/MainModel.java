package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

public class MainModel {

	@RequestMapping("main/main.do")
	public String mainModel(HttpServletRequest request) {
//		System.out.println("메인모델");
		
//		뉴스 최신순
		List<NewsVO> list=MainDAO.newsMainData();
		request.setAttribute("nList", list);
		
//		차 연비 순위
		List<CarVO> list1=MainDAO.carEfficiency();
		request.setAttribute("eList", list1);
		
//		차 출시일 순위
		List<CarVO> list2=MainDAO.carRegdate();
		request.setAttribute("rList", list2);
		
//		차 가격순위
		List<CarVO> list3=MainDAO.carPriceList();
		request.setAttribute("pList", list3);
		
//		악세서리 순위
		List<AccVO> list4=MainDAO.carAccList();
		request.setAttribute("aList", list4);
//		System.out.println(list4.size());
		
//		차량 브랜드
		
		String car_company="국산";
		List<BrandVO> list6=MainDAO.kBrandList(car_company);
//		System.out.println(list6.size());
		request.setAttribute("kBrandList", list6);
		
		
		car_company="유럽";
		List<BrandVO> list7=MainDAO.euBrandList(car_company);
		request.setAttribute("euBrandList", list7);
		
		car_company="일본";
		List<BrandVO> list8=MainDAO.aBrandList(car_company);
		request.setAttribute("aBrandList", list8);
		
		car_company="미국";
		List<BrandVO> list9=MainDAO.amBrandList(car_company);
		request.setAttribute("amBrandList", list9);
		
		
//		차량 인기순
		List<CarVO> list5=MainDAO.carPopularList();
		request.setAttribute("poList", list5);
		
		request.setAttribute("main_jsp", "../cmmn/default-aside.jsp");

		request.getParameter("");
		
		return "main.jsp";
	}
}
