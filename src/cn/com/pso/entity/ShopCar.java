package cn.com.pso.entity;

import java.util.Date;

public class ShopCar {
	/**编号*/
	private int id;
	/**订单编号*/
	private long orderId;
	
	/**宠物类型：狗*/
	private String tableName;
	/**宠物编号*/
	private int petsId;
	/**客户*/
	private Customer customer;
	/**订单日期*/
	private Date orderDate;
	/**数量*/
	private int orderCount=1;
	/**订单状态：未发货，已发货，已收货 */
	private String status;
	/**订单地址*/
	private String address;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public int getPetsId() {
		return petsId;
	}
	public void setPetsId(int petsId) {
		this.petsId = petsId;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public long getOrderId() {
		return new Date().getTime();
	}
	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}
	
	
}
