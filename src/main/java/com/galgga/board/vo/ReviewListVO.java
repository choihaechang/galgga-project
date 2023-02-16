package com.galgga.board.vo;

public class ReviewListVO {
	private int review_id;
	private int m_id;
	private String member_id;
	private int lod_id;
	private String review_title;
	private String review_content;
	private String starpoint;
	private int reviewImg_id;
	private String imgName; 
	private String imgType;
	
	
	
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getLod_id() {
		return lod_id;
	}
	public void setLod_id(int lod_id) {
		this.lod_id = lod_id;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getStarpoint() {
		return starpoint;
	}
	public void setStarpoint(String starpoint) {
		this.starpoint = starpoint;
	}
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
	public String getImgType() {
		return imgType;
	}
	public void setImgType(String imgType) {
		this.imgType = imgType;
	}
}
