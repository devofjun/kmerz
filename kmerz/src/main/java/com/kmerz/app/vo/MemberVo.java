package com.kmerz.app.vo;

import java.sql.Timestamp;

public class MemberVo {
	private int user_no;
	private String user_id;
	private String user_pw;
	private String user_name;
	private Timestamp user_currentlogin;
	private String user_status;
	
	public MemberVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberVo(int user_no, String user_id, String user_pw, String user_name, Timestamp user_currentlogin,
			String user_status) {
		super();
		this.user_no = user_no;
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_currentlogin = user_currentlogin;
		this.user_status = user_status;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public Timestamp getUser_currentlogin() {
		return user_currentlogin;
	}

	public void setUser_currentlogin(Timestamp user_currentlogin) {
		this.user_currentlogin = user_currentlogin;
	}

	public String getUser_status() {
		return user_status;
	}

	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}

	@Override
	public String toString() {
		return "MemberVo [user_no=" + user_no + ", user_id=" + user_id + ", user_pw=" + user_pw + ", user_name="
				+ user_name + ", user_currentlogin=" + user_currentlogin + ", user_status=" + user_status + "]";
	}

	
}
