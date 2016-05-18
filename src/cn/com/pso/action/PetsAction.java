package cn.com.pso.action;


import java.io.File;
import java.util.List;
import java.util.Map;

import cn.com.pso.entity.Address;
import cn.com.pso.entity.Comment;
import cn.com.pso.entity.Dog;
import cn.com.pso.entity.PetsType;
import cn.com.pso.entity.Pictures;
import cn.com.pso.service.IAddressService;
import cn.com.pso.service.ICommentService;
import cn.com.pso.service.IPetsService;
import cn.com.pso.service.IPetsTypeService;
import cn.com.pso.service.IPictureService;
import cn.com.pso.util.FileUploadUtil;
import cn.com.pso.util.PageBean;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 宠物管理的Action
 * @author HaiLong
 *
 */
public class PetsAction extends ActionSupport {
	
	/**宠物管理的Service*/
	private IPetsService petsService;
	/**宠物图片管理的Service*/
	private IPictureService pictureService;
	/**宠物类型 的Service*/
	private IPetsTypeService petsTypeService;
	private IAddressService addressService;
	private ICommentService commentService;
	/**宠物狗的实体类*/
	private Dog dog;
	/**宠物的ID*/
	private int id;
	/**宠物默认图片的File对象*/
	private File photo;
	/** 宠物默认图片的名字，photo必须是photoFileName 否则名字传递不过来。*/
	private String photoFileName;
	/**宠物组图的文件数组*/
	private File[] files;
	/**宠物组图的文件名字数组*/
	private String[] filesFileName;
	/**宠物分页用的PageBean*/
	private PageBean pageBean;
	/**页面或Action之间传递的标志*/
	private String resultFlg;
	/**宠物图片的List*/
	private List<Pictures> listPicture;
	/**宠物类型的List*/
	private List<PetsType> listPetsType;
	/**宠物图片对象的实体类*/
	private Pictures picture;
	/**不同宠物对象的宠物类型，用于添加时候的大类别中的小类别*/
	private Map<String,List<PetsType>> map;
	
	private Address address;
	private List<Address> listAddress;
	private List<Comment> listComment;
	private Comment comment;
	
	
	/**
	 * 添加宠物
	 * 时间：2016-4-22
	 * @param $
	 * @return  String
	 * 
	 */
	public String addPets(){
		String serverName=FileUploadUtil.uploadFiles(photo, photoFileName);
		dog.setDefaultPicture(serverName);
		petsService.addPets(dog,files, filesFileName);
		resultFlg="addSuccess";
		return "add";
	}
	
	/**
	 * 查询一只宠物的详细信息
	 * 时间：2016-4-22
	 * @param $
	 * @return  String
	 * 
	 */
	public String detailPetInfo(){
		dog=(Dog)petsService.queryPet(dog);
		listPicture=pictureService.pictureList(picture);
		return "detailInfo";
	}
	
	/**修改之前的回显的宠物类型的map
	 * 时间：2016-4-22
	 * @param $
	 * @return  String
	 * 
	 */
	public String modifyBefore(){
		detailPetInfo();
		map=petsTypeService.petsTypemap();
		return "modify";
	}
	
	/**
	 * 修改宠物信息
	 * 时间：2016-4-22
	 * @param $
	 * @return  String
	 * 
	 */
	public String modifyPets(){
		petsService.updatePets(dog);
		picture.setRefId(dog.getId());
		return "modifyPets";
	}

	/**
	 * 以分页的形式查询所有宠物
	 * 时间：2016-4-22
	 * @param $
	 * @return  String
	 * 
	 */
	public String queryPets(){
		pageBean=petsService.queryPets(dog, pageBean);
		return "query";
		
	}
	
	/**
	 * 前台分页的处理
	 * 时间：2016-4-22
	 * @param $
	 * @return  String
	 * 
	 */
	public String queryPetsQian(){
		if(pageBean!=null){
			if(pageBean.getCurrentPage()!=null&&pageBean.getTotalPage()!=null){
				if(pageBean.getCurrentPage()<=1){
					pageBean.setCurrentPage(1);
				}
				if(pageBean.getCurrentPage()>=pageBean.getTotalPage()){
					pageBean.setCurrentPage(pageBean.getTotalPage());
				}
			}
		}
		pageBean=petsService.queryPetsQian(dog, pageBean);
		return "queryPetsQian";
		
	}
	
	public String queryOneQian(){
		dog=(Dog)petsService.queryPet(dog);
		listPicture=pictureService.pictureList(picture);
		listComment=commentService.listComment(comment);
		return "queryOneQian";
	}
	
	/**前台领养信息确认
	 * */
	public String confirmGet(){
		dog=(Dog)petsService.queryPet(dog);
		address=addressService.defaultAddress(address);
		return "confirmGet";
	}
	
	
	/**
	 * 删除宠物的所有信息
	 * 时间：2016-4-22
	 * @param $
	 * @return  String
	 * 
	 */
	public String deletePets(){
		petsService.deletePets(dog);
		resultFlg="deleteSuccess";
		return "delete";
	}
	/*
	 * 以下是Action属性的Getter 和 Setter 方法
	 * */
	public IPetsService getPetsService() {
		return petsService;
	}

	public void setPetsService(IPetsService petsService) {
		this.petsService = petsService;
	}

	public Dog getDog() {
		return dog;
	}

	public void setDog(Dog dog) {
		this.dog = dog;
	}

	public File[] getFiles() {
		return files;
	}

	public void setFiles(File[] files) {
		this.files = files;
	}

	public String[] getFilesFileName() {
		return filesFileName;
	}

	public void setFilesFileName(String[] filesFileName) {
		this.filesFileName = filesFileName;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public File getPhoto() {
		return photo;
	}

	public void setPhoto(File photo) {
		this.photo = photo;
	}

	public String getPhotoFileName() {
		return photoFileName;
	}

	public void setPhotoFileName(String photoFileName) {
		this.photoFileName = photoFileName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getResultFlg() {
		return resultFlg;
	}

	public void setResultFlg(String resultFlg) {
		this.resultFlg = resultFlg;
	}

	public List<Pictures> getListPicture() {
		return listPicture;
	}

	public void setListPicture(List<Pictures> listPicture) {
		this.listPicture = listPicture;
	}

	public IPictureService getPictureService() {
		return pictureService;
	}

	public void setPictureService(IPictureService pictureService) {
		this.pictureService = pictureService;
	}

	public Pictures getPicture() {
		return picture;
	}

	public void setPicture(Pictures picture) {
		this.picture = picture;
	}

	public IPetsTypeService getPetsTypeService() {
		return petsTypeService;
	}

	public void setPetsTypeService(IPetsTypeService petsTypeService) {
		this.petsTypeService = petsTypeService;
	}

	public List<PetsType> getListPetsType() {
		return listPetsType;
	}

	public void setListPetsType(List<PetsType> listPetsType) {
		this.listPetsType = listPetsType;
	}

	public Map<String, List<PetsType>> getMap() {
		return map;
	}

	public void setMap(Map<String, List<PetsType>> map) {
		this.map = map;
	}

	public IAddressService getAddressService() {
		return addressService;
	}

	public void setAddressService(IAddressService addressService) {
		this.addressService = addressService;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public List<Address> getListAddress() {
		return listAddress;
	}

	public void setListAddress(List<Address> listAddress) {
		this.listAddress = listAddress;
	}

	public ICommentService getCommentService() {
		return commentService;
	}

	public void setCommentService(ICommentService commentService) {
		this.commentService = commentService;
	}

	public List<Comment> getListComment() {
		return listComment;
	}

	public void setListComment(List<Comment> listComment) {
		this.listComment = listComment;
	}

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	
	
	
	
 
	
	
	


	
	
	
	
	
	
	
	

}
