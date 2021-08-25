package com.kmerz.app.vo;

import java.sql.Timestamp;

public class DeclaredVo {
	private int declared_id;	// 신고 고유번호
	private int target_id;		// 글번호, 댓글번호
	private int target_type;	// 글 1, 댓글 2
	private int user_no;		// 신고한 유저고유번호
	private int target_user_no;	// 신고 당한 유저고유번호
	private Timestamp declared_datetime; // 신고일시
	
	private String str_target_type;
	private String post_title;
	private String user_name;
	
	public DeclaredVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DeclaredVo(int declared_id, int target_id, int target_type, int user_no, int target_user_no,
			Timestamp declared_datetime, String str_target_type, String post_title, String user_name) {
		super();
		this.declared_id = declared_id;
		this.target_id = target_id;
		this.target_type = target_type;
		this.user_no = user_no;
		this.target_user_no = target_user_no;
		this.declared_datetime = declared_datetime;
		this.str_target_type = str_target_type;
		this.post_title = post_title;
		this.user_name = user_name;
	}

	public int getDeclared_id() {
		return declared_id;
	}

	public void setDeclared_id(int declared_id) {
		this.declared_id = declared_id;
	}

	public int getTarget_id() {
		return target_id;
	}

	public void setTarget_id(int target_id) {
		this.target_id = target_id;
	}

	public int getTarget_type() {
		return target_type;
	}

	public void setTarget_type(int target_type) {
		this.target_type = target_type;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getTarget_user_no() {
		return target_user_no;
	}

	public void setTarget_user_no(int target_user_no) {
		this.target_user_no = target_user_no;
	}

	public Timestamp getDeclared_datetime() {
		return declared_datetime;
	}

	public void setDeclared_datetime(Timestamp declared_datetime) {
		this.declared_datetime = declared_datetime;
	}

	public String getStr_target_type() {
		return str_target_type;
	}

	public void setStr_target_type(String str_target_type) {
		this.str_target_type = str_target_type;
	}

	public String getPost_title() {
		return post_title;
	}

	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	@Override
	public String toString() {
		return "DeclaredVo [declared_id=" + declared_id + ", target_id=" + target_id + ", target_type=" + target_type
				+ ", user_no=" + user_no + ", target_user_no=" + target_user_no + ", declared_datetime="
				+ declared_datetime + ", str_target_type=" + str_target_type + ", post_title=" + post_title
				+ ", user_name=" + user_name + "]";
	}

	
	
	
}
