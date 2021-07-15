package com.kmerz.app.vo;

public class AdminVo {
	private String admin_id;
	private String admin_pw;
	private String admin_name;
	private String admin_pic;
	
	public AdminVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AdminVo(String admin_id, String admin_pw, String admin_name, String admin_pic) {
		super();
		this.admin_id = admin_id;
		this.admin_pw = admin_pw;
		this.admin_name = admin_name;
		this.admin_pic = admin_pic;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_pw() {
		return admin_pw;
	}

	public void setAdmin_pw(String admin_pw) {
		this.admin_pw = admin_pw;
	}

	public String getAdmin_name() {
		return admin_name;
	}

	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}

	public String getAdmin_pic() {
		return admin_pic;
	}

	public void setAdmin_pic(String admin_pic) {
		this.admin_pic = admin_pic;
	}

	@Override
	public String toString() {
		return "AdminVo [admin_id=" + admin_id + ", admin_pw=" + admin_pw + ", admin_name=" + admin_name
				+ ", admin_pic=" + admin_pic + "]";
	}
	
	
}
