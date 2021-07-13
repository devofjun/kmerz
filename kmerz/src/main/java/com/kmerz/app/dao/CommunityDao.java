package com.kmerz.app.dao;

import com.kmerz.app.vo.CommunityVo;

public interface CommunityDao {
	public int countAllCommunity();
	public void insertCommunity(CommunityVo communityVo);
}
