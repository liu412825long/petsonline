package cn.com.pso.entity;
public class Collection {
	/**订单编号*/
	private int id;
	/**宠物类型：狗*/
	private String tableName;
	/**宠物编号*/
	private int petsId;
	/**客户*/
	private Customer customer;
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
	
}
