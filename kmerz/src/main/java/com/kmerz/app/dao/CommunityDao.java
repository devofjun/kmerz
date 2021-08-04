package com.kmerz.app.dao;

import java.util.List;

import com.kmerz.app.dto.CommunityPagingDto;
import com.kmerz.app.vo.CommunityVo;

public interface CommunityDao {
	public int countAllCommunity();
	public void insertCommunity(CommunityVo communityVo);
	public List<CommunityVo> selectCommunityList();
	public List<CommunityVo> selectSearchCommunityList(CommunityPagingDto communityPagingDto);
	public CommunityVo getOneCommunity(String community_id);
	public List<CommunityVo> selectUserNOCommunityList(int user_no);
	public int selectCommunityCount(CommunityPagingDto communityPagingDto);
}
