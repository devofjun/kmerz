package com.kmerz.app.vo;

import java.sql.Timestamp;

public class MediaVo {
	private int post_no;
	private String media_type;
	private String file_name;
	private Timestamp upload_time;
	private Timestamp delete_time;
	
	public MediaVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MediaVo(int post_no, String media_type, String file_name, Timestamp upload_time, Timestamp delete_time) {
		super();
		this.post_no = post_no;
		this.media_type = media_type;
		this.file_name = file_name;
		this.upload_time = upload_time;
		this.delete_time = delete_time;
	}

	public int getPost_no() {
		return post_no;
	}

	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}

	public String getMedia_type() {
		return media_type;
	}

	public void setMedia_type(String media_type) {
		this.media_type = media_type;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public Timestamp getUpload_time() {
		return upload_time;
	}

	public void setUpload_time(Timestamp upload_time) {
		this.upload_time = upload_time;
	}

	public Timestamp getDelete_time() {
		return delete_time;
	}

	public void setDelete_time(Timestamp delete_time) {
		this.delete_time = delete_time;
	}

	@Override
	public String toString() {
		return "MediaVo [post_no=" + post_no + ", media_type=" + media_type + ", file_name=" + file_name
				+ ", upload_time=" + upload_time + ", delete_time=" + delete_time + "]";
	}
	
	
}
