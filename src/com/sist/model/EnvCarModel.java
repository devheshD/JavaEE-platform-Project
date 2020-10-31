package com.sist.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

public class EnvCarModel {

	@RequestMapping("environment_car/environment_car.do")
	public String environmentModel1(HttpServletRequest request) {
		List<Environment_infoVO> envInfo = EnvInfoDAO.envInfodata();
		request.setAttribute("envInfo", envInfo);
		return "environment_car.jsp";
	}
	
	@RequestMapping("environment_car/env_car_list.do")
	public String car_list(HttpServletRequest request) 
	{	
		String strPage=request.getParameter("page");	
		String cateNo=request.getParameter("cateNo");
		
		if(strPage==null)
			strPage="1";
		int curpage=Integer.parseInt(strPage);
		int rowSize=9;
		int start=(curpage*rowSize)-(rowSize-1);
		int end=(curpage*rowSize);
		
	    Map map=new HashMap();
	    map.put("start",start);
	    map.put("end",end);
	    
	    List<CarVO> list=new ArrayList<CarVO>();
	    int totalpage=EnvInfoDAO.env_carTotalPage();
	    
	    if(cateNo==null)
	    	cateNo="1";
	    if(cateNo.equals("1"))
	    	list=EnvInfoDAO.env_carListData(map);
	    else if(cateNo.equals("2"))
	    	list=EnvInfoDAO.env_carListLaunchdate(map);
	    else if(cateNo.equals("3"))
	    	list=EnvInfoDAO.env_carListPrice(map);
	    
	    final int BLOCK=5;
	    int allPage=totalpage;
	    int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	    /*
	    	curpage : 1~5 ==> BLOCK 1
	    		(6-1)/5*5 => 5+1 => 6    			
	    	현재페이지 ==> 1~5 : 1
	    			   6~10 : 6
	    			   11~15 : 11
	    */
	    int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	    if(endPage>allPage)
	    	endPage=allPage;
		
	    List<BrandVO> bList=CarDAO.carBrandData();
	    request.setAttribute("bList", bList);
		
		request.setAttribute("cList", list);
		request.setAttribute("BLOCK", BLOCK);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("allPage", allPage);
		request.setAttribute("curpage", curpage);
		request.setAttribute("strPage", strPage);
		request.setAttribute("cateNo", cateNo);				
		
		request.setAttribute("carList_jsp", "env_car_item.jsp");
		
		return "env_car_list.jsp";
	}
	
	@RequestMapping("environment_car/env_car_search.do")
	public String car_search(HttpServletRequest request)
	{
		try
		{
			//한글 변환
			request.setCharacterEncoding("UTF-8");
			//컴파일 예외처리 => 반드시 컴파일 전에 예외처리를 한다
		}catch(Exception ex){}
		
		String keyword=request.getParameter("keyword");
		
		List<CarVO> list=EnvInfoDAO.env_carSearchData(keyword);		
		
		List<BrandVO> bList=CarDAO.carBrandData();
	    request.setAttribute("bList", bList);
		
		request.setAttribute("cList", list);	
				
		return "env_car_item.jsp";
	}
	
	@RequestMapping("environment_car/env_carPrice_search.do")
   public String carPrice_search(HttpServletRequest request)
   {
       String lowPrice=request.getParameter("lowPrice");
       String highPrice=request.getParameter("highPrice");
       
       if(lowPrice=="")
    	   lowPrice="1";
       if(highPrice=="")
    	   highPrice="99999";
       
       Map map=new HashMap();
       map.put("lowPrice",Integer.parseInt(lowPrice));
       map.put("highPrice",Integer.parseInt(highPrice));
       
       List<CarVO> list=EnvInfoDAO.env_carPriceSearchData(map);
       
       List<BrandVO> bList=CarDAO.carBrandData();
       request.setAttribute("bList", bList);
       
       request.setAttribute("cList", list);       
       
       return "env_car_item.jsp";
   }
	
	@RequestMapping("environment_car/env_carDetail_search.do")
	public String carDetail_search(HttpServletRequest request)
	{	
		String[] carsizeArr=request.getParameterValues("carsizeArr");
		String[] carfueltypeArr=request.getParameterValues("carfueltypeArr");
		
		if(carsizeArr==null)
		{
			carsizeArr=new String[7];
			carsizeArr[0]="경형";
			carsizeArr[1]="소형";
			carsizeArr[2]="준중형";
			carsizeArr[3]="중형";
			carsizeArr[4]="준대형";
			carsizeArr[5]="대형";
			carsizeArr[6]="스포츠카";
		}
		
		if(carfueltypeArr==null)
		{
			carfueltypeArr=new String[3];			
			carfueltypeArr[0]="LPG";
			carfueltypeArr[1]="전기";
			carfueltypeArr[2]="수소";			
		}
		
		Map<String,String[]> arrMap = new HashMap<>();
		arrMap.put("carsizeArr", carsizeArr);
		arrMap.put("carfueltypeArr", carfueltypeArr);
				
		List<CarVO> list=EnvInfoDAO.env_carDetailSearchData(arrMap);
		
		List<BrandVO> bList=CarDAO.carBrandData();
	    request.setAttribute("bList", bList);
	       
	    request.setAttribute("cList", list); 
	    
	    return "env_car_item.jsp";
	}
	
	
	
	@RequestMapping("environment_car/env_car_charge.do")
	public String environmentModel3(HttpServletRequest request) {

		return "env_car_charge.jsp";
	}
	
	@RequestMapping("environment_car/env_car_charge_table.do")
	public String environmentModel4(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		
		String loc = request.getParameter("loc");
		List<ChargeVO> charge = ChargeDAO.chargeData(loc);
		
		HttpSession session = request.getSession();
		session.setAttribute("charge", charge);	
		
		return "charge_table.jsp";
	}
	

	@RequestMapping("environment_car/charge_addr.do")
	public String charge_addr(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		
		String addr = request.getParameter("addr");
		String charge_name = request.getParameter("charge_name");
		
		request.setAttribute("addr", addr);
		request.setAttribute("charge_name", charge_name);
		
		return "listmap.jsp";
	}
	
}
