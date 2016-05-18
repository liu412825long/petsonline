package cn.com.pso.service.impl;

import java.util.Date;
import java.util.List;

import cn.com.pso.dao.ICommentDao;
import cn.com.pso.entity.Comment;
import cn.com.pso.service.ICommentService;
import cn.com.pso.util.PageBean;

public class CommentService implements ICommentService {

	private ICommentDao commentDao;
	@Override
	public void addComment(Comment comment) {
		// TODO Auto-generated method stub
		comment.setCommentDate(new Date());
		commentDao.addComment(comment);
	}
	public PageBean queryAll(Comment comment,PageBean pageBean){
		String hql="from Comment C where 1=1 and C.customer.id="+comment.getCustomer().getId();
		if(pageBean==null){
			pageBean=new PageBean();
			pageBean.setPageSize(3);
		}
		if(pageBean.getCurrentPage()!=null&&pageBean.getTotalPage()!=null){
			if(pageBean.getCurrentPage()>=pageBean.getTotalPage()){
				pageBean.setCurrentPage(pageBean.getTotalPage());
			}
			if(pageBean.getCurrentPage()<=1){
				pageBean.setCurrentPage(1);
			}
		}
		if(comment.getDog()!=null){
			hql=hql+" and C.dog.id="+comment.getDog().getId();
		}
		hql=hql+" order by C.commentDate DESC";
		return commentDao.queryAll(hql, null, pageBean);
	}
	
	public List<Comment> listComment(Comment comment){
		String hql="from Comment C where C.dog.id="+comment.getDog().getId();
		hql=hql+" order by C.commentDate DESC";
		return commentDao.listComment(hql);
	}
	public ICommentDao getCommentDao() {
		return commentDao;
	}
	public void setCommentDao(ICommentDao commentDao) {
		this.commentDao = commentDao;
	}
	

}
