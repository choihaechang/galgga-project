package com.galgga.Lods.vo;

import java.util.Date;

public class UnitImgFileVO {
	
	private int unitImg_id;
	private int unit_id;
	private String unit_imgName;
	private String imgType;
	private Date imgAddDate;

	
	public int getUnitImg_id() {
		return unitImg_id;
	}
	public void setUnitImg_id(int unitImg_id) {
		this.unitImg_id = unitImg_id;
	}
	public int getUnit_id() {
		return unit_id;
	}
	public void setUnit_id(int unit_id) {
		this.unit_id = unit_id;
	}

	

	public String getUnit_imgName() {
		return unit_imgName;
	}
	public void setUnit_imgName(String unit_imgName) {
		this.unit_imgName = unit_imgName;
	}

	
	
	
	
	public String getImgType() {
		return imgType;
	}
	public void setImgType(String imgType) {
		this.imgType = imgType;
	}
	public Date getImgAddDate() {
		return imgAddDate;
	}
	public void setImgAddDate(Date imgAddDate) {
		this.imgAddDate = imgAddDate;
	}
	
	
	

}
