package cn.com.pso.action;

import java.util.List;

import cn.com.pso.entity.Manager;
import cn.com.pso.service.ILoginHistoryService;
import cn.com.pso.service.IManagerService;
import cn.com.pso.util.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * ManagerAction 处理有关Manager表的所有请求
 * @author 海龙
 *
 */
public class ManagerAction extends ActionSupport {

	private static final long serialVersionUID = 7196885245618220065L;
	
	/** 创建一个实体类对象*/
	private Manager manager;
	/** 声明 managerService */
	private IManagerService managerService;
	private ILoginHistoryService loginHistoryService;
	/** 存储将要跳转的JSP的路径目录 或 存储提示信息 */
	private String toFolder;
	/** 存储将要跳转的JSP页面 */
	private String toJsp;
	private List<Manager> list;
	private String resultFlg;
	private String jsp;
	
	
	private PageBean pageBean;
	
	/**
	 * 验证后台管理员和普通用户
	 * @return
	 */
	public String validateLogin()
	{
		Manager managerResult=managerService.validate(manager);
		if(managerResult!=null)
		{
			loginHistoryService.addHistory(managerResult);
			manager=null;
			return 	SUCCESS;
		}else{
			toFolder="用户名或密码不正确";
			manager=null;
			return 	ERROR;
		}
	}
	
	public String getMessage(){
		jsp=managerService.messageCount();
		return "getMessage";
	}
	
	/**
	 * 添加普通用户
	 * 时间：2016-4-22
	 * @param $
	 * @return  String
	 * 
	 */
	public String add(){
		managerService.addManager(manager);
		resultFlg="addSuccess";
		manager=null;
		return "add";
	}
	
	/**
	 * 
	 * 时间：2016-4-22
	 * @param $
	 * @return  String
	 * 
	 */
	public String userList(){
		list=managerService.userList();
		return "userList";
	}
	
	/**
	 * 以分页的形式查询所有的普通用户
	 * 时间：2016-4-22
	 * @param $
	 * @return  String
	 * 
	 */
	public String queryAll(){
		int totalPage=managerService.getTotalPage();
		if(pageBean!=null){
			if(resultFlg.equals("addSuccess")){
				pageBean.setCurrentPage(totalPage);
			}else if(resultFlg.equals("deleteSuccess")){
				if(pageBean.getCurrentPage()>=totalPage){
					pageBean.setCurrentPage(totalPage);
				}
			}
			
		}
		pageBean =managerService.queryAllUser(pageBean, manager);
		return "queryAll";
	}
	
	/**
	 * 删除普通用户
	 * 时间：2016-4-22
	 * @param $
	 * @return  String
	 * 
	 */
	public String deleteUser(){
		managerService.deleteUser(manager);
		resultFlg="deleteSuccess";
		return "deleteUser";
	}
	/**
	 * 修改普通用户的信息
	 * 时间：2016-4-22
	 * @param $
	 * @return  String
	 * 
	 */
	public String updateUser(){
		managerService.updateUser(manager);
		if(resultFlg!=null&&resultFlg.equals("admin")){
			resultFlg="updateSuccess";
			toJsp="queryAllmanagerAction";
		}
		if(resultFlg!=null&&resultFlg.equals("self")){
			resultFlg="query";
			toJsp="queryDetailmanagerAction";
		}
		return "updateUser";
	}
	
	/**
	 * 查询一位普通用户的所有信息，用于修改之前的查询
	 * 时间：2016-4-22
	 * @param $
	 * @return  String
	 * 
	 */
	public String queryOne(){
		manager=managerService.queryOne(manager);
		return "queryOne";
	}
	
	public String queryDetail(){
		manager=managerService.queryOne(manager);
		if(resultFlg!=null&&resultFlg.equals("query")){
			toJsp="user_detailInfo.jsp";
		}
		if(resultFlg!=null&&resultFlg.equals("update")){
			toJsp="user_updateInfo.jsp";
		}
		return "queryDetail";
	}
	
	public String updatePassword(){
		String password=manager.getPassword();
		manager=managerService.queryOne(manager);
		manager.setPassword(password);
		managerService.updateUser(manager);
		resultFlg="passwordSuccess";
		return "updatePassword";
	}
	
	public String loginOut(){
		ActionContext.getContext().getSession().remove("admin");
		return "loginOut";
	}
	
	public String beforeUpdatePass(){
		resultFlg="";
		return "beforeUpdatePass";
		}


	/*
	 * 以下 是属性的Getter 和 Setter 方法。
	 * */
	public Manager getManager() {
		return manager;
	}


	public void setManager(Manager manager) {
		this.manager = manager;
	}


	public void setManagerService(IManagerService managerService) {
		this.managerService = managerService;
	}


	public String getToFolder() {
		return toFolder;
	}


	public void setToFolder(String toFolder) {
		this.toFolder = toFolder;
	}


	public String getToJsp() {
		return toJsp;
	}


	public void setToJsp(String toJsp) {
		this.toJsp = toJsp;
	}

	public List<Manager> getList() {
		return list;
	}

	public void setList(List<Manager> list) {
		this.list = list;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public String getResultFlg() {
		return resultFlg;
	}

	public void setResultFlg(String resultFlg) {
		this.resultFlg = resultFlg;
	}

	public ILoginHistoryService getLoginHistoryService() {
		return loginHistoryService;
	}

	public void setLoginHistoryService(ILoginHistoryService loginHistoryService) {
		this.loginHistoryService = loginHistoryService;
	}

	public String getJsp() {
		return jsp;
	}

	public void setJsp(String jsp) {
		this.jsp = jsp;
	}
	
	
	
	
	
	

	
}
