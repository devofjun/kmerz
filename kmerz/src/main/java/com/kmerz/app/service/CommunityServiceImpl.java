package com.kmerz.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kmerz.app.dao.CommunityDao;
import com.kmerz.app.vo.CommunityVo;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Inject
	CommunityDao commDao;

	
	private static final String COMM_STATUS_REQUEST = "request";		// 신청됨
	private static final String COMM_STATUS_WAIT = "wait";				// 검수중
	private static final String COMM_STATUS_ACCEPT = "accept";			// 승인됨
	private static final String COMM_STATUS_DENY = "deny";				// 반려됨
	private static final String COMM_STATUS_STOP = "stop";				// 운영정지
	
	
	// 커뮤니티 생성 신청
	@Override
	public void createCommunity(CommunityVo communityVo) {
		communityVo.setCommunity_status(COMM_STATUS_REQUEST);
		System.out.println(communityVo);
		commDao.insertCommunity(communityVo);
	}


	@Override
	public List<CommunityVo> getCommunityList() {
		List<CommunityVo> list = commDao.selectCommunityList();
		return list;
	}


	@Override
	public CommunityVo getOneCommunity(String community_id) {
		CommunityVo vo = commDao.getOneCommunity(community_id);
		return vo;
	}
	
	

}
