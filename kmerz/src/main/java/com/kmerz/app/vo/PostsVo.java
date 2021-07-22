package com.kmerz.app.vo;

import java.sql.Timestamp;

public class PostsVo {
	private int post_no;
	private String user_name;
	private String community_id;
	private int category_no;
	private String post_title;
	private String post_content_file;
	private int post_readcount;
	private int post_recommand;
	private Timestamp post_lastupdate;
	private String post_status;
	
	public PostsVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PostsVo(int post_no, String user_name, String community_id, int category_no, String post_title,
			String post_content_file, int post_readcount, int post_recommand, Timestamp post_lastupdate,
			String post_status) {
		super();
		this.post_no = post_no;
		this.user_name = user_name;
		this.community_id = community_id;
		this.category_no = category_no;
		this.post_title = post_title;
		this.post_content_file = post_content_file;
		this.post_readcount = post_readcount;
		this.post_recommand = post_recommand;
		this.post_lastupdate = post_lastupdate;
		this.post_status = post_status;
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

	public String getCommunity_id() {
		return community_id;
	}

	public void setCommunity_id(String community_id) {
		this.community_id = community_id;
	}

	public int getCategory_no() {
		return category_no;
	}

	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}

	public String getPost_title() {
		return post_title;
	}

	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}

	public String getPost_content_file() {
		return post_content_file;
	}

	public void setPost_content_file(String post_content_file) {
		this.post_content_file = post_content_file;
	}

	public int getPost_readcount() {
		return post_readcount;
	}

	public void setPost_readcount(int post_readcount) {
		this.post_readcount = post_readcount;
	}

	public int getPost_recommand() {
		return post_recommand;
	}

	public void setPost_recommand(int post_recommand) {
		this.post_recommand = post_recommand;
	}

	public Timestamp getPost_lastupdate() {
		return post_lastupdate;
	}

	public void setPost_lastupdate(Timestamp post_lastupdate) {
		this.post_lastupdate = post_lastupdate;
	}

	public String getPost_status() {
		return post_status;
	}

	public void setPost_status(String post_status) {
		this.post_status = post_status;
	}

	@Override
	public String toString() {
		return "PostsVo [post_no=" + post_no + ", user_name=" + user_name + ", community_id=" + community_id
				+ ", category_no=" + category_no + ", post_title=" + post_title + ", post_content_file="
				+ post_content_file + ", post_readcount=" + post_readcount + ", post_recommand=" + post_recommand
				+ ", post_lastupdate=" + post_lastupdate + ", post_status=" + post_status + "]";
	}
	
	
}
