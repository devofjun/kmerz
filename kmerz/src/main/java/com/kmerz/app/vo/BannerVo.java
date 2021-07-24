package com.kmerz.app.vo;

public class BannerVo {
	private int banner_no;
	private int app_id;
	
	public BannerVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BannerVo(int banner_no, int app_id) {
		super();
		this.banner_no = banner_no;
		this.app_id = app_id;
	}

	public int getBanner_no() {
		return banner_no;
	}

	public void setBanner_no(int banner_no) {
		this.banner_no = banner_no;
	}

	public int getApp_id() {
		return app_id;
	}

	public void setApp_id(int app_id) {
		this.app_id = app_id;
	}

	@Override
	public String toString() {
		return "BannerVo [banner_no=" + banner_no + ", app_id=" + app_id + "]";
	}

	
}
