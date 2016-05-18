package cn.com.pso.service.impl;

import java.io.File;
import java.util.List;

import cn.com.pso.dao.IPetsDao;
import cn.com.pso.entity.Dog;
import cn.com.pso.entity.Pictures;
import cn.com.pso.service.IPetsService;
import cn.com.pso.service.IPictureService;
import cn.com.pso.util.FileUploadUtil;
import cn.com.pso.util.PageBean;

public class PetsServiceImpl implements IPetsService {

	private IPetsDao petsDao;
	private IPictureService pictureService;
	@Override
	public void addPets(Object obj,File[] files,String[] fileNames) {
		String[] names=FileUploadUtil.uploadFiles(files, fileNames);
		Integer petsId=petsDao.add(obj);
		String petsType="";
		if(obj instanceof Dog){
			petsType="Dog";
		}
		for(String fileName:names){
			Pictures pic=new Pictures();
			pic.setPetsType(petsType);
			pic.setPictureName(fileName);
			pic.setRefId(petsId);
			pictureService.addPicture(pic);
		}
	}
	
	public Object queryPet(Object obj){
		Dog dog=null;
		if(obj instanceof Dog){
			dog=(Dog)obj;
			return petsDao.queryPets(Dog.class, dog.getId());
		}else{
			return null;
		}
	}
	
	public void updatePets(Object obj){
		petsDao.updatePets(obj);
	}
	
	public void deletePets(Object obj){
		Dog dog=null;
		int id=0;
		if(obj instanceof Dog){
			dog=(Dog)obj;
			petsDao.deletePets(Dog.class, dog.getId());
			id=dog.getId();
		}
		Pictures pic=new Pictures();
		pic.setRefId(id);
		List<Pictures> list=pictureService.pictureList(pic);
		for(int i=0;i<list.size();i++){
			pictureService.deletePicture(list.get(i));
		}
	}
	
	
	@Override
	public PageBean queryPets(Object obj, PageBean pageBean) {
		// TODO Auto-generated method stub
		if(pageBean==null){	
			pageBean=new PageBean();
		}
		pageBean.setPageSize(6);
		String hql="from Dog d";
		pageBean= petsDao.queryPets(hql, null, pageBean);
		return pageBean;
	}
	
	public PageBean queryPetsQian(Object obj, PageBean pageBean) {
		// TODO Auto-generated method stub
		if(pageBean==null){	
			pageBean=new PageBean();
		}
		pageBean.setPageSize(8);
		String hql="from Dog d";
		pageBean= petsDao.queryPets(hql, null, pageBean);
		return pageBean;
	}
	

	public IPetsDao getPetsDao() {
		return petsDao;
	}
	public void setPetsDao(IPetsDao petsDao) {
		this.petsDao = petsDao;
	}

	public IPictureService getPictureService() {
		return pictureService;
	}

	public void setPictureService(IPictureService pictureService) {
		this.pictureService = pictureService;
	}
	
	
	

	
	
}
