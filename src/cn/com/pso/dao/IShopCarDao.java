package cn.com.pso.dao;

import cn.com.pso.entity.ShopCar;
import cn.com.pso.util.PageBean;

public interface IShopCarDao {
	
	public Integer addOrder(ShopCar shopCar);
	
	public PageBean queryAll(String hql,Object[] objs,PageBean pageBean);
	
	public void updateOrder(ShopCar shopCar);
	
	public ShopCar queryOne(int id);

}
