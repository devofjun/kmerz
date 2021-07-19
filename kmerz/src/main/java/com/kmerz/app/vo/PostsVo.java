package com.kmerz.app.vo;

import java.sql.Timestamp;

public class PostsVo {
	private int post_no;
	private String user_name;
	private String community_id;
	private int category_id;
	private String post_title;
	private String post_content;
	private int post_recommand;
	private int post_viewcount;
	private Timestamp post_lastupdate;
	private String post_status;
	private String post_media;
	
	public PostsVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PostsVo(int post_no, String user_name, String community_id, int category_id, String post_title,
			String post_content, int post_recommand, int post_viewcount, Timestamp post_lastupdate, String post_status,
			String post_media) {
		super();
		this.post_no = post_no;
		this.user_name = user_name;
		this.community_id = community_id;
		this.category_id = category_id;
		this.post_title = post_title;
		this.post_content = post_content;
		this.post_recommand = post_recommand;
		this.post_viewcount = post_viewcount;
		this.post_lastupdate = post_lastupdate;
		this.post_status = post_status;
		this.post_media = post_media;
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

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public String getPost_title() {
		return post_title;
	}

	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}

	public String getPost_content() {
		return post_content;
	}

	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}

	public int getPost_recommand() {
		return post_recommand;
	}

	public void setPost_recommand(int post_recommand) {
		this.post_recommand = post_recommand;
	}

	public int getPost_viewcount() {
		return post_viewcount;
	}

	public void setPost_viewcount(int post_viewcount) {
		this.post_viewcount = post_viewcount;
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

	public String getPost_media() {
		return post_media;
	}

	public void setPost_media(String post_media) {
		this.post_media = post_media;
	}

	@Override
	public String toString() {
		return "PostsVo [post_no=" + post_no + ", user_name=" + user_name + ", community_id=" + community_id
				+ ", category_id=" + category_id + ", post_title=" + post_title + ", post_content=" + post_content
				+ ", post_recommand=" + post_recommand + ", post_viewcount=" + post_viewcount + ", post_lastupdate="
				+ post_lastupdate + ", post_status=" + post_status + ", post_media=" + post_media + "]";
	}

	

	
}
