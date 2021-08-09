package com.kmerz.app.vo;

import java.sql.Timestamp;

public class MemberLogVo {
	private int member_logid;
	private int member_logtype;
	private int user_no;
	private String user_id;
	private String user_name;
	private String request_ip;
	private Timestamp user_log_time;
	
	public MemberLogVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberLogVo(int member_logid, int member_logtype, int user_no, String user_id, String user_name,
			String request_ip, Timestamp user_log_time) {
		super();
		this.member_logid = member_logid;
		this.member_logtype = member_logtype;
		this.user_no = user_no;
		this.user_id = user_id;
		this.user_name = user_name;
		this.request_ip = request_ip;
		this.user_log_time = user_log_time;
	}

	public int getMember_logid() {
		return member_logid;
	}

	public void setMember_logid(int member_logid) {
		this.member_logid = member_logid;
	}

	public int getMember_logtype() {
		return member_logtype;
	}

	public void setMember_logtype(int member_logtype) {
		this.member_logtype = member_logtype;
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

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getRequest_ip() {
		return request_ip;
	}

	public void setRequest_ip(String request_ip) {
		this.request_ip = request_ip;
	}

	public Timestamp getUser_log_time() {
		return user_log_time;
	}

	public void setUser_log_time(Timestamp user_log_time) {
		this.user_log_time = user_log_time;
	}

	@Override
	public String toString() {
		return "MemberLogVo [member_logid=" + member_logid + ", member_logtype=" + member_logtype + ", user_no="
				+ user_no + ", user_id=" + user_id + ", user_name=" + user_name + ", request_ip=" + request_ip
				+ ", user_log_time=" + user_log_time + "]";
	}
	
	
}
