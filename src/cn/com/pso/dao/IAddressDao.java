package cn.com.pso.dao;
import java.util.List;

import cn.com.pso.entity.Address;

public interface IAddressDao {

	public Integer addAddress(Address address);
	
	public List<Address> listAddress(String hql);
	
	public void updateAddress(Address address);
	
	public Address loadAddress(int id);
}
