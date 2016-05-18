package cn.com.pso.service;

import java.util.List;

import cn.com.pso.entity.Pictures;

public interface IPictureService {
	public void addPicture(Pictures pictures);
	
	public void deletePicture(Pictures pictures);
	
	public List<Pictures> pictureList(Pictures pictures);

}
