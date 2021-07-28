package com.kmerz.app.vo;

import java.sql.Timestamp;

public class CommentVo {
	private int comment_no;
	private int post_no;
	private int user_no;
	private String comment_content;
	private int comment_regroup;
	private int comment_retag;
	private Timestamp comment_regist_date;
	
	public CommentVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CommentVo(int comment_no, int post_no, int user_no, String comment_content, int comment_regroup,
			int comment_retag, Timestamp comment_regist_date) {
		super();
		this.comment_no = comment_no;
		this.post_no = post_no;
		this.user_no = user_no;
		this.comment_content = comment_content;
		this.comment_regroup = comment_regroup;
		this.comment_retag = comment_retag;
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

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public int getComment_regroup() {
		return comment_regroup;
	}

	public void setComment_regroup(int comment_regroup) {
		this.comment_regroup = comment_regroup;
	}

	public int getComment_retag() {
		return comment_retag;
	}

	public void setComment_retag(int comment_retag) {
		this.comment_retag = comment_retag;
	}

	public Timestamp getComment_regist_date() {
		return comment_regist_date;
	}

	public void setComment_regist_date(Timestamp comment_regist_date) {
		this.comment_regist_date = comment_regist_date;
	}

	@Override
	public String toString() {
		return "CommentVo [comment_no=" + comment_no + ", post_no=" + post_no + ", user_no=" + user_no
				+ ", comment_content=" + comment_content + ", comment_regroup=" + comment_regroup + ", comment_retag="
				+ comment_retag + ", comment_regist_date=" + comment_regist_date + "]";
	}
	
	
	
}
