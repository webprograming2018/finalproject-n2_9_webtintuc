package com.example.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import com.example.dao.IUserDao;
import com.example.exception.MyException;
import com.example.jdbc.JdbcTemplate;
import com.example.jdbc.RowMapper;
import com.example.model.UserModel;

public class UserDao implements IUserDao {
	
	@Inject
	private JdbcTemplate jdbcTemplate;

	@Override
	public UserModel findByUserNameAndPassword(String name, String password) throws MyException {
		StringBuilder sql = new StringBuilder(" SELECT * FROM users AS u ");
		sql.append(" INNER JOIN role AS r ON r.id = u.roleid ");
		sql.append(" WHERE u.username = ? AND u.password = ? ");
		List<UserModel> users = jdbcTemplate.query(sql.toString(), USER_MAPPER, name, password);
		return users.isEmpty() ? null : users.get(0);
	}
	
	@Override
	public UserModel findById(long id) {
		try {
			String sql = "SELECT * FROM users WHERE id = ?";
			List<UserModel> users = jdbcTemplate.query(sql.toString(), USER_MAPPER, id);
			return users.isEmpty() ? null : users.get(0);
		} catch (MyException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	private RowMapper<UserModel> USER_MAPPER = (resultSet) -> {
		return setUserModel(resultSet);
	};

	private UserModel setUserModel(ResultSet resultSet) throws SQLException {
		UserModel user = new UserModel();
		user.setId(resultSet.getLong("id"));
		user.setFullName(resultSet.getString("fullname"));
		user.setUserName(resultSet.getString("username"));
		try {
			user.setRoleCode(resultSet.getString("code"));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return user;
	}
}
