package com.galgga.Lods.vo;

public class UnitVO {
	public int unit_id;
	public int lod_id;
	public String unit_name;
	public String unit_category;
	public String unit_extent;
	public float starpoint; //이건 디비에서 디폴트로 줌-평점
	public String unit_price;
	public String unit_info; //뷰 두번째 페이지
	public String min_p;
	public String max_p;
	
	
	public int getUnit_id() {
		return unit_id;
	}
	public void setUnit_id(int unit_id) {
		this.unit_id = unit_id;
	}
	public int getLod_id() {
		return lod_id;
	}
	public void setLod_id(int lod_id) {
		this.lod_id = lod_id;
	}
	public String getUnit_name() {
		return unit_name;
	}
	public void setUnit_name(String unit_name) {
		this.unit_name = unit_name;
	}
	public String getUnit_category() {
		return unit_category;
	}
	public void setUnit_category(String unit_category) {
		this.unit_category = unit_category;
	}
	public String getUnit_extent() {
		return unit_extent;
	}
	public void setUnit_extent(String unit_extent) {
		this.unit_extent = unit_extent;
	}
	public float getStarpoint() {
		return starpoint;
	}
	public void setStarpoint(float starpoint) {
		this.starpoint = starpoint;
	}
	public String getUnit_price() {
		return unit_price;
	}
	public void setUnit_price(String unit_price) {
		this.unit_price = unit_price;
	}
	public String getUnit_info() {
		return unit_info;
	}
	public void setUnit_info(String unit_info) {
		this.unit_info = unit_info;
	}
	public String getMin_p() {
		return min_p;
	}
	public void setMin_p(String min_p) {
		this.min_p = min_p;
	}
	public String getMax_p() {
		return max_p;
	}
	public void setMax_p(String max_p) {
		this.max_p = max_p;
	}

	
	
	
		
}
