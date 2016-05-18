package cn.com.pso.action;

import com.opensymphony.xwork2.ActionSupport;

/** 切换语言的Action
 * @author 海龙
 *
 */
public class ChangeLanguage extends ActionSupport {

	private static final long serialVersionUID = 4234171565575806353L;
	private String currentPage;
	@Override
	public String execute(){
		// TODO Auto-generated method stub
		return SUCCESS;
	}
	/**
	 * 时间：2016-3-16
	 * @param $
	 * @return  String
	 * 
	 */
	public String getCurrentPage() {
		return currentPage;
	}
	/**
	 * 时间：2016-3-16
	 * @param $
	 * @return  void
	 * 
	 */
	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}
	

}
