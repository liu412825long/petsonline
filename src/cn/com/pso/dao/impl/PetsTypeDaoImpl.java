package cn.com.pso.dao.impl;

import java.util.List;

import cn.com.pso.dao.IBaseDao;
import cn.com.pso.dao.IPetsTypeDao;
import cn.com.pso.entity.PetsType;
import cn.com.pso.util.PageBean;

/**
 * 宠物类型管理的Dao
 * @author 海龙
 *
 */
public class PetsTypeDaoImpl implements IPetsTypeDao{

	@SuppressWarnings("rawtypes")
	private IBaseDao baseDao;
	
	/**
	 * baseDao 的获得
	 * @return IBaseDao<PetsType>
	 * */
	@SuppressWarnings("rawtypes")
	public IBaseDao getBaseDao() {
		return baseDao;
	}
	/**
	 * baseDao 的设置
	 * @param  IBaseDao<PetsType>
	 * */
	@SuppressWarnings("rawtypes")
	public void setBaseDao(IBaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
	/**
	 * 条件查询宠物类型表
	 * @param hql  hql语句
	 * @param objs   对象类型的数组 ,为空的话就是不带条件查询
	 * @return  List<PetsType>  宠物类型的List
	 * */
	@SuppressWarnings("unchecked")
	@Override
	public List<PetsType> petsTypeList(String hql, Object[] objs) {
		// TODO Auto-generated method stub
		if(objs==null)
		{
			return (List<PetsType>)baseDao.list(hql);
		}else{
			return (List<PetsType>)baseDao.list(hql, objs);
		}
	}
	
	/**
	 *  以分页的形式查询宠物类型
	 *  @param  hql  hql 语句
	 *  @param  Object[] objs  对象类型数组
	 *  @param  PageBean pageBean 分页的Bean
	 * */
	@Override
	public PageBean petsTypeAll(String hql,Object[] objs,PageBean pageBean)
	{ 
		return baseDao.page(hql, objs, pageBean);
	}

	
	/**
	 * 新增宠物类型
	 * @param  PetsType petsType 宠物类型Entity
	 * @return void 
	 * */
	@Override
	public void petsTypeAdd(PetsType petsType) {
		baseDao.add(petsType);
	}
	
	/**
	 * 查询大分类
	 * @param  String hql hql 语句
	 * @return  List<String> 大分类的List
	 * */
	@SuppressWarnings("unchecked")
	@Override
	public List<String> bigTypeList(String hql) {
		// TODO Auto-generated method stub
		return (List<String>)baseDao.list(hql);
	}
	
	@SuppressWarnings("unchecked")
	public void deletePetsType(int id){
		 baseDao.delete(PetsType.class, id);
	}
	
	public int getTotalPage(String hql,int pageSize){
		return baseDao.getTotalPage(hql, pageSize);
	}
	@Override
	public PetsType getSingle(int id) {
		// TODO Auto-generated method stub
		return (PetsType)baseDao.load(PetsType.class, id);
	}
	
	public void updatePetsType(PetsType petsType){
		baseDao.update(petsType);
	}

	
	

	
	

	
}
