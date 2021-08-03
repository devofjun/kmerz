package com.kmerz.app.vo;

import java.sql.Timestamp;

public class PointLogVo {
	private int point_id;
	private int user_no;
	private String point_content;
	private int point_now;
	private int point_score;
	private int point_total;
	private Timestamp point_datetime;
	
	public PointLogVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public PointLogVo(int user_no, String point_content, int point_now, int point_score, int point_total) {
		super();
		this.user_no = user_no;
		this.point_content = point_content;
		this.point_now = point_now;
		this.point_score = point_score;
		this.point_total = point_total;
	}

	public PointLogVo(int point_id, int user_no, String point_content, int point_now, int point_score, int point_total,
			Timestamp point_datetime) {
		super();
		this.point_id = point_id;
		this.user_no = user_no;
		this.point_content = point_content;
		this.point_now = point_now;
		this.point_score = point_score;
		this.point_total = point_total;
		this.point_datetime = point_datetime;
	}

	public int getPoint_id() {
		return point_id;
	}

	public void setPoint_id(int point_id) {
		this.point_id = point_id;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getPoint_content() {
		return point_content;
	}

	public void setPoint_content(String point_content) {
		this.point_content = point_content;
	}

	public int getPoint_now() {
		return point_now;
	}

	public void setPoint_now(int point_now) {
		this.point_now = point_now;
	}

	public int getPoint_score() {
		return point_score;
	}

	public void setPoint_score(int point_score) {
		this.point_score = point_score;
	}

	public int getPoint_total() {
		return point_total;
	}

	public void setPoint_total(int point_total) {
		this.point_total = point_total;
	}

	public Timestamp getPoint_datetime() {
		return point_datetime;
	}

	public void setPoint_datetime(Timestamp point_datetime) {
		this.point_datetime = point_datetime;
	}

	@Override
	public String toString() {
		return "PointLogVo [point_id=" + point_id + ", user_no=" + user_no + ", point_content=" + point_content
				+ ", point_now=" + point_now + ", point_score=" + point_score + ", point_total=" + point_total
				+ ", point_datetime=" + point_datetime + "]";
	}

	
	
}
