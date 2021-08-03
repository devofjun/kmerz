package com.kmerz.app.vo;

import java.sql.Timestamp;

public class MemberVo {
	private int user_no;
	private String user_id;
	private String user_pw;
	private String user_name;
	private Timestamp user_currentlogin;
	private int user_status;
	private String user_profileImage;
	private int user_point;
	private int user_totalpoint;
	
	
	private String str_user_status;
	private int user_declared_count;
	
	public MemberVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberVo(int user_no, String user_id, String user_pw, String user_name, Timestamp user_currentlogin,
			int user_status, String user_profileImage, int user_point, String str_user_status, int user_totalpoint,
			int user_declared_count) {
		super();
		this.user_no = user_no;
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_currentlogin = user_currentlogin;
		this.user_status = user_status;
		this.user_profileImage = user_profileImage;
		this.user_point = user_point;
		this.str_user_status = str_user_status;
		this.user_totalpoint = user_totalpoint;
		this.user_declared_count = user_declared_count;
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

	public int getUser_status() {
		return user_status;
	}

	public void setUser_status(int user_status) {
		this.user_status = user_status;
	}

	public String getUser_profileImage() {
		return user_profileImage;
	}

	public void setUser_profileImage(String user_profileImage) {
		this.user_profileImage = user_profileImage;
	}

	public int getUser_point() {
		return user_point;
	}

	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}

	public String getStr_user_status() {
		return str_user_status;
	}

	public void setStr_user_status(String str_user_status) {
		this.str_user_status = str_user_status;
	}

	public int getUser_totalpoint() {
		return user_totalpoint;
	}

	public void setUser_totalpoint(int user_totalpoint) {
		this.user_totalpoint = user_totalpoint;
	}

	public int getUser_declared_count() {
		return user_declared_count;
	}

	public void setUser_declared_count(int user_declared_count) {
		this.user_declared_count = user_declared_count;
	}

	@Override
	public String toString() {
		return "MemberVo [user_no=" + user_no + ", user_id=" + user_id + ", user_pw=" + user_pw + ", user_name="
				+ user_name + ", user_currentlogin=" + user_currentlogin + ", user_status=" + user_status
				+ ", user_profileImage=" + user_profileImage + ", user_point=" + user_point + ", str_user_status="
				+ str_user_status + ", user_totalpoint=" + user_totalpoint + ", user_declared_count="
				+ user_declared_count + "]";
	}
	
}
