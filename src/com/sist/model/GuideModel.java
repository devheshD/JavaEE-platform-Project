package com.sist.model;

import javax.servlet.http.HttpServletRequest;

import com.sist.controller.RequestMapping;

public class GuideModel {

	@RequestMapping("guide/guide_main.do")
	public String guide_Main_Model(HttpServletRequest request) {
		
		return "guide_main.jsp";
	}
	
	@RequestMapping("guide/guide_garage.do")
	public String guide_Garage_Model(HttpServletRequest request) {
		return "guide_garage.jsp";
	}
	
	@RequestMapping("guide/guide_N_gear.do")
	public String guide_N_gear_Model(HttpServletRequest request) {
		return "guide_N_gear.jsp";
	}
	
	@RequestMapping("guide/guide_purchase.do")
	public String guide_purchase_Model(HttpServletRequest request) {
		
		return "guide_purchase.jsp";
	}
	
	@RequestMapping("guide/guide_parking_method.do")
	public String guide_parking_Model(HttpServletRequest request) {
		
		return "guide_parking_method.jsp";
	}
	
	@RequestMapping("guide/guide_night_driving.do")
	public String guide_night_Model(HttpServletRequest request) {
		
		return "guide_night_driving.jsp";
	}
}
