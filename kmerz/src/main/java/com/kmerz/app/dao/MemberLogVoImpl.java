package com.kmerz.app.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kmerz.app.vo.MemberLogVo;

@Repository
public class MemberLogVoImpl implements MemberLogDao {

	private static final String NAMESPACE = "com.kmerz.app.memberlog.";
	
	@Inject
	SqlSession session;
	
	@Override
	public void insertMemberLog(MemberLogVo memberLogVo) {
		// 회원 로그 입력
		session.insert(NAMESPACE+"insertMemberLog", memberLogVo);
	}


	@Override
	public List<MemberLogVo> selectDailyList(int member_logtype) {
		// 타입으로 리스트 조회
		return session.selectList(NAMESPACE+"selectDailyList", member_logtype);
	}

}
