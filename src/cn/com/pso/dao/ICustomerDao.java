package cn.com.pso.dao;

import java.util.List;

import cn.com.pso.entity.Customer;
import cn.com.pso.util.PageBean;

public interface ICustomerDao {
	public Integer addCustomer(Customer customer);
	
	public void modifyCustomer(Customer customer);
	
	public Customer queryOne(int id);
	public PageBean queryAll(String hql,Object[] objs,PageBean pageBean );
	
	public List<Customer> validateLogin(String hql,Object[] objs);
	

}
