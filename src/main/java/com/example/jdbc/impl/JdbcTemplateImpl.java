package com.example.jdbc.impl;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.ResourceBundle;

import com.example.exception.MyException;
import com.example.jdbc.JdbcTemplate;
import com.example.jdbc.RowMapper;

public class JdbcTemplateImpl implements JdbcTemplate {
	
	ResourceBundle db = ResourceBundle.getBundle("application");

	private String url = db.getString("url");
	private String username = db.getString("username");
	private String password = db.getString("password");
	private String driver = db.getString("driver");
	
	private Connection getConnection() {
		try {
			Class.forName(driver);
			return DriverManager.getConnection(url, username, password);
		} catch (SQLException | ClassNotFoundException e) {
			return null;
		}
	}
	
	@Override
	public <T> List<T> query(String sql, RowMapper<T> rowMapper, Object... parameters) throws MyException {
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		List<T> result = new ArrayList<T>();
		try {
			connection = getConnection();
			statement = connection.prepareStatement(sql);
			setParameters(statement, parameters);
			resultSet = statement.executeQuery();
			while (resultSet.next()) {
				result.add(rowMapper.mapRow(resultSet));
			}
		} catch (SQLException e) {
			throw new MyException(e.getMessage());
		} finally {
			closeQuietly(connection, statement, resultSet);
		}
		return result;
	}
	
	@Override
	public void update(String sql, Object... parameters) throws MyException {
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			connection = getConnection();
			connection.setAutoCommit(false);
			statement = connection.prepareStatement(sql);
			setParameters(statement, parameters);
			statement.executeUpdate();
			connection.commit();
		} catch (SQLException e) {
			rollback(connection);
			throw new MyException(e.getMessage());
		} catch (Exception e) {
			rollback(connection);
			throw new MyException(e.getMessage());
		} finally {
			closeQuietly(connection, statement, resultSet);
		}
	}

	@Override
	public Long insert(String sql, Object... parameters) throws MyException {
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		try {
			connection = getConnection();
			connection.setAutoCommit(false);
			statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			setParameters(statement, parameters);
			int result = statement.executeUpdate();
			Long id = null;
			if (result != 0) {
				resultSet = statement.getGeneratedKeys();
				if (resultSet.next()) {
					id = resultSet.getLong(1);
	            }
			}
			connection.commit();
			return id;
		} catch (SQLException e) {
			rollback(connection);
			throw new MyException(e.getMessage());
		} catch (Exception e) {
			rollback(connection);
			throw new MyException(e.getMessage());
		} finally {
			closeQuietly(connection, statement, resultSet);
		}
	}
	
	private void closeQuietly(Connection connection, PreparedStatement statement, ResultSet resultSet) {
		try {
			if (connection != null) {
				connection.close();
			}
			if (statement != null) {
				statement.close();
			}
			if (resultSet != null) {
				resultSet.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void rollback(Connection connection) {
		if (connection != null) {
			try {
				connection.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	private void setParameters(final PreparedStatement statement, final Object... parameters) throws SQLException {
		for (int i = 0; i < parameters.length; i++) {
			Object parameter = parameters[i];
			int parameterIndex = i + 1;
			if (parameter instanceof Boolean) {
				statement.setBoolean(parameterIndex, (Boolean) parameter);
			} else if (parameter instanceof Integer) {
				statement.setInt(parameterIndex, (Integer) parameter);
			} else if (parameter instanceof Long) {
				statement.setLong(parameterIndex, (Long) parameter);
			} else if (parameter instanceof Float) {
				statement.setFloat(parameterIndex, (Float) parameter);
			} else if (parameter instanceof Double) {
				statement.setDouble(parameterIndex, (Double) parameter);
			} else if (parameter instanceof String) {
				statement.setString(parameterIndex, (String) parameter);
			} else if (parameter instanceof Date) {
				statement.setDate(parameterIndex, new java.sql.Date(((Date) parameter).getTime()));
			} else if (parameter instanceof BigDecimal) {
				statement.setBigDecimal(parameterIndex, (BigDecimal) parameter);
			}
		}
	}
}
