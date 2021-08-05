package com.kmerz.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kmerz.app.dao.CommunityDao;
import com.kmerz.app.dao.MemberDao;
import com.kmerz.app.dto.CommunityPagingDto;
import com.kmerz.app.vo.CommunityVo;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Inject
	CommunityDao commDao;

	@Inject
	MemberDao memberDao;
	
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
	public List<CommunityVo> getSearchCommunityList(CommunityPagingDto communitypagingDto) {
		List<CommunityVo> list = commDao.selectSearchCommunityList(communitypagingDto);
		return list;
	}


	@Override
	public CommunityVo getOneCommunity(String community_id) {
		CommunityVo vo = commDao.getOneCommunity(community_id);
		return vo;
	}


	@Override
	public List<CommunityVo> getUserCommunityList(int user_no) {
		// 유저가 만든 커뮤니티 리스트
		return commDao.selectUserNOCommunityList(user_no);
	}


	@Override
	public int getCommunityCount(CommunityPagingDto communitypagingDto) {
		return commDao.selectCommunityCount(communitypagingDto);
	}

	@Transactional
	@Override
	public List<CommunityVo> selectDailyComm() {
		List<CommunityVo> list = commDao.selectDailyComm();
		for(CommunityVo vo : list) {
			vo.setUser_id(memberDao.selectNO(vo.getUser_no()).getUser_id());
			switch(vo.getCommunity_status()) {
			case COMM_STATUS_REQUEST:
				vo.setStr_community_status("신청됨");
				break;
			case COMM_STATUS_WAIT:
				vo.setStr_community_status("검수중");
				break;
			case COMM_STATUS_ACCEPT:
				vo.setStr_community_status("승인됨");
				break;
			case COMM_STATUS_DENY:
				vo.setStr_community_status("반려됨");
				break;
			case COMM_STATUS_STOP:
				vo.setStr_community_status("정지됨");
				break;
			}
		}
		return list;
	}
	
	

}
