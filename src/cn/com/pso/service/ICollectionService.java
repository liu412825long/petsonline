package cn.com.pso.service;

import java.util.List;

import cn.com.pso.entity.Collection;
import cn.com.pso.util.PageBean;

public interface ICollectionService {
	public void addCollection(Collection collection);
	public PageBean queryAll(PageBean pageBean,Collection collection);
	
	public List<Collection> validateCollection(Collection collection);
	
	public void deleteCollection(Collection collection);

}
