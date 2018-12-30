package com.example.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import com.example.dao.INewDao;
import com.example.exception.MyException;
import com.example.jdbc.JdbcTemplate;
import com.example.jdbc.RowMapper;
import com.example.model.NewModel;
import com.example.model.NewUserModel;

public class NewDao implements INewDao {
	
	@Inject
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<NewModel> findAll() {
		try {
			String sql = "SELECT * FROM news";
			return jdbcTemplate.query(sql, NEW_MAPPER);
		} catch (Exception e) {
			return null;
		}
	}
	
	@Override
	public NewModel findById(Long id) throws MyException {
		String sql = "SELECT * FROM news WHERE id = ?";
		List<NewModel> news = jdbcTemplate.query(sql, NEW_MAPPER, id);
		return news.isEmpty() ? null : news.get(0);
	}
	
	@Override
	public void update(NewModel model) throws MyException {
		StringBuilder sql = new StringBuilder("UPDATE news SET image = ?, title = ?, shortdescription = ?, content = ?, categoryid = ? WHERE id = ?");
		jdbcTemplate.update(sql.toString(), model.getImage(), model.getTitle(), model.getShortDescription(), model.getContent(), model.getCategoryId(), model.getId());
	}

	@Override
	public Long save(NewModel model) throws MyException {
		String sql = "INSERT INTO news (image,title,shortdescription,content,createddate,categoryid) VALUES (?,?,?,?,?,?)";
		return jdbcTemplate.insert(sql, model.getImage(), model.getTitle(), model.getShortDescription(), model.getContent(), model.getCreatedDate(), model.getCategoryId());
	}
	
	@Override
	public List<NewModel> findByNewSlide() {
		try {
			String sql = "SELECT * FROM news WHERE newslide = 1";
			return jdbcTemplate.query(sql, NEW_MAPPER);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public void updateSlide(Long[] ids) {
		try {
			String sql1 = "UPDATE news SET newslide = 0";
			jdbcTemplate.update(sql1);
			String sql2 = "UPDATE news SET newslide = 1 WHERE id = ?";
			for (Long item: ids) {
				jdbcTemplate.update(sql2, item);
			}
		} catch (MyException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateHotnew(Long[] ids) {
		try {
			String sql1 = "UPDATE news SET newhot = 0";
			jdbcTemplate.update(sql1);
			String sql2 = "UPDATE news SET newhot = 1 WHERE id = ?";
			for (Long item: ids) {
				jdbcTemplate.update(sql2, item);
			}
		} catch (MyException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<NewModel> findByHotNew() {
		try {
			String sql = "SELECT * FROM news WHERE newhot = 1";
			return jdbcTemplate.query(sql, NEW_MAPPER);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public void saveComment(NewUserModel comment) {
		try {
			String sql = "INSERT INTO new_user (userid,newid,content,code) VALUES (?,?,?,?)";
			jdbcTemplate.insert(sql, comment.getUserId(), comment.getNewId(), comment.getContent(), comment.getCode());
		} catch (MyException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<NewUserModel> findCommentByNew(long newId) {
		try {
			String sql = "SELECT * FROM new_user WHERE newid = ? AND code = ?";
			return jdbcTemplate.query(sql, NEW_USER_MAPPER, newId, "comment");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	private RowMapper<NewModel> NEW_MAPPER = (resultSet) -> {
		return setNewModel(resultSet);
	};
	
	private NewModel setNewModel(ResultSet resultSet) throws SQLException {
		NewModel news = new NewModel();
		news.setId(resultSet.getLong("id"));
		news.setImage(resultSet.getString("image"));
		news.setTitle(resultSet.getString("title"));
		news.setShortDescription(resultSet.getString("shortdescription"));
		news.setContent(resultSet.getString("content"));
		news.setNewSlide(resultSet.getInt("newslide"));
		news.setNewHot(resultSet.getInt("newhot"));
		news.setCreatedDate(new java.util.Date(resultSet.getDate("createddate").getTime()));
		news.setCategoryId(resultSet.getLong("categoryid"));
		return news;
	}
	
	private RowMapper<NewUserModel> NEW_USER_MAPPER = (resultSet) -> {
		return setNewUserModel(resultSet);
	};
	
	private NewUserModel setNewUserModel(ResultSet resultSet) throws SQLException {
		NewUserModel model = new NewUserModel();
		model.setUserId(resultSet.getLong("userid"));
		model.setNewId(resultSet.getLong("newid"));
		model.setContent(resultSet.getString("content"));
		model.setCode(resultSet.getString("code"));
		return model;
	}

	@Override
	public NewModel findByTopAndOrderBy() {
		try {
			String sql = "SELECT TOP 1 * FROM news ORDER BY createddate DESC";
			List<NewModel> news = jdbcTemplate.query(sql, NEW_MAPPER);
			return news.isEmpty() ? null : news.get(0);
		} catch (MyException e) {
			return null;
		}
	}

	@Override
	public void saveFavorite(NewUserModel comment) {
		try {
			String sql = "INSERT INTO new_user (userid,newid,code) VALUES (?,?,?)";
			jdbcTemplate.insert(sql, comment.getUserId(), comment.getNewId(), comment.getCode());
		} catch (MyException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<NewUserModel> findFavoriteByUser(Long userId) {
		try {
			String sql = "SELECT * FROM new_user WHERE userid = ? AND code = ?";
			return jdbcTemplate.query(sql, NEW_USER_MAPPER, userId, "favorite");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
