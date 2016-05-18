package cn.com.pso.action;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test {

	/**
	 * 时间：2016-4-4
	 * @param $
	 * @return  void
	 * 
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext context = new ClassPathXmlApplicationContext("bean.xml");
		System.out.println(context.getBean("sessionFactory"));
	}

}
