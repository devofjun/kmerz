package com.kmerz.community.vo;

import java.sql.Timestamp;

public class PostsVo {
	private int post_no;
	private int user_id;
	private int category_id;
	private String post_title;
	private String post_content;
	private String post_recommandation;
	private Timestamp post_lastupdate;
	private String post_status;
	private String post_media;
	
	public PostsVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PostsVo(int post_no, int user_id, int category_id, String post_title, String post_content,
			String post_recommandation, Timestamp post_lastupdate, String post_status, String post_media) {
		super();
		this.post_no = post_no;
		this.user_id = user_id;
		this.category_id = category_id;
		this.post_title = post_title;
		this.post_content = post_content;
		this.post_recommandation = post_recommandation;
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

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
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

	public String getPost_recommandation() {
		return post_recommandation;
	}

	public void setPost_recommandation(String post_recommandation) {
		this.post_recommandation = post_recommandation;
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
		return "PostsVo [post_no=" + post_no + ", user_id=" + user_id + ", category_id=" + category_id + ", post_title="
				+ post_title + ", post_content=" + post_content + ", post_recommandation=" + post_recommandation
				+ ", post_lastupdate=" + post_lastupdate + ", post_status=" + post_status + ", post_media=" + post_media
				+ "]";
	}
	
	
}
