package cn.com.pso.action;

import java.util.List;

import cn.com.pso.entity.LoginHistory;
import cn.com.pso.service.ILoginHistoryService;
import cn.com.pso.util.PageBean;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 用户历史记录Action
 * @author HaiLong
 *
 */
public class HistoryAction extends ActionSupport {

	/**登录记录的Service*/
	private ILoginHistoryService loginHistoryService;
	/**分页用的PageBean*/
	private PageBean pageBean;
	/**历史记录的实体Bean*/
	private LoginHistory loginHistory;
	/**历史记录的实体List*/
	private List<LoginHistory> historyList;
	/**用于页面与Action之间传递值得标志*/
	private String resultFlg;
	
	
	/**
	 * 分页的形式查询历史记录，查询的结果是相同的用户进行分组查询。
	 * 时间：2016-4-22
	 * @param $
	 * @return  String
	 * 
	 */
	public String queryHistory(){
		pageBean=loginHistoryService.queryHistory(pageBean, loginHistory);
		return "queryHistory";
		
	}
	/**
	 * 查询一个用户的历史记录
	 * 时间：2016-4-22
	 * @param $
	 * @return  String
	 * 
	 */
	public String querySingleHistory(){
		pageBean =loginHistoryService.querySingleHistory(pageBean, loginHistory);
		return "querySingleHistory";
	}
	
	/*
	 * 以下是Action属性的Getter 和 Setter 方法
	 * */
	public ILoginHistoryService getLoginHistoryService() {
		return loginHistoryService;
	}
	public void setLoginHistoryService(ILoginHistoryService loginHistoryService) {
		this.loginHistoryService = loginHistoryService;
	}
	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	public LoginHistory getLoginHistory() {
		return loginHistory;
	}
	public void setLoginHistory(LoginHistory loginHistory) {
		this.loginHistory = loginHistory;
	}
	public List<LoginHistory> getHistoryList() {
		return historyList;
	}
	public void setHistoryList(List<LoginHistory> historyList) {
		this.historyList = historyList;
	}
	public String getResultFlg() {
		return resultFlg;
	}
	public void setResultFlg(String resultFlg) {
		this.resultFlg = resultFlg;
	}
	
	
	
	
	
}
