package com.kmerz.app.vo;

import java.sql.Timestamp;

public class MemberLogVo {
	private int member_log_id;
	private int member_log_code;
	private int user_no;
	private String request_ip;
	private String request_content;
	private String response_content;
	private Timestamp user_log_time;
	
	public MemberLogVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberLogVo(int member_log_id, int member_log_code, int user_no, String request_ip, String request_content,
			String response_content, Timestamp user_log_time) {
		super();
		this.member_log_id = member_log_id;
		this.member_log_code = member_log_code;
		this.user_no = user_no;
		this.request_ip = request_ip;
		this.request_content = request_content;
		this.response_content = response_content;
		this.user_log_time = user_log_time;
	}

	public int getMember_log_id() {
		return member_log_id;
	}

	public void setMember_log_id(int member_log_id) {
		this.member_log_id = member_log_id;
	}

	public int getMember_log_code() {
		return member_log_code;
	}

	public void setMember_log_code(int member_log_code) {
		this.member_log_code = member_log_code;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getRequest_ip() {
		return request_ip;
	}

	public void setRequest_ip(String request_ip) {
		this.request_ip = request_ip;
	}

	public String getRequest_content() {
		return request_content;
	}

	public void setRequest_content(String request_content) {
		this.request_content = request_content;
	}

	public String getResponse_content() {
		return response_content;
	}

	public void setResponse_content(String response_content) {
		this.response_content = response_content;
	}

	public Timestamp getUser_log_time() {
		return user_log_time;
	}

	public void setUser_log_time(Timestamp user_log_time) {
		this.user_log_time = user_log_time;
	}

	@Override
	public String toString() {
		return "MemberLogVo [member_log_id=" + member_log_id + ", member_log_code=" + member_log_code + ", user_no="
				+ user_no + ", request_ip=" + request_ip + ", request_content=" + request_content
				+ ", response_content=" + response_content + ", user_log_time=" + user_log_time + "]";
	}
	
	
}
