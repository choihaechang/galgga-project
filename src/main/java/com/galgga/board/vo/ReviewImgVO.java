package com.galgga.board.vo;

import java.util.Date;

public class ReviewImgVO {
	
	private int reviewImg_id;
	private String imgName; 
	private Date addDate;
	private int review_id;
	private String imgType;
	
	
	
	public int getReviewImg_id() {
		return reviewImg_id;
	}
	public void setReviewImg_id(int reviewImg_id) {
		this.reviewImg_id = reviewImg_id;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public String getImgType() {
		return imgType;
	}
	public void setImgType(String imgType) {
		this.imgType = imgType;
	}
	
	

}
