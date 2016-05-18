package cn.com.pso.service;

import java.util.List;

import cn.com.pso.entity.Address;

public interface IAddressService {
	public void addAddress(Address address);
	
	public List<Address> listAddress(Address address);
	public Address defaultAddress(Address address);
	public Address loadAddress(int id);
	
	public void updateAddress(Address address);

}
