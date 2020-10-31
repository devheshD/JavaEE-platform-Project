package com.sist.model;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.CarDAO;
import com.sist.dao.CarDetailDAO;

import java.util.*;
import com.sist.vo.*;

public class CarDetailModel {
	
	@RequestMapping("car/car_detail.do")
	public String car_detail(HttpServletRequest request,HttpServletResponse response)
	{		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");		
		
		String cno=request.getParameter("cno");
		CarVO carvo=CarDetailDAO.carDetailData(cno);
		request.setAttribute("carvo", carvo);
		
		//�ֱٺ���� ��Ű �߰�		
		if(id==null)
		{
			id="NOID";
		}
		
		Cookie[] cookies=request.getCookies();
		for(int i=0;i<cookies.length;i++)
		{
			if(cookies[i].getName().equals(id+cno))
			{
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
				break;
			}
		}
		
		Cookie cookie=new Cookie(id+cno, cno);
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		//
		
		//������ ������ �ڵ������� car_num�� ����Ʈ�� �޴´�
		List<String> nopricelist = new ArrayList<String>();
		nopricelist = CarDetailDAO.nopriceList();
		
		CarVO compvo = CarDetailDAO.carCompare(cno);
		
		//car_list���� �Ѿ�� cno�� ����Ʈ�� cno�ȿ� ��������� 
		for(String nocno : nopricelist){
			if(nocno.equals(cno)){
				//�ڽ��� ������ ����
				compvo = CarDetailDAO.nopriceRand(cno);
			}
		}

		request.setAttribute("compvo", compvo);
	
		List<Car_model_trimVO> modellist = CarDetailDAO.carDetailModel(cno);
		request.setAttribute("modellist", modellist);
		
		List<Car_model_trimVO> trimlist = CarDetailDAO.carDetailTrim(cno);
		request.setAttribute("trimlist", trimlist);
		
		return "car_detail.jsp";
	}
	
	@RequestMapping("car/car_spec.do")
	public String car_spec(HttpServletRequest request){
		String trim_num = request.getParameter("trim_num");
		
		Car_specVO car_specvo = CarDetailDAO.carSpec(trim_num);
		request.setAttribute("car_specvo", car_specvo);
		
		return "car_spec.jsp";
	}
	
	@RequestMapping("car/car_estimate.do")
	public String car_estimate(HttpServletRequest request){
		String cno=request.getParameter("cno");
		CarVO carvo=CarDetailDAO.carDetailData(cno);
		request.setAttribute("carvo", carvo);
		
		List<Car_model_trimVO> modellist = CarDetailDAO.carDetailModel(cno);
		request.setAttribute("modellist", modellist);
		
		List<Car_model_trimVO> trimlist = CarDetailDAO.carDetailTrim(cno);
		request.setAttribute("trimlist", trimlist);
		
		
		
		return "car_estimate.jsp";
	}
	
	@RequestMapping("car/car_brand.do")
	public String car_search(HttpServletRequest request) {
		
		
		try {
			// �ѱ� ��ȯ
			request.setCharacterEncoding("UTF-8");
			// ������ ����ó�� => �ݵ�� ������ ���� ����ó���� �Ѵ�
		} catch (Exception ex) {
		}
		
		// �ֱٺ� ���
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		Cookie[] cookies = request.getCookies();

		List<CarVO> cookieList1 = new ArrayList<CarVO>();

		if (id == null) {
			id = "NOID";
		}

		for (int i = 0; i < cookies.length; i++) {
			if (cookies[i].getName().startsWith(id)) {
				String value = cookies[i].getValue();
				CarVO cvo = CarDetailDAO.carDetailData(value);
				cookieList1.add(cvo);
			}
		}

		List<CarVO> cookieList = new ArrayList<CarVO>();
		for (int i = cookieList1.size() - 1; i >= 0; i--) {
			CarVO v = cookieList1.get(i);
			cookieList.add(v);
		}

		request.setAttribute("cookieList", cookieList);
		//

		String keyword = request.getParameter("keyword");
		List<CarVO> list = CarDAO.carSearchData(keyword);
		request.setAttribute("cList", list);
		
		List<BrandVO> bList = CarDAO.carBrandData();
		request.setAttribute("bList", bList);

		request.setAttribute("carList_jsp", "car_list.jsp");

	    request.setAttribute("startPage", 1);
		request.setAttribute("endPage", 1);
		request.setAttribute("allPage", 1);
		request.setAttribute("curpage", 1);
		request.setAttribute("strPage", 1);
		request.setAttribute("cateNo",1);	
	    
		return "car.jsp";
	}
	 
}
