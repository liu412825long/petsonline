package cn.com.pso.test;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import cn.com.pso.entity.Test;

public class TableTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Session session = HibernateUtil.getSession();
		
		String sex = "女";
		
		int age = 30;
		
		Query query = session.createQuery("select id,name from Test");
		
		List<Test> list = query.list();
		
		for(Test u : list) {
			System.out.println(u.getName());
		}
		
		
		
		try {
			session = HibernateUtil.getSession();			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			HibernateUtil.closeSession(session);
		}
	}

}
