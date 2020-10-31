package com.sist.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;

public class EnvInfoDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}

	public static List<Environment_infoVO> envInfodata() {
		List<Environment_infoVO> list = new ArrayList<Environment_infoVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("envInfoData");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {
				session.close();
			}
		}

		return list;
	}

	// 자동차 리스트
	public static List<CarVO> env_carListData(Map map) {
		List<CarVO> list = new ArrayList<CarVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession(); // connection연결
			list = session.selectList("env_carListData", map);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	// 총페이지
	public static int env_carTotalPage() {
		int total = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			total = session.selectOne("env_carTotalPage");
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return total;
	}

	// 최신순 자동차 리스트
	public static List<CarVO> env_carListLaunchdate(Map map) {
		List<CarVO> list = new ArrayList<CarVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession(); // connection연결
			list = session.selectList("env_carListLaunchdate", map);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	// 가격순 자동차 리스트
	public static List<CarVO> env_carListPrice(Map map) {
		List<CarVO> list = new ArrayList<CarVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession(); // connection연결
			list = session.selectList("env_carListPrice", map);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	// 자동차 검색(이름)
	public static List<CarVO> env_carSearchData(String keyword) {
		List<CarVO> list = new ArrayList<CarVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("env_carSearchData", keyword);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	// 자동차 검색(가격)
	public static List<CarVO> env_carPriceSearchData(Map map) {
		List<CarVO> list = new ArrayList<CarVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("env_carPriceSearchData", map);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	// 자동차 상세 검색(체크박스)
	public static List<CarVO> env_carDetailSearchData(Map<String, String[]> arrMap) {
		List<CarVO> list = new ArrayList<CarVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("env_carDetailSearchData", arrMap);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}
}
