package cn.com.pso.service.impl;

import java.util.List;

import cn.com.pso.dao.ICollectionDao;
import cn.com.pso.entity.Collection;
import cn.com.pso.service.ICollectionService;
import cn.com.pso.util.PageBean;

public class CollectionServiceImpl implements ICollectionService {

	private ICollectionDao collectionDao;
	@Override
	public void addCollection(Collection collection) {
		// TODO Auto-generated method stub
		collectionDao.addCollection(collection);
	}
	
	public PageBean queryAll(PageBean pageBean,Collection collection){
		String hql="from Collection c,Dog d where c.petsId=d.id and c.customer.id="+collection.getCustomer().getId();
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
		return collectionDao.queryAll(hql, null, pageBean);
	}
	
	public List<Collection> validateCollection(Collection collection){
		String hql="from Collection c where c.petsId="+collection.getPetsId()+" and c.customer.id="+collection.getCustomer().getId();
		return collectionDao.validateCollection(hql);
	}
	
	public void deleteCollection(Collection collection){
		if(collection!=null){
			collectionDao.deleteCollection(collection.getId());
		}
	}
	public ICollectionDao getCollectionDao() {
		return collectionDao;
	}
	public void setCollectionDao(ICollectionDao collectionDao) {
		this.collectionDao = collectionDao;
	}
	
	

}
