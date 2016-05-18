package cn.com.pso.dao;

import cn.com.pso.util.PageBean;

public interface IPetsDao {
	public Integer add(Object object);
	
	public PageBean queryPets(String hql,Object[] objs,PageBean pageBean);
	
	public void deletePets(Class<?> clz, Integer id);
	
	public Object queryPets(Class<?> clz, Integer id);
	
	public void updatePets(Object obj);

}
