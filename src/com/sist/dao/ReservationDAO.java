package com.sist.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.Driver_reserveVO;
import com.sist.vo.MemberVO;

public class ReservationDAO {

	private static SqlSessionFactory ssf;
	
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	
	// 시승 신청 정보 추가
	public static void reserveInsertData(Driver_reserveVO vo) {
		SqlSession session = null;
		
		try {
			session = ssf.openSession(true);
			session.insert("reserveInsertData", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) session.close();
		}
		
	}


}
