package com.example.service;

import java.util.List;

import com.example.exception.MyException;
import com.example.model.NewModel;
import com.example.model.NewUserModel;
import com.example.model.SlideModel;

public interface INewService {
	List<NewModel> findAll() throws MyException;
	NewModel findById(Long id) throws MyException;
	void update(NewModel model) throws MyException;
	NewModel save(NewModel model) throws MyException; 
	SlideModel getSlides();
	List<NewModel> getHotNew();
	void updateSlide(Long[] ids);
	void updateHotNew(Long[] ids);
	void saveComment(NewUserModel model);
	List<NewUserModel> findCommentByNew(long newId);
	NewModel findNewLatest();
	void saveNewFavorite(NewUserModel model);
	List<NewUserModel> findFavoriteByUser(Long userId);
}
