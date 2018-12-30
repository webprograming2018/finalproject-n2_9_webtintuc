package com.example.jdbc;

import java.util.List;

import com.example.exception.MyException;

public interface JdbcTemplate {
	<T> List<T> query(String sql, RowMapper<T> rowMapper, Object... parameters) throws MyException;
	void update(String sql, Object... parameters) throws MyException;
	Long insert(String sql, Object... parameters) throws MyException;
}
