package cn.com.pso.dao.impl;

import java.util.List;

import cn.com.pso.dao.IBaseDao;
import cn.com.pso.dao.IManagerDao;
import cn.com.pso.entity.Manager;
import cn.com.pso.util.PageBean;

public class ManagerDao implements IManagerDao {

	private IBaseDao<Manager> baseDao;

	@Override
	public List<Manager> validate(String hql,Object[] objs) {
		// TODO Auto-generated method stub
		return baseDao.list(hql, objs);
	}
	
	public Integer addManager(Manager manager){
		return baseDao.add(manager);
	} 
	
	public List<Manager> userList(String hql,Object[] objs ){
		return baseDao.list(hql, objs);
	}

	public PageBean queryAllUser(String hql,Object[] objs,PageBean pageBean){
		return baseDao.page(hql, objs, pageBean);
	}
	
	public void deleteUser(int id){
		baseDao.delete(Manager.class, id);
	}
	public Manager queryOne(Manager manager){
		return (Manager)baseDao.load(Manager.class, manager.getId());
	}
	
	public void updateUser(Manager manager){
		baseDao.update(manager);
	}
	
	public int getTotalPage(String hql,int pageSize){
		return baseDao.getTotalPage(hql, pageSize);
	}
	public IBaseDao<Manager> getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(IBaseDao<Manager> baseDao) {
		this.baseDao = baseDao;
	}
	
	

}
