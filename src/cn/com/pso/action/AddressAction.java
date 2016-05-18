package cn.com.pso.action;

import java.util.List;

import cn.com.pso.entity.Address;
import cn.com.pso.service.IAddressService;

import com.opensymphony.xwork2.ActionSupport;

public class AddressAction extends ActionSupport {
	private IAddressService addressService;
	private Address address;
	private List<Address> addressList;
	private int oldAddress;
	private int newAddress;
	private String result;
	
	public String addAddress(){
		addressService.addAddress(address);
		result="addSuccess";
		return "addAddress";
	}
	public String queryAllAddress(){
		addressList=addressService.listAddress(address);
		return "queryAllAddress";
	}
	
	public String modifyDefaultAddress(){
		Address addressOld=addressService.loadAddress(oldAddress);
		Address addressNew=addressService.loadAddress(newAddress);
		addressOld.setDefaultAddress(0);
		addressNew.setDefaultAddress(1);
		addressService.updateAddress(addressOld);
		addressService.updateAddress(addressNew);
		result="modifySuccess";
		return "modifyDefaultAddress";
	}
	public IAddressService getAddressService() {
		return addressService;
	}
	public void setAddressService(IAddressService addressService) {
		this.addressService = addressService;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public List<Address> getAddressList() {
		return addressList;
	}
	public void setAddressList(List<Address> addressList) {
		this.addressList = addressList;
	}
	public int getOldAddress() {
		return oldAddress;
	}
	public void setOldAddress(int oldAddress) {
		this.oldAddress = oldAddress;
	}
	public int getNewAddress() {
		return newAddress;
	}
	public void setNewAddress(int newAddress) {
		this.newAddress = newAddress;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	
	
	
	

}
