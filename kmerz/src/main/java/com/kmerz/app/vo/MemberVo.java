package com.kmerz.app.vo;

import java.sql.Timestamp;

public class MemberVo {
	private String user_id;
	private String user_pw;
	private String user_name;
	private Timestamp user_logintime;
	private String user_status;
	
	public MemberVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberVo(String user_id, String user_pw, String user_name, Timestamp user_logintime, String user_status) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_logintime = user_logintime;
		this.user_status = user_status;
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

	public Timestamp getUser_logintime() {
		return user_logintime;
	}

	public void setUser_logintime(Timestamp user_logintime) {
		this.user_logintime = user_logintime;
	}

	public String getUser_status() {
		return user_status;
	}

	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}

	@Override
	public String toString() {
		return "MemberVo [user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name
				+ ", user_logintime=" + user_logintime + ", user_status=" + user_status + "]";
	}

	
}
