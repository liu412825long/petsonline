package cn.com.pso.dao.impl;

import java.util.List;

import cn.com.pso.dao.IAddressDao;
import cn.com.pso.dao.IBaseDao;
import cn.com.pso.entity.Address;

public class AddressDaoImpl implements IAddressDao {

	private IBaseDao baseDao;
	@Override
	public Integer addAddress(Address address) {
		// TODO Auto-generated method stub
		return baseDao.add(address);
	}
	
	public List<Address> listAddress(String hql){
		return (List<Address>)baseDao.list(hql);
	}
	
	public void updateAddress(Address address){
		baseDao.update(address);
	}
	
	public Address loadAddress(int id){
		return (Address)baseDao.load(Address.class, id);
	}
	public IBaseDao getBaseDao() {
		return baseDao;
	}
	public void setBaseDao(IBaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
	

}
