package com.galgga.board.vo;

import java.util.Date;

public class ReviewVO {
	
	private int review_id;
	private int m_id;
	private String member_id;
	private int lod_id;
	private String review_title;
	private String review_content;
	private float starpoint;
	private Date addDate;
	private String unit_id;
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
	public float getStarpoint() {
		return starpoint;
	}
	public void setStarpoint(float starpoint) {
		this.starpoint = starpoint;
	}
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	public String getUnit_id() {
		return unit_id;
	}
	public void setUnit_id(String unit_id) {
		this.unit_id = unit_id;
	}

	
	
	
	
	
}
