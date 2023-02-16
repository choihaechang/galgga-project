package com.galgga.board.vo;

import java.util.Date;

public class ReplyVO {
	private int bno;
	private int rno;
	private String content;
	private String writer_id;
	private Date writedate;
	
	public int getBno() {
		return bno;
	}
	
	public void setBno(int bno) {
		this.bno = bno;
	}
	
	public int getRno() {
		return rno;
	}
	
	public void setRno(int rno) {
		this.rno = rno;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getWriter_id() {
		return writer_id;
	}
	
	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}
	
	public Date getWritedate() {
		return writedate;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [bno=" + bno + ", rno=" + rno + ", content=" + content + ", writer_id=" + writer_id + ", writedate="
				+ writedate + "]";
	}
	
}
