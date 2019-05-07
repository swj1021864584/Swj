package com.movie.web.servlet;

import com.movie.service.CategoryService;
import com.movie.service.impl.CategoryServiceImpl;
import com.movie.web.servlet.base.BaseServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 前台分类模块
 */
@WebServlet("/category")
public class CategoryServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	
		/**
		 * 查询所有分类
		 * @param request
		 * @param response
		 * @return
		 * @throws ServletException
		 * @throws IOException
		 */
		public String findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			try {
				//设置响应的编码 
				response.setContentType("text/html;charset=utf-8");
				
				
				// 调用service,查询所有分类,返回值json字符串
				CategoryService cs =new CategoryServiceImpl();
				String value = cs.findAll();
				
				
				//将字符串写会浏览器
				response.getWriter().println(value);
			} catch (Exception e) {
			}
			
			return null;
		}
}
