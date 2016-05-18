package cn.com.pso.entity;

public class PetsType {
	
	private int id;
	private String bigType;
	private String smallType;
	private String home;
	private String typeIntroduce;
	private String status="1";
	private String rowId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBigType() {
		return bigType;
	}
	public void setBigType(String bigType) {
		this.bigType = bigType;
	}
	public String getSmallType() {
		return smallType;
	}
	public void setSmallType(String smallType) {
		this.smallType = smallType;
	}
	public String getHome() {
		return home;
	}
	public void setHome(String home) {
		this.home = home;
	}
	public String getTypeIntroduce() {
		return typeIntroduce;
	}
	public void setTypeIntroduce(String typeIntroduce) {
		this.typeIntroduce = typeIntroduce;
	}
	public String getRowId() {
		return rowId;
	}
	public void setRowId(String rowId) {
		this.rowId = rowId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	

	
}
