package cn.com.pso.action;

import java.util.List;

import org.apache.struts2.json.annotations.JSON;

import cn.com.pso.entity.Collection;
import cn.com.pso.service.ICollectionService;
import cn.com.pso.util.PageBean;

import com.opensymphony.xwork2.ActionSupport;

public class CollectionAction extends ActionSupport {
	private ICollectionService collectionService;
	private Collection collection;
	private PageBean pageBean;
	private List<Collection> list;
	private String result;
	public String addCollection(){
		collectionService.addCollection(collection);
		return "addCollection";
	}
	
	public String queryAll(){
		pageBean=collectionService.queryAll(pageBean, collection);
		return "queryAll";
	}
	
	public String validateCollection(){
		list=collectionService.validateCollection(collection);
		if(list!=null&&list.size()>0){
			result="exist";
		}else{
			result="notExist";
		}
		return "validateCollection";
	}
	
	public String delete(){
		collectionService.deleteCollection(collection);
		result="deleteSuccess";
		return "delete";
	}
	
	public void setCollectionService(ICollectionService collectionService) {
		this.collectionService = collectionService;
	}
	public Collection getCollection() {
		return collection;
	}
	public void setCollection(Collection collection) {
		this.collection = collection;
	}
	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public List<Collection> getList() {
		return list;
	}

	public void setList(List<Collection> list) {
		this.list = list;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
	
	
	
	

}
