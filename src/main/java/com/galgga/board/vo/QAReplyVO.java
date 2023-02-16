package com.galgga.board.vo;

import java.util.Date;

public class QAReplyVO {

		private int QA_Reply_id;
		private int QA_id;
		private int b_id;
		private String reply_content;
		private Date replyDate;
		private int lod_id;
		
		
		
		
		
		public int getQA_Reply_id() {
			return QA_Reply_id;
		}
		public void setQA_Reply_id(int qA_Reply_id) {
			QA_Reply_id = qA_Reply_id;
		}
		public int getQA_id() {
			return QA_id;
		}
		public void setQA_id(int qA_id) {
			QA_id = qA_id;
		}
		public int getB_id() {
			return b_id;
		}
		public void setB_id(int b_id) {
			this.b_id = b_id;
		}
		public String getReply_content() {
			return reply_content;
		}
		public void setReply_content(String reply_content) {
			this.reply_content = reply_content;
		}
		public Date getReplyDate() {
			return replyDate;
		}
		public void setReplyDate(Date replyDate) {
			this.replyDate = replyDate;
		}
		public int getLod_id() {
			return lod_id;
		}
		public void setLod_id(int lod_id) {
			this.lod_id = lod_id;
		}

		
		
}
