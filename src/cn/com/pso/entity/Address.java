package cn.com.pso.entity;

public class Address {
	private int id;
	private Customer customer;
	/**常用地址的设定:1是常用地址，0为不常用地址*/
	private int defaultAddress;
	private String address;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public int getDefaultAddress() {
		return defaultAddress;
	}
	public void setDefaultAddress(int defaultAddress) {
		this.defaultAddress = defaultAddress;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	

}
