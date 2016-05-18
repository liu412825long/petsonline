package cn.com.pso.service.impl;

import java.util.List;

import cn.com.pso.dao.IAddressDao;
import cn.com.pso.entity.Address;
import cn.com.pso.entity.Customer;
import cn.com.pso.service.IAddressService;

import com.opensymphony.xwork2.ActionContext;

public class AddressServiceImpl implements IAddressService {

	private IAddressDao addressDao;
	@Override
	public void addAddress(Address address) {
		// TODO Auto-generated method stub
		Address defaultAddress=this.defaultAddress(address);
		if(defaultAddress!=null){
			defaultAddress.setDefaultAddress(0);
			addressDao.updateAddress(defaultAddress);
		}
		addressDao.addAddress(address);
	}
	public List<Address> listAddress(Address address){
		String hql="from Address A where A.customer.id="+address.getCustomer().getId();
		return addressDao.listAddress(hql);
	}
	
	public Address defaultAddress(Address address){
		Customer customer=(Customer)ActionContext.getContext().getSession().get("customer");
		if(customer==null){
			return null;
		}
		String hql="from Address A where A.defaultAddress=1 and  A.customer.id="+customer.getId();
		List<Address> list= addressDao.listAddress(hql);
		if(list==null||list.size()==0){
			return null;
		}else{
			return list.get(0);
		}
	}
	
	public void updateAddress(Address address){
		addressDao.updateAddress(address);
	}
	
	public Address loadAddress(int id){
		return addressDao.loadAddress(id);
	}
	public IAddressDao getAddressDao() {
		return addressDao;
	}
	public void setAddressDao(IAddressDao addressDao) {
		this.addressDao = addressDao;
	}
	
	

}
