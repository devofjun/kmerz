package com.kmerz.app.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kmerz.app.vo.PointLogVo;

@Repository
public class PointLogDaoImpl implements PointLogDao {

	private static final String NAMESPACE = "com.kmerz.app.pointlog.";
	
	@Inject
	SqlSession session;
	
	
	@Override
	public void insertPointLog(PointLogVo pointLogVo) {
		// 새로운 포인트 변경사항 입력
		session.insert(NAMESPACE+"insertPointLog", pointLogVo);
	}

	@Override
	public List<PointLogVo> selectUserNo(int user_no) {
		// 유저 포인트 로그 조회
		return session.selectList(NAMESPACE, user_no);
	}

}
