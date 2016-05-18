package cn.com.pso.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import cn.com.pso.dao.IBaseDao;
import cn.com.pso.util.PageBean;

public class BaseDao<T> implements IBaseDao<T> {
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public Integer add(Object obj) {
		Session session = getSession();
		return (Integer) session.save(obj);
	}
	
	public void update(Object obj) {
		Session session = getSession();
		session.update(obj);
	}
	
	public Object load(Class<?> clz, Integer id) {
		Session session = getSession();
		Object obj = session.get(clz, id);

		return obj;
	}
	
	public void delete(Class<?> clz, Integer id) {
		Session session = getSession();
		session.delete(this.load(clz, id));	
	}
	
	
	/**
	 * 查询 无条件
	 * @param hql
	 * @return
	 */
	public List<T> list(String hql) {
		return this.list(hql, null);
	}
	
	/**
	 * 查询 唯一条件
	 * @param hql
	 * @param obj
	 * @return
	 */
	public List<T> list(String hql, Object obj) {
		return this.list(hql, new Object[]{obj});
	}
	
	/**
	 * 查询 多条件
	 * @param hql
	 * @param objs
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<T> list(String hql, Object[] objs) {
		Session session = getSession();
		
		Query query = session.createQuery(hql);		
		
		this.setParameter(query, objs);
		
		List<T> list = query.list();
		
		return list;
	}
	
	
	/**
	 * 分页查询 多条件
	 * @param hql
	 * @param objs
	 * @param pageBean
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public PageBean page(String hql, Object[] objs, PageBean pageBean) {// from UserInfo where u.userName=? and u.sex=?
		Session session = getSession();
		
		Query query = session.createQuery(hql);		
		
		this.setParameter(query, objs);
		
		query.setFirstResult((pageBean.getCurrentPage() - 1) * pageBean.getPageSize());
		
		query.setMaxResults(pageBean.getPageSize());
		
		pageBean.setList(query.list());
		
		
		String countHql = getHQLCount(hql);
		
		Integer total = Integer.parseInt(String.valueOf(session.createQuery(countHql).uniqueResult()));
		
		pageBean.setTotal(total);
		
		
		return pageBean;
	}
	
	public int getTotalPage(String hql,int pageSize)
	{
		String countHql = getHQLCount(hql);
		Session session = getSession();
		Integer total = Integer.parseInt(String.valueOf(session.createQuery(countHql).uniqueResult()));
		int totalPage = total % pageSize == 0 ? total / pageSize : total / pageSize + 1;
		return totalPage;
	}
	
	private String getHQLCount(String hql) {
		String s = hql.substring(0, hql.indexOf("from")); //select u.userName u.sex 
		
		if(s.equals("")) {
			hql = "select count(*) " + hql;
		} else {
			hql = hql.replace(s, "select count(*) ");
		}
		
		return hql;
	}
	
	private void setParameter(Query query, Object[] objs) {
		if(objs != null && objs.length > 0) {
			for(int i = 0; i < objs.length; i ++) {
				query.setParameter(i, objs[i]);
			}
		}
	}
}
