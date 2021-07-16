package com.kmerz.app.vo;

public class AdminMessageVo {
	private int message_no;
	private String admin_id;
	private String message_title;
	private String message_content;
	private int message_level;
	
	public AdminMessageVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AdminMessageVo(int message_no, String admin_id, String message_title, String message_content,
			int message_level) {
		super();
		this.message_no = message_no;
		this.admin_id = admin_id;
		this.message_title = message_title;
		this.message_content = message_content;
		this.message_level = message_level;
	}

	public int getMessage_no() {
		return message_no;
	}

	public void setMessage_no(int message_no) {
		this.message_no = message_no;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getMessage_title() {
		return message_title;
	}

	public void setMessage_title(String message_title) {
		this.message_title = message_title;
	}

	public String getMessage_content() {
		return message_content;
	}

	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}

	public int getMessage_level() {
		return message_level;
	}

	public void setMessage_level(int message_level) {
		this.message_level = message_level;
	}

	@Override
	public String toString() {
		return "AdminMessageVo [message_no=" + message_no + ", admin_id=" + admin_id + ", message_title="
				+ message_title + ", message_content=" + message_content + ", message_level=" + message_level + "]";
	}
	
	
	
}
