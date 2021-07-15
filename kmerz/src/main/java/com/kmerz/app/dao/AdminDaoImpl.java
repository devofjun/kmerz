package com.kmerz.app.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kmerz.app.vo.AdminVo;

@Repository
public class AdminDaoImpl implements AdminDao{

	private static final String NAMESPACE = "com.kmerz.app.administrator.";
	
	@Inject
	SqlSession sqlSession;
	
	//관리자 등록
	@Override
	public void insertAdmin(AdminVo adminVo) {
		sqlSession.insert(NAMESPACE+"insertAdmin", adminVo);
	}

	// 로그인
	@Override
	public AdminVo selectIdPw(String admin_id, String admin_pw) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("admin_id", admin_id);
		map.put("admin_pw", admin_pw);
		AdminVo manager = sqlSession.selectOne(NAMESPACE+"selectIdPw", map);
		return manager;
	}

}
