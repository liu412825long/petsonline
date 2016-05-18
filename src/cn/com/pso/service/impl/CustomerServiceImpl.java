package cn.com.pso.service.impl;

import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;

import cn.com.pso.dao.ICustomerDao;
import cn.com.pso.entity.Customer;
import cn.com.pso.service.ICustomerService;
import cn.com.pso.util.PageBean;

public class CustomerServiceImpl implements ICustomerService {

	private ICustomerDao customerDao;
	@Override
	public PageBean queryAll(PageBean pageBean, Customer customer) {
		// TODO Auto-generated method stub
		if(pageBean ==null){
			pageBean =new PageBean();
			pageBean.setPageSize(6);
		}
		String hql="from Customer c";
		return customerDao.queryAll(hql, null, pageBean);
	}
	public void addCustomer(Customer customer){
		customer.setRegistDate(new Date());
		int id=customerDao.addCustomer(customer);
		customer.setId(id);
		ActionContext.getContext().getSession().put("customer", customer);
	}
	public void modifyCustomer(Customer customer){
		customerDao.modifyCustomer(customer);
	}
	public Customer queryOne(Customer customer){
		if(customer.getId()!=0){
			return customerDao.queryOne(customer.getId());
		}else{
			return null;
		}
	}
	
	public boolean validateLogin(Customer customer){
		String hql="from Customer C where C.userName='"+customer.getUserName()+"' and C.password='"+customer.getPassword()+"'";
		List<Customer> listResult=customerDao.validateLogin(hql, null);
		if(listResult!=null&&listResult.size()>0){
			Customer resultCustomer=listResult.get(0);
			ActionContext.getContext().getSession().put("customer", resultCustomer);
			return true;
		}else{
			return false;
		}
	}
	public boolean isExist(Customer customer){
		String hql="from Customer C where C.userName='"+customer.getUserName()+"'";
		List<Customer> listResult=customerDao.validateLogin(hql, null);
		if(listResult!=null&&listResult.size()>0){
			return true;
		}else{
			return false;
		}
	}
	
	public ICustomerDao getCustomerDao() {
		return customerDao;
	}
	public void setCustomerDao(ICustomerDao customerDao) {
		this.customerDao = customerDao;
	}
	
	

}
