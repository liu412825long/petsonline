package cn.com.pso.dao.impl;

import cn.com.pso.dao.IBaseDao;
import cn.com.pso.dao.IShopCarDao;
import cn.com.pso.entity.ShopCar;
import cn.com.pso.util.PageBean;

public class ShopCarDaoImpl implements IShopCarDao {

	private IBaseDao baseDao;
	@Override
	public Integer addOrder(ShopCar shopCar) {
		// TODO Auto-generated method stub
		return baseDao.add(shopCar);
	}
	
	public PageBean queryAll(String hql,Object[] objs,PageBean pageBean){
		return baseDao.page(hql, objs, pageBean);
	}
	
	public void updateOrder(ShopCar shopCar){
		baseDao.update(shopCar);
	}
	
	public ShopCar queryOne(int id){
		return (ShopCar)baseDao.load(ShopCar.class, id);
	}
	public IBaseDao getBaseDao() {
		return baseDao;
	}
	public void setBaseDao(IBaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
	

}
