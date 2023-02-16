package com.galgga.admin.vo;

import org.springframework.stereotype.Component;

@Component("AdminVO")
public class AdminVO {
	private String Ad_id;
	private String Admin_name;
	private String Admin_pw;
	private String phone1;
	private String phone2;
	private String phone3;
	private String email;
	
	

	public String getAd_id() {
		return Ad_id;
	}
	public void setAd_id(String ad_id) {
		Ad_id = ad_id;
	}
	public String getAdmin_name() {
		return Admin_name;
	}
	public void setAdmin_name(String admin_name) {
		Admin_name = admin_name;
	}
	public String getAdmin_pw() {
		return Admin_pw;
	}
	public void setAdmin_pw(String admin_pw) {
		Admin_pw = admin_pw;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
