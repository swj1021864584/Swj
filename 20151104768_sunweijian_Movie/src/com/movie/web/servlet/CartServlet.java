package com.movie.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movie.domain.Cart;
import com.movie.domain.CartItem;
import com.movie.domain.Product;
import com.movie.service.ProductService;
import com.movie.utils.BeanFactory;
import com.movie.web.servlet.base.BaseServlet;


@WebServlet("/cart")
public class CartServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
		
	
	
	public String clear(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取购物车 清空
		getCart(request).ClearCart();
		//重定向
		response.sendRedirect(request.getContextPath()+"/jsp/cart.jsp");
		return null;
	}
	
	/**
	 * 从购物车中移除
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String remove(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取商品的pid
		String pid = request.getParameter("pid");
		//获取购物车
		getCart(request).removeFromCart(pid);
		//重定向
		response.sendRedirect(request.getContextPath()+"/jsp/cart.jsp");
		
		return null;
	}
	
	
	/**
		 * 加入购物车
		 * @param request
		 * @param response
		 * @return
		 * @throws ServletException
		 * @throws IOException
		 */
		public String add2cart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			try {
				//获取pid  count
				String pid =request.getParameter("pid");
				int count = Integer.parseInt(request.getParameter("count"));
				//2封装cartitem
				//调用service获取product
				ProductService ps = (ProductService) BeanFactory.getBean("ProductService");
				Product product = ps.getById(pid);
				
				//创建cartitem
				CartItem cartItem=new CartItem(product, count);
				//将cartitem加入购物车
				//获取购物车
				Cart cart = getCart(request);
				cart.add2cart(cartItem);
				//重定向\
				response.sendRedirect(request.getContextPath()+"/jsp/cart.jsp");
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("msg", "加入购物车失败");
				return "/jsp/msg.jsp";
			}
			return null;
		}
		/**
		 * 获取购物车
		 * @param request
		 * @return
		 */
		private Cart getCart(HttpServletRequest request) {
			Cart cart = (Cart) request.getSession().getAttribute("cart");
			if (cart==null) {
				cart = new Cart();
				
				//将cart放入session中
				request.getSession().setAttribute("cart", cart);
			}
			return cart;
		}
}
