package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

public class MainModel {

	@RequestMapping("main/main.do")
	public String mainModel(HttpServletRequest request) {
//		System.out.println("���θ�");
		
//		���� �ֽż�
		List<NewsVO> list=MainDAO.newsMainData();
		request.setAttribute("nList", list);
		
//		�� ���� ����
		List<CarVO> list1=MainDAO.carEfficiency();
		request.setAttribute("eList", list1);
		
//		�� ����� ����
		List<CarVO> list2=MainDAO.carRegdate();
		request.setAttribute("rList", list2);
		
//		�� ���ݼ���
		List<CarVO> list3=MainDAO.carPriceList();
		request.setAttribute("pList", list3);
		
//		�Ǽ����� ����
		List<AccVO> list4=MainDAO.carAccList();
		request.setAttribute("aList", list4);
//		System.out.println(list4.size());
		
//		���� �귣��
		
		String car_company="����";
		List<BrandVO> list6=MainDAO.kBrandList(car_company);
//		System.out.println(list6.size());
		request.setAttribute("kBrandList", list6);
		
		
		car_company="����";
		List<BrandVO> list7=MainDAO.euBrandList(car_company);
		request.setAttribute("euBrandList", list7);
		
		car_company="�Ϻ�";
		List<BrandVO> list8=MainDAO.aBrandList(car_company);
		request.setAttribute("aBrandList", list8);
		
		car_company="�̱�";
		List<BrandVO> list9=MainDAO.amBrandList(car_company);
		request.setAttribute("amBrandList", list9);
		
		
//		���� �α��
		List<CarVO> list5=MainDAO.carPopularList();
		request.setAttribute("poList", list5);
		
		request.setAttribute("main_jsp", "../cmmn/default-aside.jsp");

		request.getParameter("");
		
		return "main.jsp";
	}
}
