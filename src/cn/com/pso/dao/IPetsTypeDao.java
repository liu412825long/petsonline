package cn.com.pso.dao;

import java.util.List;

import cn.com.pso.entity.PetsType;
import cn.com.pso.util.PageBean;

public interface IPetsTypeDao {

	/**
	 * 待条件查询，返回结果为List ,查询宠物类型
	 * */
	 List<PetsType> petsTypeList(String hql,Object[] objs);
	
	/**
	 * 查询大分类
	 * */
	 List<String> bigTypeList(String hql);
	
	/**
	 * 以分页的形式查询宠物类型
	 * */
	 PageBean petsTypeAll(String hql,Object[] objs,PageBean pageBean);
	
	/**
	 * 添加宠物类型
	 * */
	 void petsTypeAdd(PetsType petsType);
	 
	 void deletePetsType(int id);
	 
	 int getTotalPage(String hql,int pageSize);
	 
	 PetsType getSingle(int id);
	 
	 void updatePetsType(PetsType petsType );
	
	
}
