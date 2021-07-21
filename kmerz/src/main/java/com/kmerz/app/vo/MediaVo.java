package com.kmerz.app.vo;

import java.sql.Timestamp;

public class MediaVo {
	private int media_no;
	private String media_id;
	private String file_path;
	private Timestamp upload_time;
	private Timestamp delete_time;
	
	public MediaVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MediaVo(int media_no, String media_id, String file_path, Timestamp upload_time, Timestamp delete_time) {
		super();
		this.media_no = media_no;
		this.media_id = media_id;
		this.file_path = file_path;
		this.upload_time = upload_time;
		this.delete_time = delete_time;
	}

	public int getMedia_no() {
		return media_no;
	}

	public void setMedia_no(int media_no) {
		this.media_no = media_no;
	}

	public String getMedia_id() {
		return media_id;
	}

	public void setMedia_id(String media_id) {
		this.media_id = media_id;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
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
		return "MediaVo [media_no=" + media_no + ", media_id=" + media_id + ", file_path=" + file_path
				+ ", upload_time=" + upload_time + ", delete_time=" + delete_time + "]";
	}
	
}
