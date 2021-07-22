package com.kmerz.app.vo;

import java.sql.Timestamp;

public class CommentVo {
	private int comment_no;
	private int post_no;
	private String user_name;
	private String comment_content;
	private Timestamp comment_regist_date;
	
	public CommentVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CommentVo(int comment_no, int post_no, String user_name, String comment_content,
			Timestamp comment_regist_date) {
		super();
		this.comment_no = comment_no;
		this.post_no = post_no;
		this.user_name = user_name;
		this.comment_content = comment_content;
		this.comment_regist_date = comment_regist_date;
	}

	public int getComment_no() {
		return comment_no;
	}

	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}

	public int getPost_no() {
		return post_no;
	}

	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public Timestamp getComment_regist_date() {
		return comment_regist_date;
	}

	public void setComment_regist_date(Timestamp comment_regist_date) {
		this.comment_regist_date = comment_regist_date;
	}

	@Override
	public String toString() {
		return "CommentVo [comment_no=" + comment_no + ", post_no=" + post_no + ", user_name=" + user_name
				+ ", comment_content=" + comment_content + ", comment_regist_date=" + comment_regist_date + "]";
	}

	
}
