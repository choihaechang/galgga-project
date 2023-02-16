package com.galgga.Lods.vo;

import java.util.Date;

public class LodImgFileVO {
	
	private int lodImg_id;
	private int lod_id;
	private String lod_imgName;
	private String imgType;
	private Date imgAddDate;
	
	
	public int getLodImg_id() {
		return lodImg_id;
	}
	public void setLodImg_id(int lodImg_id) {
		this.lodImg_id = lodImg_id;
	}
	public int getLod_id() {
		return lod_id;
	}
	public void setLod_id(int lod_id) {
		this.lod_id = lod_id;
	}
	public String getLod_imgName() {
		return lod_imgName;
	}
	public void setLod_imgName(String lod_imgName) {
		this.lod_imgName = lod_imgName;
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
