package cn.com.pso.service;
import cn.com.pso.entity.LoginHistory;
import cn.com.pso.entity.Manager;
import cn.com.pso.util.PageBean;

public interface ILoginHistoryService {
	public void addHistory(Manager manager);
	
	public PageBean queryHistory(PageBean pageBean,LoginHistory history);
	
	public PageBean querySingleHistory(PageBean pageBean,LoginHistory history);

}
