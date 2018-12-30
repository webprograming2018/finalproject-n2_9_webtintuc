package com.example.model;

public class NewUserModel {
	
    private Long newId;
    private Long userId;
    private String content;
    private String code;
    private String userName;
    private NewModel newModel;
    
	public Long getNewId() {
		return newId;
	}
	public void setNewId(Long newId) {
		this.newId = newId;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public NewModel getNewModel() {
		return newModel;
	}
	public void setNewModel(NewModel newModel) {
		this.newModel = newModel;
	}
}
