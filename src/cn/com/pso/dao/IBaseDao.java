package cn.com.pso.dao;


import java.util.List;

import cn.com.pso.util.PageBean;

public interface IBaseDao<T> {
	public Integer add(Object obj);
	
	public void update(Object obj);
	
	public Object load(Class<?> clz, Integer id);
	
	public void delete(Class<?> clz, Integer id);
	/**
	 * 查询 无条件
	 * @param hql
	 * @return
	 */
	public List<T> list(String hql);
	/**
	 * 查询 唯一条件
	 * @param hql
	 * @param obj
	 * @return
	 */
	public List<T> list(String hql, Object obj);
	
	/**
	 * 查询 多条件
	 * @param hql
	 * @param objs
	 * @return
	 */
	public List<T> list(String hql, Object[] objs);
	/**
	 * 分页查询 多条件
	 * @param hql
	 * @param objs
	 * @param pageBean
	 * @return
	 */
	public PageBean page(String hql, Object[] objs, PageBean pageBean);
	
	int getTotalPage(String hql,int pageSize);
}
