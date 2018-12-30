package com.example.service.impl;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;

import com.example.constant.SystemConstant;
import com.example.dao.INewDao;
import com.example.dao.IUserDao;
import com.example.exception.MyException;
import com.example.model.NewModel;
import com.example.model.NewUserModel;
import com.example.model.SlideModel;
import com.example.service.INewService;

public class NewService implements INewService {
	
	@Inject
	private INewDao newDao;
	
	@Inject
	private IUserDao userDao;

	@Override
	public List<NewModel> findAll() throws MyException {
		return newDao.findAll();
	}

	@Override
	public NewModel findById(Long id) throws MyException {
		return newDao.findById(id);
	}

	@Override
	public void update(NewModel model) throws MyException {
		NewModel oldNew = newDao.findById(model.getId());
		model.setCreatedDate(oldNew.getCreatedDate());
		if (StringUtils.isBlank(model.getImage())) {
			model.setImage(oldNew.getImage());
		}
		newDao.update(model);
	}

	@Override
	public NewModel save(NewModel model) throws MyException {
		model.setCreatedDate(new Date());
		Long newId = newDao.save(model);
		return newDao.findById(newId);
	}

	@Override
	public SlideModel getSlides() {
		SlideModel result = new SlideModel();
		if (newDao.findByNewSlide().isEmpty()) {
			result.setFirst(newDao.findAll().get(0).getImage());
			result.setListResult(null);
		} else {
			result.setFirst(newDao.findByNewSlide().get(0).getImage());
			result.setListResult(newDao.findByNewSlide().stream().filter(item -> !item.getId().equals(newDao.findByNewSlide().get(0).getId())).collect(Collectors.toList()));
		}
		return result;
	}

	@Override
	public void updateSlide(Long[] ids) {
		newDao.updateSlide(ids);
	}

	@Override
	public void updateHotNew(Long[] ids) {
		newDao.updateHotnew(ids);
	}

	@Override
	public List<NewModel> getHotNew() {
		return newDao.findByHotNew();
	}

	@Override
	public void saveComment(NewUserModel model) {
		model.setCode(SystemConstant.COMMENT);
		newDao.saveComment(model);
	}

	@Override
	public List<NewUserModel> findCommentByNew(long newId) {
		List<NewUserModel> results = newDao.findCommentByNew(newId);
		for (NewUserModel item: results) {
			item.setUserName(userDao.findById(item.getUserId()).getUserName());
		}
		return results;
	}

	@Override
	public NewModel findNewLatest() {
		return newDao.findByTopAndOrderBy();
	}

	@Override
	public void saveNewFavorite(NewUserModel model) {
		model.setCode(SystemConstant.FAVORITE);
		newDao.saveFavorite(model);
	}

	@Override
	public List<NewUserModel> findFavoriteByUser(Long userId) {
		try {
			List<NewUserModel> results = newDao.findFavoriteByUser(userId);
			for (NewUserModel item: results) {
				NewModel newModel = newDao.findById(item.getNewId());
				item.setNewModel(newModel);
			}
			return results;
		} catch (MyException e) {
			return null;
		}
	}
}
