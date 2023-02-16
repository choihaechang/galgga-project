package com.galgga.business.vo;

import org.springframework.stereotype.Component;

@Component("businessVO")
public class BusinessVO {
	private int b_id;
	private String business_no;
	private String business_id;
	private String business_pw;
	private String business_name;
	private String phone;
	private String email1;
	private String email2;
	private String company_name;
	private String company_postNo;
	private String company_address;
	private String joinDate;
	private String join_status;
	

	public String getJoin_status() {
		return join_status;
	}
	public void setJoin_status(String join_status) {
		this.join_status = join_status;
	}
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public String getBusiness_no() {
		return business_no;
	}
	public void setBusiness_no(String business_no) {
		this.business_no = business_no;
	}
	public String getBusiness_id() {
		return business_id;
	}
	public void setBusiness_id(String business_id) {
		this.business_id = business_id;
	}
	public String getBusiness_pw() {
		return business_pw;
	}
	public void setBusiness_pw(String business_pw) {
		this.business_pw = business_pw;
	}
	public String getBusiness_name() {
		return business_name;
	}
	public void setBusiness_name(String business_name) {
		this.business_name = business_name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getCompany_postNo() {
		return company_postNo;
	}
	public void setCompany_postNo(String company_postNo) {
		this.company_postNo = company_postNo;
	}
	public String getCompany_address() {
		return company_address;
	}
	public void setCompany_address(String company_address) {
		this.company_address = company_address;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	
}
