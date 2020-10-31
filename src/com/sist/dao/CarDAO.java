package com.sist.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;

public class CarDAO {
	private static SqlSessionFactory ssf;
	static
	{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	// �ڵ��� ����Ʈ
	public static List<CarVO> carListData(Map map)
	{
		List<CarVO> list=new ArrayList<CarVO>();
		SqlSession session=null;		
		try
		{
			session=ssf.openSession();	//connection����
			list=session.selectList("carListData",map);			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	//�ֽż� �ڵ��� ����Ʈ
	public static List<CarVO> carListLaunchdate(Map map)
	{
		List<CarVO> list=new ArrayList<CarVO>();
		SqlSession session=null;		
		try
		{
			session=ssf.openSession();	//connection����
			list=session.selectList("carListLaunchdate",map);			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	//����� �ڵ��� ����Ʈ
	public static List<CarVO> carListEfficiency(Map map)
	{
		List<CarVO> list=new ArrayList<CarVO>();
		SqlSession session=null;		
		try
		{
			session=ssf.openSession();	//connection����
			list=session.selectList("carListEfficiency",map);			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		return list;
	}
		
	//���ݼ� �ڵ��� ����Ʈ
	public static List<CarVO> carListPrice(Map map)
	{
		List<CarVO> list=new ArrayList<CarVO>();
		SqlSession session=null;		
		try
		{
			session=ssf.openSession();	//connection����
			list=session.selectList("carListPrice",map);			
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	//�ڵ��� �귣��
	public static List<BrandVO> carBrandData()
    {
		List<BrandVO> list=new ArrayList<BrandVO>();
    	SqlSession session=null;
    	try
    	{
    		session=ssf.openSession();
    		list=session.selectList("carBrandData");
    	}
    	catch(Exception ex)
    	{
    		ex.printStackTrace();    		
    	}
    	finally
    	{
    		if(session!=null)
    			session.close();
    	}
    	return list;
    }
	
	//��������
	public static int carTotalPage()
    {
    	int total=0;
    	SqlSession session=null;
    	try
    	{
    		session=ssf.openSession();
    		total=session.selectOne("carTotalPage");
    	}
    	catch(Exception ex)
    	{
    		ex.printStackTrace();    		
    	}
    	finally
    	{
    		if(session!=null)
    			session.close();
    	}
    	return total;
    }
		
	//�ڵ��� �˻�(�̸�)
	public static List<CarVO> carSearchData(String keyword)
	{
		List<CarVO> list=new ArrayList<CarVO>();
		SqlSession session=null;
		try
		{
			session=ssf.openSession();
			list=session.selectList("carSearchData",keyword);
		}
		catch(Exception ex)
		{
			ex.printStackTrace(); 
		}
		finally
		{
			if(session!=null)
    			session.close();
		}
		return list;
	}
	
	//�ڵ��� �˻�(����)
    public static List<CarVO> carPriceSearchData(Map map)
    {
       List<CarVO> list=new ArrayList<CarVO>();
       SqlSession session=null;
       try
       {
          session=ssf.openSession();
          list=session.selectList("carPriceSearchData",map);
       }
       catch(Exception ex)
       {
          ex.printStackTrace(); 
       }
       finally
       {
          if(session!=null)
              session.close();
       }
       return list;
    }
	
    //�ڵ��� �� �˻�(üũ�ڽ�)
    public static List<CarVO> carDetailSearchData(Map<String,String[]> arrMap)
    {
    	List<CarVO> list=new ArrayList<CarVO>();
        SqlSession session=null;
        try
        {	        	
           session=ssf.openSession();
           list=session.selectList("carDetailSearchData", arrMap);
        }
        catch(Exception ex)
        {
        	System.out.println(ex.getMessage());
           ex.printStackTrace(); 
        }
        finally
        {
           if(session!=null)
               session.close();
        }
        return list;
    }
}
 