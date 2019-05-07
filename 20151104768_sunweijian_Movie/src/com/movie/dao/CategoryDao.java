package com.movie.dao;

import java.util.List;

import com.movie.domain.Category;

public interface CategoryDao {

	List<Category> findAll() throws Exception;

	void save(Category c)throws Exception;

}
