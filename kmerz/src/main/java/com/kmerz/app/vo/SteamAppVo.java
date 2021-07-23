package com.kmerz.app.vo;

public class SteamAppVo {
	private int appid;
	private String name;
	private String description;
	private String imgPath;
	private String appPrice;
	private String appMovie;
	
	public SteamAppVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SteamAppVo(int appid, String name, String description, String imgPath, String appPrice, String appMovie) {
		super();
		this.appid = appid;
		this.name = name;
		this.description = description;
		this.imgPath = imgPath;
		this.appPrice = appPrice;
		this.appMovie = appMovie;
	}

	public int getAppid() {
		return appid;
	}

	public void setAppid(int appid) {
		this.appid = appid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public String getAppPrice() {
		return appPrice;
	}

	public void setAppPrice(String appPrice) {
		this.appPrice = appPrice;
	}

	public String getAppMovie() {
		return appMovie;
	}

	public void setAppMovie(String appMovie) {
		this.appMovie = appMovie;
	}

	@Override
	public String toString() {
		return "SteamAppVo [appid=" + appid + ", name=" + name + ", description=" + description + ", imgPath=" + imgPath
				+ ", appPrice=" + appPrice + ", appMovie=" + appMovie + "]";
	}
	
	
}
