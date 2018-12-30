package com.example.model;

public class NewModel extends BaseModel<NewModel> {
	
    private String image;
    private String title;
    private String shortDescription;
	private String content;
	private int newSlide;
	private int newHot;
	private Long categoryId;
	private Long[] newIds;
	
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getShortDescription() {
		return shortDescription;
	}
	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getNewSlide() {
		return newSlide;
	}
	public void setNewSlide(int newSlide) {
		this.newSlide = newSlide;
	}
	public int getNewHot() {
		return newHot;
	}
	public void setNewHot(int newHot) {
		this.newHot = newHot;
	}
	public Long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}
	public Long[] getNewIds() {
		return newIds;
	}
	public void setNewIds(Long[] newIds) {
		this.newIds = newIds;
	}
}
