package cn.com.pso.dao.impl;

import java.util.List;

import cn.com.pso.dao.IBaseDao;
import cn.com.pso.dao.ICustomerDao;
import cn.com.pso.entity.Customer;
import cn.com.pso.util.PageBean;

public class CustomerDaoImpl implements ICustomerDao {

	private IBaseDao baseDao;
	@Override
	public PageBean queryAll(String hql, Object[] objs, PageBean pageBean) {
		// TODO Auto-generated method stub
		return baseDao.page(hql, objs, pageBean);
	}
	
	public Integer addCustomer(Customer customer ){
		return baseDao.add(customer);
	}
	
	public void modifyCustomer(Customer customer){
		baseDao.update(customer);
	}
	
	public Customer queryOne(int id){
		return (Customer)baseDao.load(Customer.class, id);
	}
	
	public List<Customer> validateLogin(String hql,Object[] objs){
		return baseDao.list(hql, objs);
	}
	public IBaseDao getBaseDao() {
		return baseDao;
	}
	public void setBaseDao(IBaseDao baseDao) {
		this.baseDao = baseDao;
	}
	

}
