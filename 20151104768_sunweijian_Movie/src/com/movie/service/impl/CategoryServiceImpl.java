package com.movie.service.impl;

import java.util.List;

import com.movie.dao.CategoryDao;
import com.movie.dao.impl.CategoryDaoImpl;
import com.movie.domain.Category;
import com.movie.service.CategoryService;
import com.movie.utils.BeanFactory;
import com.movie.utils.JsonUtil;

public class CategoryServiceImpl implements CategoryService {

	@Override
	/**
	 * 后台展示所有分类
	 */
	public List<Category> findList() throws Exception {
		CategoryDao cd = (CategoryDao) BeanFactory.getBean("CategoryDao");
		return cd.findAll();
	}
	
	
	@Override
	/**
	 * 查询所有分类
	 */
	public String findAll() throws Exception {
		//调用dao 查询所有分类
		/*CategoryDao cd = new CategoryDaoImpl();
		List<Category> list = cd.findAll();*/
		
		 
		List<Category> list = findList();
		//将list转换成json字符串
		if (list != null && list.size()>0) {
			return  JsonUtil.list2json(list);
		}
		
		return null;
	}


	@Override
	/**
	 * 添加分类
	 */
	public void save(Category c) throws Exception {
		//1.调用dao 完成添加
		CategoryDao cd = (CategoryDao) BeanFactory.getBean("CategoryDao");
		cd.save(c);
		
		/*//2.更新redis
		Jedis j = null;
		try {
			j=JedisUtils.getJedis();
			//清除redis中数据
			j.del(Constant.STORE_CATEGORY_LIST);
		} finally {
			JedisUtils.closeJedis(j);
		}*/
	}

	

}
