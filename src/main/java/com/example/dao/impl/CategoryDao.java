package com.example.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import com.example.dao.ICategoryDao;
import com.example.exception.MyException;
import com.example.jdbc.JdbcTemplate;
import com.example.jdbc.RowMapper;
import com.example.model.CategoryModel;

public class CategoryDao implements ICategoryDao {
	
	@Inject
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<CategoryModel> findAll() throws MyException {
		String sql = "SELECT * FROM category";
		return jdbcTemplate.query(sql, CATEGORY_MAPPER);
	}
	
	private RowMapper<CategoryModel> CATEGORY_MAPPER = (resultSet) -> {
		return setCategoryModel(resultSet);
	};

	private CategoryModel setCategoryModel(ResultSet resultSet) throws SQLException {
		CategoryModel category = new CategoryModel();
		category.setId(resultSet.getLong("id"));
		category.setCode(resultSet.getString("code"));
		category.setName(resultSet.getString("name"));
		return category;
	}

}
