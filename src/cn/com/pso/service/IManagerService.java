package cn.com.pso.service;

import java.util.List;

import cn.com.pso.entity.Manager;
import cn.com.pso.util.PageBean;

public interface IManagerService {

	public Manager validate(Manager manager);
	
	public void addManager(Manager manager);
	public List<Manager> userList();
	
	public PageBean queryAllUser(PageBean pageBean,Manager manager);
	
	public void deleteUser(Manager manager);
	
	public void updateUser(Manager manager);
	
	public int getTotalPage();
	
	public Manager queryOne(Manager manager);
	
	public String messageCount();
}
