package cn.com.pso.dao;

import java.util.List;

import cn.com.pso.entity.Collection;
import cn.com.pso.util.PageBean;

public interface ICollectionDao {
	public Integer addCollection(Collection collection);
	public PageBean queryAll(String hql,Object[] objs,PageBean pageBean);
	public List<Collection> validateCollection(String hql);
	public void deleteCollection(int id);

}
