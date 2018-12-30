package com.example.service;

import com.example.exception.MyException;
import com.example.model.UserModel;

public interface IUserService {
	UserModel findByUserNameAndPassword(String name, String password) throws MyException;
}
