package com.kmerz.app.vo;

public class CommunityVo {
	private String community_id;
	private String user_id;
	private String community_name;
	private String community_topic;
	private String community_description;
	private String community_status;
	
	public CommunityVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CommunityVo(String community_id, String user_id, String community_name,
			String community_topic, String community_description, String community_status) {

		super();
		this.community_id = community_id;
		this.user_id = user_id;
		this.community_name = community_name;
		this.community_topic = community_topic;
		this.community_description = community_description;
		this.community_status = community_status;
	}

	public String getCommunity_id() {
		return community_id;
	}

	public void setCommunity_id(String community_id) {
		this.community_id = community_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getCommunity_name() {
		return community_name;
	}

	public void setCommunity_name(String community_name) {
		this.community_name = community_name;
	}

	public String getCommunity_topic() {
		return community_topic;
	}

	public void setCommunity_topic(String community_topic) {
		this.community_topic = community_topic;
	}

	public String getCommunity_description() {
		return community_description;
	}

	public void setCommunity_description(String community_description) {
		this.community_description = community_description;
	}

	public String getCommunity_status() {
		return community_status;
	}

	public void setCommunity_status(String community_status) {
		this.community_status = community_status;
	}

	@Override
	public String toString() {
		return "CommunityVo [community_id=" + community_id + ", user_id=" + user_id + ", community_name="
				+ community_name + ", community_topic=" + community_topic + ", community_description="
				+ community_description + ", community_status=" + community_status + "]";
	}

	
	
}
