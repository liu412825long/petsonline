package cn.com.pso.service;

import java.io.File;

import cn.com.pso.util.PageBean;

public interface IPetsService {
	public void addPets(Object obj,File[] files,String[] fileNames);
	
	public PageBean queryPets(Object obj,PageBean pageBean);
	public PageBean queryPetsQian(Object obj,PageBean pageBean);
	
	public void deletePets(Object ob);
	
	public Object queryPet(Object obj);
	
	public void updatePets(Object obj);
	

}
