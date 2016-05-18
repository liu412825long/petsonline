package cn.com.pso.dao.impl;

import cn.com.pso.dao.IBaseDao;
import cn.com.pso.dao.IPetsDao;
import cn.com.pso.util.PageBean;

public class PetsDaoImpl implements IPetsDao {

	private IBaseDao baseDao;
	@Override
	public Integer add(Object object) {
		// TODO Auto-generated method stub
	return	baseDao.add(object);
	}
	
	public Object queryPets(Class<?> clz, Integer id){
		return baseDao.load(clz, id);
	}
	
	
	@Override
	public PageBean queryPets(String hql, Object[] objs, PageBean pageBean) {
		// TODO Auto-generated method stub
		return baseDao.page(hql, objs, pageBean);
	}
	
	public void deletePets(Class<?> clz, Integer id){
		baseDao.delete(clz, id);
	}
	
	public void updatePets(Object obj){
		baseDao.update(obj);
	}


	public IBaseDao getBaseDao() {
		return baseDao;
	}
	public void setBaseDao(IBaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
	

}
