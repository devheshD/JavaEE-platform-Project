package com.sist.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.sist.vo.*;

public class MypageDAO {
	private static SqlSessionFactory ssf;

	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}

	// 관리자 페이지 시승 내역 조회
	public static List<Driver_reserveVO> adminMypage() {

		List<Driver_reserveVO> list = new ArrayList<Driver_reserveVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("adminMypage");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return list;
	}

	// 예약 승인하기
	public static void reserveOkUpdate(int no) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.update("reserveOkUpdate", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}

	// 시승예약 마이페이지 내역 조회
	public static List<Driver_reserveVO> reserveMypage(String id) {

		List<Driver_reserveVO> list = new ArrayList<Driver_reserveVO>();
		SqlSession session = null;

		try {
			session = ssf.openSession();
			list = session.selectList("reserveMypage", id);

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			if (session != null)
				session.close();

		}

		return list;

	}

	// 예약 취소
	public static void reserveDelete(int no) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.delete("reserveDelete", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}

	public static List<AccTotalVO> accPay(String id) {

		List<AccTotalVO> list = new ArrayList<AccTotalVO>();
		SqlSession session = null;

		try {
			session = ssf.openSession();
			list = session.selectList("accPay", id);

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			if (session != null)
				session.close();

		}

		return list;

	}

	// 마이페이지 견적내역
	public static List<MyEstimateVO> myEstimate(String id) {

		List<MyEstimateVO> list = new ArrayList<MyEstimateVO>();
		SqlSession session = null;

		try {
			session = ssf.openSession();
			list = session.selectList("myEstimate", id);

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			if (session != null)
				session.close();

		}

		return list;

	}

	// 마이페이지 견적내역 취소
	public static void estimate_cancel(int eno) {

		SqlSession session = null;

		try {
			session = ssf.openSession(true);
			session.delete("estimate_cancel", eno);

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			if (session != null)
				session.close();

		}

	}

	// 마이페이지 견적내역1
	public static Car_estimateVO estimatevo_detail(int eno) {

		Car_estimateVO evo = new Car_estimateVO();
		SqlSession session = null;

		try {
			session = ssf.openSession();
			evo = session.selectOne("estimate_detail", eno);

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			if (session != null)
				session.close();
		}
		return evo;
	}

	// 마이페이지 견적내역2
	public static String estimate_carnum(String model_num) {

		String car_num = "";
		SqlSession session = null;

		try {
			session = ssf.openSession();
			car_num = session.selectOne("estimate_carnum", model_num);

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			if (session != null)
				session.close();
		}
		return car_num;
	}
	
	public static void acc_cancel(int ano) {

		SqlSession session = null;

		try {
			session = ssf.openSession(true);
			session.delete("acc_cancel", ano);

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			if (session != null)
				session.close();

		}

	}

}
