package cn.com.pso.dao.impl;

import java.util.List;

import cn.com.pso.dao.IBaseDao;
import cn.com.pso.dao.ICommentDao;
import cn.com.pso.entity.Comment;
import cn.com.pso.util.PageBean;

public class CommentDaoImpl implements ICommentDao{

	private IBaseDao baseDao;
	@Override
	public Integer addComment(Comment comment) {
		// TODO Auto-generated method stub
		return baseDao.add(comment);
	}
	
	public PageBean queryAll(String hql, Object[] objs, PageBean pageBean) {
		// TODO Auto-generated method stub
		return baseDao.page(hql, objs, pageBean);
	}
	
	public List<Comment> listComment(String hql){
		return baseDao.list(hql);
	}
	public IBaseDao getBaseDao() {
		return baseDao;
	}
	public void setBaseDao(IBaseDao baseDao) {
		this.baseDao = baseDao;
	}

	

}
