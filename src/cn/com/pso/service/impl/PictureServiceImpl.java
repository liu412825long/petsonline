package cn.com.pso.service.impl;

import java.util.List;

import cn.com.pso.dao.IPictureDao;
import cn.com.pso.entity.Dog;
import cn.com.pso.entity.Pictures;
import cn.com.pso.service.IPictureService;
import cn.com.pso.util.FileUploadUtil;

public class PictureServiceImpl implements IPictureService {

	private IPictureDao pictureDao;
	@Override
	public void addPicture(Pictures pictures) {
		// TODO Auto-generated method stub
		pictureDao.add(pictures);
	}
	public IPictureDao getPictureDao() {
		return pictureDao;
	}
	public void setPictureDao(IPictureDao pictureDao) {
		this.pictureDao = pictureDao;
	}
	@Override
	public void deletePicture(Pictures pic) {
		// TODO Auto-generated method stub
		pictureDao.deletePicture(pic.getId());
		FileUploadUtil.deleteUploadFile(pic.getPictureName());
	}
	
	public List<Pictures> pictureList(Pictures pictures){
		String hql="from Pictures P where P.refId=? ";
		Object[] objs=new Object[]{pictures.getRefId()};
		return pictureDao.pictureList(hql, objs);
	}
	
	

}
