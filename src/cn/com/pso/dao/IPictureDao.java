package cn.com.pso.dao;

import java.util.List;

import cn.com.pso.entity.Pictures;

public interface IPictureDao {
	public void add(Pictures pictures);
	
	public Pictures queryOne(Pictures picture);
	
	public void deletePicture(int id);
	
	public List<Pictures> pictureList(String hql,Object[] objs);

}
