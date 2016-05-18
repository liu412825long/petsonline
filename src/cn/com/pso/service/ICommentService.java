package cn.com.pso.service;

import java.util.List;

import cn.com.pso.entity.Comment;
import cn.com.pso.util.PageBean;

public interface ICommentService {

	public void addComment(Comment comment);
	public PageBean queryAll(Comment comment,PageBean pageBean);
	
	public List<Comment> listComment(Comment comment);
}
