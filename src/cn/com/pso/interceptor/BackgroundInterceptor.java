package cn.com.pso.interceptor;

import java.util.ArrayList;
import java.util.List;

import cn.com.pso.entity.Customer;
import cn.com.pso.entity.Manager;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class BackgroundInterceptor implements Interceptor {

	private String packageName="cn.com.pso.action.";
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void init() {
	}

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		System.out.println("访问的类:" + arg0.getAction().getClass().getName());
		System.out.println("访问的url路径:" + arg0.getProxy().getActionName());
		System.out.println("访问的方法:" + arg0.getProxy().getMethod());
		String className=arg0.getAction().getClass().getName();
		String method=arg0.getProxy().getMethod();
		String result=this.backOrFore(className, method, arg0);
		return result;
		
	}
	
	private String backOrFore(String className,String method,ActionInvocation arg0) throws Exception {
		Manager admin=(Manager)arg0.getInvocationContext().getSession().get("admin");
		Customer customer=(Customer)arg0.getInvocationContext().getSession().get("customer");
		if(className.equals(packageName+"ManagerAction")){
			if(method.equals("validateLogin")){
				return arg0.invoke();
			}else if(admin==null){
				return "backgroundLogin";
			}else{
				return arg0.invoke();
			}
		}else if(className.equals(packageName+"CustomerAction")){
			if(method.equals("addCustomer")||method.equals("validateLogin")
					||method.equals("isExist")||method.equals("loginOut")){
				return arg0.invoke();
			}else{
				if(admin!=null){
					return arg0.invoke();
				}else{
					return "backgroundLogin";
				}
			}
		}else if(className.equals(packageName+"LoginHistory")
				||className.equals(packageName+"PetsTypeAction")){
			if(admin!=null){
				return arg0.invoke();
			}else{
				return "backgroundLogin";
			}
		}else if(className.equals(packageName+"CollectionAction")
				||className.equals(packageName+"AddressAction")
				||className.equals(packageName+"CommentAction")){
			if(customer!=null){
				return arg0.invoke();
			}else{
				return "foregroundLogin";
			}
		}else if(className.equals(packageName+"ShopCarAction")){
			if(method.equals("queryAllHou")){
				if(admin!=null){
					return arg0.invoke();
				}else{
					return "backgroundLogin";
				}
			}else{
				if(customer!=null){
					return arg0.invoke();
				}else{
					return "foregroundLogin";
				}
			}
		}else{
			if(method.equals("queryPetsQian")
					||method.equals("queryOneQian")){
				return arg0.invoke();
			}else if(method.equals("confirmGet")){
				if(customer!=null){
					return arg0.invoke();
				}else{
					return "foregroundLogin";
				}
			}else{
				if(admin!=null){
					return arg0.invoke();
				}else{
					return "backgroundLogin";
				}
			}
		}
	}
		

}
