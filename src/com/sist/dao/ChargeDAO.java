package com.sist.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;

public class ChargeDAO {
	private static SqlSessionFactory ssf;
	   static
	   {
		   ssf=CreateSqlSessionFactory.getSsf();
	   }
	   
	public static List<ChargeVO> chargeData(String loc) {
		List<ChargeVO> list = new ArrayList<ChargeVO>();
		SqlSession session = null;
		
		try {
			session = ssf.openSession();
			list = session.selectList("chargeData", loc);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			if (session != null) {
				session.close();
			}
		}

		return list;
	}
}
