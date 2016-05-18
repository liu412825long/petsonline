package cn.com.pso.action;

import cn.com.pso.entity.Comment;
import cn.com.pso.entity.ShopCar;
import cn.com.pso.service.ICommentService;
import cn.com.pso.service.IShopCarService;
import cn.com.pso.util.PageBean;

import com.opensymphony.xwork2.ActionSupport;

public class CommentAction extends ActionSupport {
	private ICommentService commentService;
	private IShopCarService shopCarService;
	private Comment comment;
	private PageBean pageBean;
	private ShopCar shopCar;
	public String addComment(){
		commentService.addComment(comment);
		shopCar=shopCarService.queryOne(shopCar);
		shopCar.setStatus("已评价");
		shopCarService.updateOrder(shopCar);
		return "addComment";
	}
	public String queryAll(){
		pageBean=commentService.queryAll(comment, pageBean);
		return "queryAll";
	}
	public ICommentService getCommentService() {
		return commentService;
	}
	public void setCommentService(ICommentService commentService) {
		this.commentService = commentService;
	}
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	public PageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	public IShopCarService getShopCarService() {
		return shopCarService;
	}
	public void setShopCarService(IShopCarService shopCarService) {
		this.shopCarService = shopCarService;
	}
	public ShopCar getShopCar() {
		return shopCar;
	}
	public void setShopCar(ShopCar shopCar) {
		this.shopCar = shopCar;
	}
	
	
	

}
