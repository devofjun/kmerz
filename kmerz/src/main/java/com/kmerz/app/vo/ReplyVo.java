package com.kmerz.app.vo;

import java.sql.Timestamp;

public class ReplyVo {
	private int reply_no;
	private int comment_no;
	private int user_no;
	private String reply_content;
	private Timestamp reply_regist_date;
	
	public ReplyVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReplyVo(int reply_no, int comment_no, int user_no, String reply_content, Timestamp reply_regist_date) {
		super();
		this.reply_no = reply_no;
		this.comment_no = comment_no;
		this.user_no = user_no;
		this.reply_content = reply_content;
		this.reply_regist_date = reply_regist_date;
	}

	public int getReply_no() {
		return reply_no;
	}

	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}

	public int getComment_no() {
		return comment_no;
	}

	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public Timestamp getReply_regist_date() {
		return reply_regist_date;
	}

	public void setReply_regist_date(Timestamp reply_regist_date) {
		this.reply_regist_date = reply_regist_date;
	}

	@Override
	public String toString() {
		return "ReplyVo [reply_no=" + reply_no + ", comment_no=" + comment_no + ", user_no=" + user_no
				+ ", reply_content=" + reply_content + ", reply_regist_date=" + reply_regist_date + "]";
	}

	
	
}
