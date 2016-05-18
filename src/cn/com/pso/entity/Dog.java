package cn.com.pso.entity;

public class Dog {
	/**编号*/
	private int id;
	/**外键关联的类型编号*/
	private PetsType petsType;
	/**体型*/
	private String shape;
	/**性别*/
	private String sex;
	/**寿命*/
	private int life;
	/**身高*/
	private int height;
	/**体重*/
	private int width;
	/**毛长*/
	private String woolLength;
	/**颜色*/
	private String color;
	
	/**售价*/
	private float salePrice;
	/**库存*/
	private int count;
	/**宠物介绍*/
	private String describe;
	
	private String defaultPicture;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public PetsType getPetsType() {
		return petsType;
	}
	public void setPetsType(PetsType petsType) {
		this.petsType = petsType;
	}
	public String getShape() {
		return shape;
	}
	public void setShape(String shape) {
		this.shape = shape;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getLife() {
		return life;
	}
	public void setLife(int life) {
		this.life = life;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getWidth() {
		return width;
	}
	public void setWidth(int width) {
		this.width = width;
	}
	public String getWoolLength() {
		return woolLength;
	}
	public void setWoolLength(String woolLength) {
		this.woolLength = woolLength;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public float getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(float salePrice) {
		this.salePrice = salePrice;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public String getDefaultPicture() {
		return defaultPicture;
	}
	public void setDefaultPicture(String defaultPicture) {
		this.defaultPicture = defaultPicture;
	}
	
	
	

}
