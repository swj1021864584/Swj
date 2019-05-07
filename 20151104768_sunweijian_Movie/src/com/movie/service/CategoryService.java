package com.movie.service;

import java.util.List;

import com.movie.domain.Category;

public interface CategoryService {

	String findAll() throws Exception;

	List<Category> findList()throws Exception;

	void save(Category c)throws Exception;


}
