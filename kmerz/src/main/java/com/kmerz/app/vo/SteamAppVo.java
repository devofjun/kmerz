package com.kmerz.app.vo;

public class SteamAppVo {
	private int app_id;
	private String app_type;
	private String app_name;
	private String app_description;
	private String app_header;
	private String app_price;
	private String app_movie;
	private String app_background;
	
	public SteamAppVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SteamAppVo(int app_id, String app_type, String app_name, String app_description, String app_header,
			String app_price, String app_movie, String app_background) {
		super();
		this.app_id = app_id;
		this.app_type = app_type;
		this.app_name = app_name;
		this.app_description = app_description;
		this.app_header = app_header;
		this.app_price = app_price;
		this.app_movie = app_movie;
		this.app_background = app_background;
	}

	public int getApp_id() {
		return app_id;
	}

	public void setApp_id(int app_id) {
		this.app_id = app_id;
	}

	public String getApp_type() {
		return app_type;
	}

	public void setApp_type(String app_type) {
		this.app_type = app_type;
	}

	public String getApp_name() {
		return app_name;
	}

	public void setApp_name(String app_name) {
		this.app_name = app_name;
	}

	public String getApp_description() {
		return app_description;
	}

	public void setApp_description(String app_description) {
		this.app_description = app_description;
	}

	public String getApp_header() {
		return app_header;
	}

	public void setApp_header(String app_header) {
		this.app_header = app_header;
	}

	public String getApp_price() {
		return app_price;
	}

	public void setApp_price(String app_price) {
		this.app_price = app_price;
	}

	public String getApp_movie() {
		return app_movie;
	}

	public void setApp_movie(String app_movie) {
		this.app_movie = app_movie;
	}

	public String getApp_background() {
		return app_background;
	}

	public void setApp_background(String app_background) {
		this.app_background = app_background;
	}

	@Override
	public String toString() {
		return "SteamAppVo [app_id=" + app_id + ", app_type=" + app_type + ", app_name=" + app_name
				+ ", app_description=" + app_description + ", app_header=" + app_header + ", app_price=" + app_price
				+ ", app_movie=" + app_movie + ", app_background=" + app_background + "]";
	}

	
}
