package com.kmerz.app.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kmerz.app.vo.CommunityVo;

@Repository
public class CommunityDaoImpl implements CommunityDao {

	private static final String NAMESPACE = "com.kmerz.app.community.";
	
	@Inject
	SqlSession sqlsession;
	

	@Override
	public int countAllCommunity() {
		
		return 0;
	}

	@Override
	public void insertCommunity(CommunityVo communityVo) {
		sqlsession.insert(NAMESPACE+"insertCommunity", communityVo);
	}

	@Override
	public List<CommunityVo> selectCommunityList() {
		List<CommunityVo> list = sqlsession.selectList(NAMESPACE + "selectCommunityList");
		return list;
	}

	@Override
	public CommunityVo getOneCommunity(String community_id) {
		CommunityVo vo = sqlsession.selectOne(NAMESPACE + "getOneCommunity", community_id);
		return vo;
	}

	@Override
	public List<CommunityVo> selectUserNOCommunityList(int user_no) {
		// 유저가 만든 커뮤니티 리스트
		return sqlsession.selectList(NAMESPACE+"selectUserNOCommunityList", user_no);
	}

}
