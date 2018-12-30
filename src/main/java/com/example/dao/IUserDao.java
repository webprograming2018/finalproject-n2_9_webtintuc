package com.example.dao;

import com.example.exception.MyException;
import com.example.model.UserModel;

public interface IUserDao {
	UserModel findByUserNameAndPassword(String name, String password) throws MyException;
	UserModel findById(long id);
}
