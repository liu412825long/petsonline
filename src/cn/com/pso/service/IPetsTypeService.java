package cn.com.pso.service;

import java.util.List;
import java.util.Map;

import cn.com.pso.entity.PetsType;
import cn.com.pso.util.PageBean;

public interface IPetsTypeService {
	
	public String EMPTY="";

	public List<PetsType> petsTypeList(PetsType petsType);
	
	public PageBean petsTypePageAll(PageBean pageBean,String currentPage,PetsType petsType);
	
	public void addPetsType(PetsType petsType);
	
	public Map<String,List<PetsType>> petsTypemap();
	
	public List<PetsType> bigTypeList();
	
	void deletePetsType(PetsType petsType);
	
	void deleteManyPetsType(String ids);
	
	int getTotalPage();
	
	PetsType getSinglePetsType(PetsType petsType);
	
	void updatePetsType(PetsType petsType);
}
