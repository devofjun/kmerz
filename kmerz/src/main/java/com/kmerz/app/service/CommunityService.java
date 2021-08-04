package com.kmerz.app.service;

import java.util.List;

import com.kmerz.app.dto.CommunityPagingDto;
import com.kmerz.app.vo.CommunityVo;

public interface CommunityService {
	public void createCommunity(CommunityVo communityVo);
	public List<CommunityVo> getCommunityList();
	public List<CommunityVo> getSearchCommunityList(CommunityPagingDto communitypagingDto);
	public CommunityVo getOneCommunity(String community_id);
	public List<CommunityVo> getUserCommunityList(int user_no);
	public int getCommunityCount(CommunityPagingDto communitypagingDto);
}
