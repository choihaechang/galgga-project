package com.galgga.goods.vo;

public class GoodsImgFileVO {
	private int GoodsImgid;
	private String file_name;
	private String imgAddDate;
	private String fileType;
	private int goods_no;
	
	public int getGoodsImgid() {
		return GoodsImgid;
	}
	public void setGoodsImgid(int goodsImgid) {
		GoodsImgid = goodsImgid;
	}
	public String getImgAddDate() {
		return imgAddDate;
	}
	public void setImgAddDate(String imgAddDate) {
		this.imgAddDate = imgAddDate;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public int getGoods_no() {
		return goods_no;
	}
	public void setGoods_no(int goods_no) {
		this.goods_no = goods_no;
	}
}