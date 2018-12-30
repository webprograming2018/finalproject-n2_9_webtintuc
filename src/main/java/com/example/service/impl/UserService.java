package com.example.service.impl;

import javax.inject.Inject;

import com.example.dao.IUserDao;
import com.example.exception.MyException;
import com.example.model.UserModel;
import com.example.service.IUserService;

public class UserService implements IUserService {
	
	@Inject
	private IUserDao userDao;
	
	@Override
	public UserModel findByUserNameAndPassword(String name, String password) throws MyException {
		return userDao.findByUserNameAndPassword(name, password);
	}
}
