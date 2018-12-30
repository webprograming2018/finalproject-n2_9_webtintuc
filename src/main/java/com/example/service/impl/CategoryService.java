package com.example.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.example.dao.ICategoryDao;
import com.example.exception.MyException;
import com.example.model.CategoryModel;
import com.example.service.ICategoryService;

public class CategoryService implements ICategoryService {
	
	@Inject
	private ICategoryDao categoryDao;

	@Override
	public List<CategoryModel> findAll() throws MyException {
		return categoryDao.findAll();
	}
	
}
