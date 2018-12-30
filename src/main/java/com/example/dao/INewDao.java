package com.example.dao;

import java.util.List;

import com.example.exception.MyException;
import com.example.model.NewModel;
import com.example.model.NewUserModel;

public interface INewDao {
	List<NewModel> findAll();
	NewModel findById(Long id) throws MyException;
	void update(NewModel updateNew) throws MyException;
	Long save(NewModel newModel) throws MyException;
	List<NewModel> findByNewSlide();
	List<NewModel> findByHotNew();
	void updateSlide(Long[] ids);
	void updateHotnew(Long[] ids);
	void saveComment(NewUserModel comment);
	List<NewUserModel> findCommentByNew(long newId);
	NewModel findByTopAndOrderBy();
	void saveFavorite(NewUserModel comment);
	List<NewUserModel> findFavoriteByUser(Long userId);
}
