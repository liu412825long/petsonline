package cn.com.pso.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import cn.com.pso.dao.IPetsTypeDao;
import cn.com.pso.entity.PetsType;
import cn.com.pso.service.IPetsTypeService;
import cn.com.pso.util.PageBean;

public class PetsTypeServiceImpl implements IPetsTypeService {

	private IPetsTypeDao petsTypeDao;
	
	
	/**
	 * petsTypeDao 的取得
	 * 时间：2016-3-1
	 * @return  IPetsTypeDao
	 */
	public IPetsTypeDao getPetsTypeDao() {
		return petsTypeDao;
	}
	
	/** petsTypeDao的设定
	 * 时间：2016-3-1
	 * @param IPetsTypeDao
	 * @return  void
	 * 
	 */
	public void setPetsTypeDao(IPetsTypeDao petsTypeDao) {
		this.petsTypeDao = petsTypeDao;
	}
	
	public Map<String,List<PetsType>> petsTypemap(){
		Map<String,List<PetsType>> map=new HashMap<String,List<PetsType>>();
		PetsType petsType=new PetsType();
		petsType.setBigType("犬类");
		List<PetsType> listDog=this.petsTypeList(petsType);
		map.put("dog", listDog);
		petsType.setBigType("猫类");
		List<PetsType> listCat=this.petsTypeList(petsType);
		map.put("cat", listCat);
		petsType.setBigType("兔类");
		List<PetsType> listRabbit=this.petsTypeList(petsType);
		map.put("rabbit", listRabbit);
		return map;
		
	}
	
	
	/**
	 * 查询PetsTypeList
	 * @return  List<PetsType>
	 * */
	@Override
	public List<PetsType> petsTypeList(PetsType petsType) {
		// TODO Auto-generated method stub
		String hql="from PetsType pt where 1=1 ";
		if(petsType==null)
		{	
			return petsTypeDao.petsTypeList(hql,null);
		}
		
		List<String> list=new ArrayList<String>();
		
		if(!StringUtils.isEmpty(petsType.getBigType())){
			list.add(petsType.getBigType());
			hql=hql+" and pt.bigType=?";
			
		}
		
		if(!StringUtils.isEmpty(petsType.getSmallType()))
		{
			list.add(petsType.getSmallType());
			hql=hql+" and pt.smallType=?";
		}
		//将List转换成Object[] 
		Object[] objs=list.toArray();
		
		return petsTypeDao.petsTypeList(hql, objs);
	}
	
	/**
	 * 分页查询宠物类型表
	 * @param  String currentPage  当前页
	 * @param  PetsType petsType 条件查询的Entity，该Entity为空的时候，查询的全部
	 * @return  PageBean 分页的Bean
	 * */
	@Override
	public PageBean petsTypePageAll(PageBean pageBean ,String currentPage,PetsType petsType) {
		if(pageBean==null){
			pageBean=new PageBean();
		}
		pageBean.setPageSize(6);
		int totalPage=1;
		if(!StringUtils.isEmpty(currentPage))
		{
			if(pageBean.getTotalPage()!=null){
				totalPage=pageBean.getTotalPage();
			}
			int current=Integer.parseInt(currentPage);
			if(current<=1){
				pageBean.setCurrentPage(1);
			}else if(current>=totalPage){
				pageBean.setCurrentPage(totalPage);
			}else{
				pageBean.setCurrentPage(current);
			}
		}
		String hql="  from PetsType pt where 1=1 ";
		if(petsType==null)
		{
			hql=hql+"order by pt.id";
			return petsTypeDao.petsTypeAll(hql, null, pageBean);
		}
		
		if(!StringUtils.isEmpty(petsType.getBigType())){
			hql=hql+" and pt.bigType='"+petsType.getBigType()+"'";
		}
		
		if(!StringUtils.isEmpty(petsType.getSmallType()))
		{
			hql=hql+" and pt.smallType='"+petsType.getSmallType()+"'";
		}
		hql=hql+"order by pt.id";
		return petsTypeDao.petsTypeAll(hql, null, pageBean);
	}

	/**
	 * 添加宠物类型
	 * @param PetsType 宠物类型Entity
	 * @return void 
	 * */
	@Override
	public void addPetsType(PetsType petsType) {
		petsTypeDao.petsTypeAdd(petsType);
	}

	/**
	 * 查询宠物类型的大分类
	 * @return List<PetsType> 大分类的List
	 * */
	@Override
	public List<PetsType> bigTypeList() {
		// TODO Auto-generated method stub
		String hql="select pt.bigType from PetsType pt group by pt.bigType";
		List<PetsType> bitTypeList=new ArrayList<PetsType>();
		List<String> list=petsTypeDao.bigTypeList(hql);
		for(String str:list)
		{
			PetsType pt=new PetsType();
			pt.setBigType(str);
			bitTypeList.add(pt);
		}
		return bitTypeList;
	}

	@Override
	public void deletePetsType(PetsType petsType) {
		// TODO Auto-generated method stub
		petsTypeDao.deletePetsType(petsType.getId());
	}
	 public void deleteManyPetsType(String ids){
		 String[] id=ids.split(",");
		 PetsType petsType=new PetsType();
		 for(int i=0;i<id.length;i++){
			 if(!"".equals(id[i])){
				 petsType.setId(Integer.parseInt(id[i]));
				 this.deletePetsType(petsType);
			 }
		 }
	 }
	 
	 public int getTotalPage(){
		 String hql="from PetsType";
		 return petsTypeDao.getTotalPage(hql,6);
	 }

	@Override
	public PetsType getSinglePetsType(PetsType petsType) {
		// TODO Auto-generated method stub
		return petsTypeDao.getSingle(petsType.getId());
	}
	
	public void updatePetsType(PetsType petsType){
		petsTypeDao.updatePetsType(petsType);
	}

}
