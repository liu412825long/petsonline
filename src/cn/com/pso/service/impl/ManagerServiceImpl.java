package cn.com.pso.service.impl;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;

import cn.com.pso.dao.IManagerDao;
import cn.com.pso.entity.Manager;
import cn.com.pso.service.IManagerService;
import cn.com.pso.util.PageBean;

public class ManagerServiceImpl implements IManagerService {

	private IManagerDao managerDao;
	/**
	 * 後台登錄的驗證，要驗證的信息用戶名，密碼，角色權限
	 * 驗證通過返回TRUE,否則返回FALSE
	 * **/
	@Override
	public Manager validate(Manager manager) {

		String hql="from Manager where username=? and password=? and authorityRank=?";
		Object[] objs=new Object[]{manager.getUsername(),manager.getPassword(),manager.getAuthorityRank()};
		List<Manager> managerList=managerDao.validate(hql,objs);
		if(managerList!=null && managerList.size()>0)
		{
			Manager managerResult=managerList.get(0);
			messageCount();
			ActionContext.getContext().getSession().put("admin", managerResult);
			return managerList.get(0); 
		}else{
			return null;
		}
	}
	
	public  String messageCount(){
		String hql="from ShopCar sc where sc.status='未发货'";
		List<Manager> list=managerDao.userList(hql, null);
		return list.size()+"";
	}
	
	public void addManager(Manager manager){
		managerDao.addManager(manager);
	}
	public List<Manager> userList(){
		String hql="from Manager m where m.authorityRank=?";
		Object[] objs=new Object[]{0};
		return managerDao.userList(hql, objs);
	}
	
	public PageBean queryAllUser(PageBean pageBean ,Manager manager){
		if(pageBean==null){
			pageBean=new PageBean();
		}
		pageBean.setPageSize(6);
		String hql="from Manager m where m.authorityRank=0";
		if(manager!=null){
			if(manager.getUsername()!=null&&!manager.getUsername().equals("")){
				hql=hql+" and m.username like '%"+manager.getUsername()+"%'";
			}
			if(manager.getRealName()!=null&&!manager.getRealName().equals("")){
				hql=hql+" and m.realName like '%"+manager.getRealName()+"%'";
			}
			if(manager.getSex()!=null&&!manager.getSex().equals("")){
				hql=hql+" and m.sex ='"+manager.getSex()+"'";
			}
		}
		hql=hql+" order by m.id";
		return managerDao.queryAllUser(hql, null, pageBean);
	}
	
	public void deleteUser(Manager manager){
		managerDao.deleteUser(manager.getId());
	}
	
	public Manager queryOne(Manager manager){
		return managerDao.queryOne(manager);
	}
	
	public void updateUser(Manager manager){
		managerDao.updateUser(manager);
	}
	
	public int getTotalPage(){
		String hql="from Manager m where m.authorityRank=0";
		return managerDao.getTotalPage(hql, 6);
	}
	
	public IManagerDao getManagerDao() {
		return managerDao;
	}
	public void setManagerDao(IManagerDao managerDao) {
		this.managerDao = managerDao;
	}
	
	

}
