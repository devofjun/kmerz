package com.kmerz.app.vo;

import java.sql.Timestamp;

public class MemberLogVo {
	private String user_log_code;
	private String user_id;
	private String user_request_ip;
	private String user_request_content;
	private Timestamp user_log_time;
	
	public MemberLogVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberLogVo(String user_log_code, String user_id, String user_request_ip, String user_request_content,
			Timestamp user_log_time) {
		super();
		this.user_log_code = user_log_code;
		this.user_id = user_id;
		this.user_request_ip = user_request_ip;
		this.user_request_content = user_request_content;
		this.user_log_time = user_log_time;
	}

	public String getUser_log_code() {
		return user_log_code;
	}

	public void setUser_log_code(String user_log_code) {
		this.user_log_code = user_log_code;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_request_ip() {
		return user_request_ip;
	}

	public void setUser_request_ip(String user_request_ip) {
		this.user_request_ip = user_request_ip;
	}

	public String getUser_request_content() {
		return user_request_content;
	}

	public void setUser_request_content(String user_request_content) {
		this.user_request_content = user_request_content;
	}

	public Timestamp getUser_log_time() {
		return user_log_time;
	}

	public void setUser_log_time(Timestamp user_log_time) {
		this.user_log_time = user_log_time;
	}

	@Override
	public String toString() {
		return "MemberLogVo [user_log_code=" + user_log_code + ", user_id=" + user_id + ", user_request_ip="
				+ user_request_ip + ", user_request_content=" + user_request_content + ", user_log_time="
				+ user_log_time + "]";
	}
	
	
}
