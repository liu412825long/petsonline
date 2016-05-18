package cn.com.pso.dao;

import java.util.List;

import cn.com.pso.entity.Comment;
import cn.com.pso.util.PageBean;

public interface ICommentDao {
	public Integer addComment(Comment comment);
	
	public PageBean queryAll(String hql,Object[] objs,PageBean pageBean);
	
	public List<Comment> listComment(String hql);

}
