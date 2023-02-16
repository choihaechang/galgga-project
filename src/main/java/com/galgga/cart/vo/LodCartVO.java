package com.galgga.cart.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("LodCartVO")
public class LodCartVO {
	private int l_cart_id;
	private int lod_id;
	private int m_id;
	private String lod_name;
	private String lod_price;
	private String lod_address;
	private Date lodcart_add;
	public int getL_cart_id() {
		return l_cart_id;
	}
	public void setL_cart_id(int l_cart_id) {
		this.l_cart_id = l_cart_id;
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
	public String getLod_name() {
		return lod_name;
	}
	public void setLod_name(String lod_name) {
		this.lod_name = lod_name;
	}
	public String getLod_price() {
		return lod_price;
	}
	public void setLod_price(String lod_price) {
		this.lod_price = lod_price;
	}
	public String getLod_address() {
		return lod_address;
	}
	public void setLod_address(String lod_address) {
		this.lod_address = lod_address;
	}
	public Date getLodcart_add() {
		return lodcart_add;
	}
	public void setLodcart_add(Date lodcart_add) {
		this.lodcart_add = lodcart_add;
	}
	
	

}
