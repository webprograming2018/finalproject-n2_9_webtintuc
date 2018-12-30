package com.example.exception;

public class MyException extends Exception {
	
	private static final long serialVersionUID = 2880454171719436969L;
	
	public MyException(String message) {
		super(message);
	}
}
