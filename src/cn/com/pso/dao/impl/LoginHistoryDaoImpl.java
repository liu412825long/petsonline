package cn.com.pso.dao.impl;

import cn.com.pso.dao.IBaseDao;
import cn.com.pso.dao.ILoginHistoryDao;
import cn.com.pso.entity.LoginHistory;
import cn.com.pso.util.PageBean;

public class LoginHistoryDaoImpl implements ILoginHistoryDao {

	private IBaseDao baseDao;
	@Override
	public Integer addHistory(LoginHistory history) {
		// TODO Auto-generated method stub
		return baseDao.add(history);
	}
	
	public PageBean queryHistory(String hql,Object[] objs,PageBean pageBean){
		return baseDao.page(hql, objs, pageBean);
	}
	
	public PageBean querySingleHistory(String hql,Object[] objs,PageBean pageBean){
		return baseDao.page(hql, objs, pageBean);
	}
	public IBaseDao getBaseDao() {
		return baseDao;
	}
	public void setBaseDao(IBaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
	

}
