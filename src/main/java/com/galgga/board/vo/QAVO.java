 package com.galgga.board.vo;

import java.util.Date;

public class QAVO {

	private int QA_id;
	private int lod_id;
	private int m_id;
	private String member_id;
	private String QA_title;
	private String QA_content;
	private String QA_replCon;
	private Date addDate;
	private String state;
	private Date replDate;
	public int getQA_id() {
		return QA_id;
	}
	public void setQA_id(int qA_id) {
		QA_id = qA_id;
	}
	public int getLod_id() {
		return lod_id;
	}
	public void setLod_id(int lod_id) {
		this.lod_id = lod_id;
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
	public String getQA_title() {
		return QA_title;
	}
	public String getQA_content() {
		return QA_content;
	}
	public void setQA_content(String qA_content) {
		QA_content = qA_content;
	}
	public void setQA_title(String qA_title) {
		QA_title = qA_title;
	}
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getQA_replCon() {
		return QA_replCon;
	}
	public void setQA_replCon(String qA_replCon) {
		QA_replCon = qA_replCon;
	}
	public Date getReplDate() {
		return replDate;
	}
	public void setReplDate(Date replDate) {
		this.replDate = replDate;
	}

	
	
	
	
	
	
	
	
}
