package com.example.dao;

import java.util.List;

import com.example.exception.MyException;
import com.example.model.CategoryModel;

public interface ICategoryDao {
	List<CategoryModel> findAll() throws MyException;
}
