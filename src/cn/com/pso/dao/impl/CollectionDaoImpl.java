package cn.com.pso.dao.impl;

import java.util.List;

import cn.com.pso.dao.IBaseDao;
import cn.com.pso.dao.ICollectionDao;
import cn.com.pso.entity.Collection;
import cn.com.pso.util.PageBean;

public class CollectionDaoImpl implements ICollectionDao {

	private IBaseDao baseDao;
	@Override
	public Integer addCollection(Collection collection) {
		// TODO Auto-generated method stub
		return baseDao.add(collection);
	}
	public PageBean queryAll(String hql,Object[] objs,PageBean pageBean){
		return baseDao.page(hql, objs, pageBean);
	}
	
	public List<Collection> validateCollection(String hql){
		return baseDao.list(hql);
	}
	
	public void deleteCollection(int id){
		baseDao.delete(Collection.class, id);
	}
	public IBaseDao getBaseDao() {
		return baseDao;
	}
	public void setBaseDao(IBaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
	

}
