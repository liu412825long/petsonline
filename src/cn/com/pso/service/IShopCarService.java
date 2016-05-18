package cn.com.pso.service;

import cn.com.pso.entity.Dog;
import cn.com.pso.entity.ShopCar;
import cn.com.pso.util.PageBean;

public interface IShopCarService {
	public void addOrder(ShopCar shopCar);
	
	public PageBean queryAll(PageBean pageBean,ShopCar shopCar);
	
	public PageBean queryAllToHou(PageBean pageBean,ShopCar shopCar,Dog dog,String startDate,String endDate);

	public void updateOrder(ShopCar shopCar);
	
	public ShopCar queryOne(ShopCar shopCar);
}
