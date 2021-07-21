package com.kmerz.app.service;

import java.util.List;

import com.kmerz.app.vo.CommunityVo;

public interface CommunityService {
	public void createCommunity(CommunityVo communityVo);
	public List<CommunityVo> getCommunityList();
	public CommunityVo getOneCommunity(String community_id);
}
