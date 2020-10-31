package com.sist.dao;

import java.util.*;
import com.sist.vo.*;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class CarDetailDAO {

	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}

	// 자동차 상세보기
	public static CarVO carDetailData(String cno) {
		CarVO vo = new CarVO();
		SqlSession session = null;
		try {
			session = ssf.openSession(); // connection연결
			vo = session.selectOne("carDetailData", cno);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return vo;
	}
	
	// 자동차 상세보기 - 모델
	public static List<Car_model_trimVO> carDetailModel(String cno) {
		List<Car_model_trimVO> modellist = new ArrayList<Car_model_trimVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			modellist = session.selectList("carDetailModel", cno);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return modellist;
	}
	
	// 자동차 상세보기 - 트림
	public static List<Car_model_trimVO> carDetailTrim(String cno) {
		List<Car_model_trimVO> trimlist = new ArrayList<Car_model_trimVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			trimlist = session.selectList("carDetailTrim", cno);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return trimlist;
	}
	
	public static Car_specVO carSpec(String trim_num){
		Car_specVO car_specvo = new Car_specVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			car_specvo = session.selectOne("carSpec", trim_num);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return car_specvo;
	}
		
	public static CarVO carCompare(String cno) {
		CarVO vo = new CarVO();
		SqlSession session = null;
		try {
			session = ssf.openSession(); // connection연결
			vo = session.selectOne("carCompare", cno);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return vo;
	}
	
	public static List<Car_optionVO> carOptionData(String trim_num){
		List<Car_optionVO> list=new ArrayList<Car_optionVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("carOptionData", trim_num);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}
	
	public static void estimate_without(Car_estimateVO vo){
		SqlSession session = null;
		
		try {
			session = ssf.openSession(true);
			session.insert("estimate_without", vo);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}
	
	public static void estimate_with(Car_estimateVO vo){
		SqlSession session = null;
		
		try {
			session = ssf.openSession(true);
			session.insert("estimate_with", vo);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}
	
	public static List<String> nopriceList(){
		SqlSession session = null;
		List<String> nopriceList = new ArrayList<String>();
		try {
			session = ssf.openSession();
			nopriceList = session.selectList("nopriceList");
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		
		return nopriceList;	
	}
	
	public static CarVO nopriceRand(String cno){
		SqlSession session = null;
		CarVO rand = new CarVO();
		try {
			session = ssf.openSession();
			rand = session.selectOne("nopriceRand",cno);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		
		return rand;	
	}
	 
	
}
