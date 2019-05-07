package com.movie.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movie.domain.Product;
import com.movie.service.ProductService;
import com.movie.service.impl.ProductServiceImpl;
import com.movie.web.servlet.base.BaseServlet;

/**
 * 首页模块	
 */
@WebServlet("/index")
public class IndexServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

  @Override
	public String index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  try {
		//调用productservice查询最新商品和热门商品
		  ProductService ps = 	new ProductServiceImpl();
		  List<Product> hotList = ps.findHot();
		  List<Product> newList = ps.findNew();
		  //将两个list放入request域中
		  request.setAttribute("hList", hotList);
		  request.setAttribute("nList", newList);
	} catch (Exception e) {
	}
	  
	  return "/jsp/index.jsp";
	}

}
