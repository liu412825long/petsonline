package cn.com.pso.dao;

import java.util.List;

import cn.com.pso.entity.Manager;
import cn.com.pso.util.PageBean;

public interface IManagerDao{

	public List<Manager> validate(String hql,Object[] objs);
	
	public Integer addManager(Manager manager);
	
	public List<Manager> userList(String hql,Object[] objs);
	
	public PageBean queryAllUser(String hql,Object[] objs ,PageBean pageBean );
	
	public void deleteUser(int id);
	
	public void updateUser(Manager manager);
	
	public int getTotalPage(String hql,int pageSize);
	
	public Manager queryOne(Manager manager);
}
