package cn.com.pso.action;

import cn.com.pso.entity.Dog;
import cn.com.pso.entity.ShopCar;
import cn.com.pso.service.IPetsService;
import cn.com.pso.service.IShopCarService;
import cn.com.pso.util.PageBean;

import com.opensymphony.xwork2.ActionSupport;

public class ShopCarAction extends ActionSupport {
	private IShopCarService shopCarService;
	private IPetsService petsService;
	private ShopCar shopCar;
	private PageBean pageBean;
	private Dog dog;
	private String startDate;
	private String endDate;
	private String toJsp;
	
	public String addOrder(){
		shopCarService.addOrder(shopCar);
		Dog dog=(Dog)petsService.queryPet(this.dog);
		dog.setCount(dog.getCount()-1);
		petsService.updatePets(dog);
		return "addOrder";
	}
	
	public String queryAll(){
		pageBean=shopCarService.queryAll(pageBean, shopCar);
		return "queryAll";
	}
	
	public String queryAllHou(){
 		pageBean=shopCarService.queryAllToHou(pageBean, shopCar, dog,startDate,endDate);
		return "queryAllHou";
		
	}
	
	public String updateOrder(){
		String status=shopCar.getStatus();
		shopCar=shopCarService.queryOne(shopCar);
		if(status.equals("1")){
			shopCar.setStatus("已发货");
		}else{
			shopCar.setStatus("已收货");
		}
		shopCarService.updateOrder(shopCar);
		return "updateOrder";
	}
	
	public String toComment(){
		return "toComment";
	}
	public IShopCarService getShopCarService() {
		return shopCarService;
	}
	public void setShopCarService(IShopCarService shopCarService) {
		this.shopCarService = shopCarService;
	}

	public ShopCar getShopCar() {
		return shopCar;
	}
	public void setShopCar(ShopCar shopCar) {
		this.shopCar = shopCar;
	}
	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public Dog getDog() {
		return dog;
	}

	public void setDog(Dog dog) {
		this.dog = dog;
	}

	public IPetsService getPetsService() {
		return petsService;
	}

	public void setPetsService(IPetsService petsService) {
		this.petsService = petsService;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getToJsp() {
		return toJsp;
	}

	public void setToJsp(String toJsp) {
		this.toJsp = toJsp;
	}
	
	
	
	
	
	

}
