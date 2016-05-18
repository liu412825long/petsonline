package cn.com.pso.dao.impl;

import java.util.List;

import cn.com.pso.dao.IBaseDao;
import cn.com.pso.dao.IPictureDao;
import cn.com.pso.entity.Pictures;

public class PictureDaoImpl implements IPictureDao {

	private IBaseDao baseDao;
	@Override
	public void add(Pictures pictures) {
		// TODO Auto-generated method stub
		baseDao.add(pictures);
	}
	
	public void deletePicture(int id){
		baseDao.delete(Pictures.class, id);
	}
	
	@Override
	public Pictures queryOne(Pictures picture) {
		// TODO Auto-generated method stub
		return (Pictures)baseDao.load(Pictures.class, picture.getId());
	}
	public List<Pictures> pictureList(String hql,Object[] objs){
		return baseDao.list(hql, objs);
	}


	public IBaseDao getBaseDao() {
		return baseDao;
	}
	public void setBaseDao(IBaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
	

}
