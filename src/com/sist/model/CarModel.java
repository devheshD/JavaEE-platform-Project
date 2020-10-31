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
public class CarModel {

	@RequestMapping("car/car.do")
	public String car_list(HttpServletRequest request) 
	{	
		//최근본 목록
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		Cookie[] cookies=request.getCookies();
				
		List<CarVO> cookieList1=new ArrayList<CarVO>();	
		
		if(id==null)
		{
			id="NOID";
		}	
		
		for(int i=0; i<cookies.length; i++)
		{
			if(cookies[i].getName().startsWith(id))
			{
				String value=cookies[i].getValue();
				CarVO cvo=CarDetailDAO.carDetailData(value);
				cookieList1.add(cvo);
			}
		}
		
		List<CarVO> cookieList=new ArrayList<CarVO>();
		for(int i=cookieList1.size()-1;i>=0;i--)
		   {
			   CarVO v=cookieList1.get(i);
			   cookieList.add(v);
		   }
		
		request.setAttribute("cookieList", cookieList);		
		//
		
		String strPage=request.getParameter("page");	
		String cateNo=request.getParameter("cateNo");
		
		if(strPage==null)
			strPage="1";
		int curpage=Integer.parseInt(strPage);
		int rowSize=18;
		int start=(curpage*rowSize)-(rowSize-1);
		int end=(curpage*rowSize);
		
	    Map map=new HashMap();
	    map.put("start",start);
	    map.put("end",end);
	    
	    List<CarVO> list=new ArrayList<CarVO>();
	    int totalpage=CarDAO.carTotalPage();
	    
	    if(cateNo==null)
	    	cateNo="1";
	    if(cateNo.equals("1"))
	    	list=CarDAO.carListData(map);
	    else if(cateNo.equals("2"))
	    	list=CarDAO.carListLaunchdate(map);
	    else if(cateNo.equals("3"))
	    	list=CarDAO.carListEfficiency(map);
	    else if(cateNo.equals("4"))
	    	list=CarDAO.carListPrice(map);
	    
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
		
		request.setAttribute("carList_jsp", "car_list.jsp");
		
		return "car.jsp";
	}
	
	@RequestMapping("car/car_search.do")
	public String car_search(HttpServletRequest request)
	{
		try
		{
			//한글 변환
			request.setCharacterEncoding("UTF-8");
			//컴파일 예외처리 => 반드시 컴파일 전에 예외처리를 한다
		}catch(Exception ex){}
		
		String keyword=request.getParameter("keyword");
		
		List<CarVO> list=CarDAO.carSearchData(keyword);		
		
		List<BrandVO> bList=CarDAO.carBrandData();
	    request.setAttribute("bList", bList);
		
		request.setAttribute("cList", list);	
				
		return "car_list.jsp";
	}
	
	@RequestMapping("car/carPrice_search.do")
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
       
       List<CarVO> list=CarDAO.carPriceSearchData(map);
       
       List<BrandVO> bList=CarDAO.carBrandData();
       request.setAttribute("bList", bList);
       
       request.setAttribute("cList", list);       
       
       return "car_list.jsp";
   }
	
	@RequestMapping("car/carDetail_search.do")
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
			carfueltypeArr=new String[4];
			carfueltypeArr[0]="휘발유";
			carfueltypeArr[1]="경유";
			carfueltypeArr[2]="LPG";
			carfueltypeArr[3]="전기";
		}
		
		Map<String,String[]> arrMap = new HashMap<>();
		arrMap.put("carsizeArr", carsizeArr);
		arrMap.put("carfueltypeArr", carfueltypeArr);
				
		List<CarVO> list=CarDAO.carDetailSearchData(arrMap);
		
		List<BrandVO> bList=CarDAO.carBrandData();
	    request.setAttribute("bList", bList);
	       
	    request.setAttribute("cList", list); 
	    
		return "car_list.jsp";
	}
}
