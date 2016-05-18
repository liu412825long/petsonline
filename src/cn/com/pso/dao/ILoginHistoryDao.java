package cn.com.pso.dao;

import cn.com.pso.entity.LoginHistory;
import cn.com.pso.util.PageBean;

public interface ILoginHistoryDao {
	
	public Integer addHistory(LoginHistory history);
	
	public PageBean queryHistory(String hql,Object[] objs,PageBean pageBean);
	
	public PageBean querySingleHistory(String hql,Object[] objs,PageBean pageBean);

}
