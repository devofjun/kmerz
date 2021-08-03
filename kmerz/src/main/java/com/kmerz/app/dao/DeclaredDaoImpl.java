package com.kmerz.app.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kmerz.app.vo.DeclaredVo;

@Repository
public class DeclaredDaoImpl implements DeclaredDao {
	
	private static final String NAMESPACE = "com.kmerz.app.declared.";
	
	@Inject
	SqlSession session;
	
	@Override
	public void insertDeclared(DeclaredVo declaredVo) {
		// 신고 추가하기
		session.insert(NAMESPACE+"insertDeclared", declaredVo);
	}

	@Override
	public List<DeclaredVo> selectTargetID(int target_id, int target_type) {
		// 신고된 타겟의 ID와 타입으로 신고 정보 찾기
		Map<String, Integer> map = new HashMap<>();
		map.put("target_id", target_id);
		map.put("target_type", target_type);
		
		List<DeclaredVo> declaredVo = session.selectList(NAMESPACE+"selectTargetID", map);
		return declaredVo;
	}

	@Override
	public int selectTargetIDCount(int target_id, int target_type) {
		// 글의 신고 개수
		Map<String, Integer> map = new HashMap<>();
		map.put("target_id", target_id);
		map.put("target_type", target_type);
		
		List<DeclaredVo> declaredVo = session.selectList(NAMESPACE+"selectTargetIDCount", map);
		return 0;
	}

	@Override
	public int selectTargetUserCount(int target_user_no) {
		// 유저의 신고당한 수
		return session.selectOne(NAMESPACE+"selectTargetUserCount", target_user_no);
	}

}
