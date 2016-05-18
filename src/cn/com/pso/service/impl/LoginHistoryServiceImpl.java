package cn.com.pso.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;

import cn.com.pso.dao.ILoginHistoryDao;
import cn.com.pso.entity.LoginHistory;
import cn.com.pso.entity.Manager;
import cn.com.pso.service.ILoginHistoryService;
import cn.com.pso.util.PageBean;

public class LoginHistoryServiceImpl implements ILoginHistoryService {

	private ILoginHistoryDao loginHistoryDao;
	@Override
	public void addHistory(Manager manager) {
		// TODO Auto-generated method stub

		LoginHistory lh=this.getHistory(manager);
		loginHistoryDao.addHistory(lh);
	}
	
	public PageBean queryHistory(PageBean pageBean,LoginHistory history){
		if(pageBean==null){
			pageBean=new PageBean();
		}
		String hql="from LoginHistory t where t.lastLogin in (select  max(lh.lastLogin) from LoginHistory lh group by lh.manager )";
		pageBean.setPageSize(8);
		if(history!=null){
			Manager manager=history.getManager();
			if(manager!=null){
				if(manager.getUsername()!=null&&!"".equals(manager.getUsername())){
					hql=hql+" and t.manager.username like '%"+manager.getUsername()+"%'";
				}
				if(manager.getRealName()!=null&&!"".equals(manager.getRealName())){
					hql=hql+" and t.manager.realName like '%"+manager.getRealName()+"%'";
				}
			}
		}
		return loginHistoryDao.queryHistory(hql, null, pageBean);
	}
	
	public PageBean querySingleHistory(PageBean pageBean,LoginHistory history){
		if(pageBean==null){
			pageBean=new PageBean();
			pageBean.setPageSize(4);
		}
		pageBean.setCurrentPage(1);
		//这里的hql 语句中的条件必须是t.manager.id=id 而不能是t.manager=manager;否则就会出错
		String hql="from LoginHistory t where t.manager.id ="+history.getManager().getId()+" order by t.lastLogin DESC";
		return loginHistoryDao.queryHistory(hql, null, pageBean);
	}
	
	private LoginHistory getHistory(Manager manager){
		LoginHistory lh=new LoginHistory();
		lh.setManager(manager);
		lh.setLastLogin(new Date());
		return lh;
	}

	public ILoginHistoryDao getLoginHistoryDao() {
		return loginHistoryDao;
	}

	public void setLoginHistoryDao(ILoginHistoryDao loginHistoryDao) {
		this.loginHistoryDao = loginHistoryDao;
	}


	
}
