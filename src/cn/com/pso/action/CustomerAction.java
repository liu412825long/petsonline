package cn.com.pso.action;

import cn.com.pso.entity.Customer;
import cn.com.pso.service.ICustomerService;
import cn.com.pso.util.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CustomerAction extends ActionSupport {
	private ICustomerService customerService;
	private PageBean pageBean;
	private Customer customer;
	private String result;
	public String validateLogin(){
		Boolean bool=customerService.validateLogin(customer);
		if(bool){
			return "loginSuccess";
		}else{
			result="用户名或者密码不正确！！！";
			return "loginFail";
		}
	}
	public String isExist(){
		Boolean bool=customerService.isExist(customer);
		if(bool){
			result="exist";
		}else{
			result="notexist";
		}
		return "isExist";
	}
	public String queryAll(){
		pageBean=customerService.queryAll(pageBean, customer);
		return "queryAll";
	}
	
	public String addCustomer(){
		customerService.addCustomer(customer);
		return "addCustomer";
	}
	
	public String modifyCustomer(){
		customerService.modifyCustomer(customer);
		return "modifyCustomer";
	}
	
	public String queryOne(){
		customerService.queryOne(customer);
		return "queryOne";
	}
	
	public String loginOut(){
		ActionContext.getContext().getSession().remove("customer");
		return "loginOut";
		
	}
	
	public void setCustomerService(ICustomerService customerService) {
		this.customerService = customerService;
	}
	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	
	

}
