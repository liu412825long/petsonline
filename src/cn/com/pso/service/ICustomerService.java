package cn.com.pso.service;

import cn.com.pso.entity.Customer;
import cn.com.pso.util.PageBean;

public interface ICustomerService {

	public void addCustomer(Customer customer);
	public void modifyCustomer(Customer customer);
	public Customer queryOne(Customer customer);
	public PageBean queryAll(PageBean pageBean ,Customer customer);
	public boolean validateLogin(Customer customer);
	public boolean isExist(Customer customer);
}
