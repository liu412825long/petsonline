package cn.com.pso.action;

import java.util.List;
import java.util.Map;

import cn.com.pso.entity.PetsType;
import cn.com.pso.service.IPetsTypeService;
import cn.com.pso.util.PageBean;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 处理宠物类型的Action
 * @author 海龙
 *
 */
public class PetsTypeAction extends ActionSupport {
	private static final long serialVersionUID = 1695504766846142249L;
	/**寵物類型的Bean*/
	private PetsType petsType;
	/**分頁時的當前頁*/
	private String currentPage;
	/**分頁時的PageBean*/
	private PageBean pageBean;
	/**寵物類型的List*/
	private List<PetsType> list;
	/**寵物類別管理的Service*/
	private IPetsTypeService petsTypeService;
	/**要跳轉的JSP*/
	private String toJsp;
	private String resultFlg;
	private Map<String,List<PetsType>> map;
	
	/**
	 * 将查询到的宠物类型存入到List中
	 * 时间：2016-3-1
	 * @param 
	 * @return  String
	 * 
	 */
	public String queryAll()
	{
		list=petsTypeService.petsTypeList(petsType);
		if(list==null)
		{
			return ERROR;
		}else{
			return SUCCESS;
		}
	}
	
	/**
	 * 以分页的形式存储宠物类型
	 * 时间：2016-3-1
	 * @param $
	 * @return  String
	 * 
	 */
	public String queryPageBean()
	{
		int totalPage=petsTypeService.getTotalPage();
		petsType=null;
		if("".equals(resultFlg)){
			currentPage="1";
		}else if("add".equals(resultFlg)){
			currentPage=String.valueOf(totalPage);
			petsType=null;
		}else if("delete".equals(resultFlg)){
			if(pageBean.getCurrentPage()>totalPage){
				currentPage=String.valueOf(totalPage);
			}else{
				currentPage=String.valueOf(pageBean.getCurrentPage());
			}
		}else if("update".equals(resultFlg)){
					currentPage=String.valueOf(pageBean.getCurrentPage());
		}
		pageBean=petsTypeService.petsTypePageAll(pageBean,currentPage, petsType);
		return SUCCESS;
	}
	
	/**
	 * 添加寵物類型
	 * 时间：2016-3-16
	 * @param $
	 * @return  String
	 * 
	 */
	public String addPetsType()
	{
		petsTypeService.addPetsType(petsType);
		return "addPetsType";
	}
	
	/**
	 * 查詢寵物的類別
	 * 时间：2016-3-16
	 * @param $
	 * @return  String
	 * 
	 */
	public String queryBigType()
	{
		list=petsTypeService.bigTypeList();
		return "queryBigType";
	}
	
	/**
	 * 删除宠物类别
	 * 时间：2016-4-22
	 * @param $
	 * @return  String
	 * 
	 */
	public String deletePetsType()
	{
		petsTypeService.deletePetsType(petsType);
		return "delete";
	}
	
	/**
	 * 批量删除宠物类别
	 * 时间：2016-4-22
	 * @param $
	 * @return  String
	 * 
	 */
	public String deleteMany()
	{
		petsTypeService.deleteManyPetsType(resultFlg);
		return "deleteMany";
	}
	
	/**
	 * 查询一个宠物类别的所有信息
	 * 时间：2016-4-22
	 * @param $
	 * @return  String
	 * 
	 */
	public String queryOne(){
		petsType=petsTypeService.getSinglePetsType(petsType);
		list=petsTypeService.bigTypeList();
		return "queryOne";
	}
	
	/**
	 * 修改宠物类别信息
	 * 时间：2016-4-22
	 * @param $
	 * @return  String
	 * 
	 */
	public String update(){
		petsTypeService.updatePetsType(petsType);
		return "update";
	}
	
	/**
	 * 查询宠物的大类别
	 * 时间：2016-4-22
	 * @param $
	 * @return  String
	 * 
	 */
	public String queryPetsType(){
		map=petsTypeService.petsTypemap();
		return "querySuccess";
	}
	
	/*
	 * 以下是该Action的Getter 和 Setter 方法。
	 * */
	public PetsType getPetsType() {
		return petsType;
	}
	public void setPetsType(PetsType petsType) {
		this.petsType = petsType;
	}
	public IPetsTypeService getPetsTypeService() {
		return petsTypeService;
	}
	public void setPetsTypeService(IPetsTypeService petsTypeService) {
		this.petsTypeService = petsTypeService;
	}
	public String getToJsp() {
		return toJsp;
	}
	public void setToJsp(String toJsp) {
		this.toJsp = toJsp;
	}
	public List<PetsType> getList() {
		return list;
	}
	public void setList(List<PetsType> list) {
		this.list = list;
	}
	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public String getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}

	public String getResultFlg() {
		if(null==resultFlg)
		{
			resultFlg="";
		}
		return resultFlg;
	}

	public void setResultFlg(String resultFlg) {
		this.resultFlg = resultFlg;
	}

	public Map<String, List<PetsType>> getMap() {
		return map;
	}

	public void setMap(Map<String, List<PetsType>> map) {
		this.map = map;
	}
	
	
	
	
	
	
	
	

}
