package com.kmerz.app.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kmerz.app.vo.MemberVo;

@Repository
public class MemberDaoImpl implements MemberDao{

	private static final String NAMESPACE = "com.kmerz.app.member.";
	
	@Inject
	SqlSession sqlsession;
	
	// 회원 추가
	@Override
	public void insertMember(MemberVo memberVo) {
		sqlsession.insert(NAMESPACE+"insertMember", memberVo);
	}

	// 모든 회원 검색
	@Override
	public List<MemberVo> selectAll() {
		List<MemberVo> list = sqlsession.selectList(NAMESPACE+"selectAll");
		return list;
	}

	// 로그인
	@Override
	public MemberVo selectUser(String user_id, String user_pw) {
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_pw", user_pw);
		MemberVo memberVo = sqlsession.selectOne(NAMESPACE + "selectUser", map);
		return memberVo;
	}
	
	

}
