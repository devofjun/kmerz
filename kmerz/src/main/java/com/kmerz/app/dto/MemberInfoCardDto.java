package com.kmerz.app.dto;

public class MemberInfoCardDto {
	private int user_no;
	private String user_name;
	private String user_id;
	private String user_profileimage;
	private int user_point;
	private String user_status;
	private int user_post_count;
	
	public MemberInfoCardDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberInfoCardDto(int user_no, String user_name, String user_id, String user_profileimage, int user_point,
			String user_status, int user_post_count) {
		super();
		this.user_no = user_no;
		this.user_name = user_name;
		this.user_id = user_id;
		this.user_profileimage = user_profileimage;
		this.user_point = user_point;
		this.user_status = user_status;
		this.user_post_count = user_post_count;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_profileimage() {
		return user_profileimage;
	}

	public void setUser_profileimage(String user_profileimage) {
		this.user_profileimage = user_profileimage;
	}

	public int getUser_point() {
		return user_point;
	}

	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}

	public String getUser_status() {
		return user_status;
	}

	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}

	public int getUser_post_count() {
		return user_post_count;
	}

	public void setUser_post_count(int user_post_count) {
		this.user_post_count = user_post_count;
	}

	@Override
	public String toString() {
		return "MemberInfoCardDto [user_no=" + user_no + ", user_name=" + user_name + ", user_id=" + user_id
				+ ", user_profileimage=" + user_profileimage + ", user_point=" + user_point + ", user_status="
				+ user_status + ", user_post_count=" + user_post_count + "]";
	}

	
}
