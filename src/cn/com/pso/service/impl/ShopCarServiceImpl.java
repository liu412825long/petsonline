package cn.com.pso.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import cn.com.pso.dao.IShopCarDao;
import cn.com.pso.entity.Dog;
import cn.com.pso.entity.ShopCar;
import cn.com.pso.service.IShopCarService;
import cn.com.pso.util.PageBean;

public class ShopCarServiceImpl implements IShopCarService {

	private IShopCarDao shopCarDao;
	@Override
	public void addOrder(ShopCar shopCar) {
		// TODO Auto-generated method stub
		shopCar.setOrderDate(new Date());
		shopCarDao.addOrder(shopCar);
	}
	public PageBean queryAll(PageBean pageBean,ShopCar shopCar){
		String hql="from ShopCar S,Dog D where S.petsId=D.id and  S.customer.id="+shopCar.getCustomer().getId();
		if(pageBean==null){
			pageBean=new PageBean();
			pageBean.setPageSize(3);
		}
		if(pageBean.getCurrentPage()!=null&&pageBean.getTotalPage()!=null){
			if(pageBean.getCurrentPage()<=1){
				pageBean.setCurrentPage(1);
			}else if(pageBean.getCurrentPage()>=pageBean.getTotalPage()){
				pageBean.setCurrentPage(pageBean.getTotalPage());
			}
			
		}
		return shopCarDao.queryAll(hql, null, pageBean);
	}
	public PageBean queryAllToHou(PageBean pageBean,ShopCar shopCar,Dog dog,String startDate,String endDate){
		String hql="from ShopCar S,Dog D where S.petsId=D.id ";
		if(pageBean==null){
			pageBean=new PageBean();
			pageBean.setPageSize(6);
		}
		if(pageBean.getCurrentPage()!=null&&pageBean.getTotalPage()!=null){
			if(pageBean.getCurrentPage()<=1){
				pageBean.setCurrentPage(1);
			}else if(pageBean.getCurrentPage()>=pageBean.getTotalPage()){
				pageBean.setCurrentPage(pageBean.getTotalPage());
			}
		}
		if(shopCar!=null){
			if(shopCar.getStatus()!=null&&!shopCar.getStatus().equals("")){
				hql=hql+" and S.status='"+shopCar.getStatus()+"'";
			}
		}
		//这里的日期类型的比较，需要将其转化成oracle 的日期之后才能比较
		if(startDate!=null&&!startDate.equals("")){
			hql=hql+" and S.orderDate >to_date('"+startDate+"','yyyy-mm-dd')";
		}
		if(endDate!=null&&!endDate.equals("")){
			hql=hql+" and S.orderDate <to_date('"+endDate+"','yyyy-mm-dd')";
		}
		return shopCarDao.queryAll(hql, null, pageBean);
	}
	public void updateOrder(ShopCar shopCar){
		shopCarDao.updateOrder(shopCar);
	}
	
	public ShopCar queryOne(ShopCar shopCar){
		if(shopCar!=null){
			return shopCarDao.queryOne(shopCar.getId());
		}else{
			return null;
		}
	}
	public IShopCarDao getShopCarDao() {
		return shopCarDao;
	}
	public void setShopCarDao(IShopCarDao shopCarDao) {
		this.shopCarDao = shopCarDao;
	}
	
	

}
