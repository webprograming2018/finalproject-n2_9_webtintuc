package com.example.service;

import java.util.List;

import com.example.exception.MyException;
import com.example.model.CategoryModel;

public interface ICategoryService {
	List<CategoryModel> findAll() throws MyException;
}
