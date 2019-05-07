package com.movie.web.servlet;

import com.movie.domain.PageBean;
import com.movie.domain.Product;
import com.movie.service.ProductService;
import com.movie.service.impl.ProductServiceImpl;
import com.movie.web.servlet.base.BaseServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 商品模块
 */
@WebServlet("/product")
public class ProductServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	
	
	/**
	 * 分类商品分页展示
	 */
	public String findByPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// 获取pageNumber,cid,设置pagesize
			//String Parameter =  request.getParameter("pageNumber");
			int pageNumber = 1;
			try {
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			} catch (NumberFormatException e) {
			}
			
			int pageSize = 12;
			String cid = request.getParameter("cid");
			//调用service  分页查询商品  参数: 三  返回值 pagebean
			ProductService ps = new ProductServiceImpl();
			PageBean<Product> bean = ps.findByPage(pageNumber,pageSize,cid);
			
			//将pageBean放入request  中 请求转发product_list.jsp
			request.setAttribute("pb", bean);
		} catch (Exception e) {
			request.setAttribute("msg", "分页查询失败");
			return "/jsp/msg.jsp";
		}
		return "/jsp/product_list.jsp";
	}	
	
	/**
		 * 商品详情
		 * @param request
		 * @param response
		 * @return
		 * @throws ServletException
		 * @throws IOException
		 */
		public String getById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			try {
				//获取pid
				String pid  = request.getParameter("pid");
				
				//调用service  获取单个商品参数:pid 返回值:product
				ProductService ps = new ProductServiceImpl();
				Product pro = ps.getById(pid);
				
				//将product放入request域中,请求转发/jsp/product_info.jsp
				request.setAttribute("bean", pro);
			} catch (Exception e) {
				request.setAttribute("msg", "查询单个商品失败");
				return "/jsp/msg.jsp";
			}
			
			return "/jsp/product_info.jsp";
		}

}
