package com.kmerz.app.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kmerz.app.vo.PointLogVo;

@Repository
public class PointLogDaoImpl implements PointLogDao {

	private static final String NAMESPACE = "com.kmerz.app.pointlog.";
	
	@Inject
	SqlSession session;
	
	@Transactional
	@Override
	public void insertPointLog(int user_no, String point_content, int point_score) {
		// 새로운 포인트 변경사항 입력
		int point_now = 0;
		int point_total = 0;
		PointLogVo preLogVo = session.selectOne(NAMESPACE+"selectPreUserNo", user_no);
		if(preLogVo != null) {
			if(point_score > 0) {
				point_now = preLogVo.getPoint_now() + point_score;
				point_total = preLogVo.getPoint_total() + point_score;
			} else {
				point_now = preLogVo.getPoint_now() + point_score;
				point_total = preLogVo.getPoint_total();
			}
		} else {
			if(point_score > 0) {
				point_now = point_score;
				point_total = point_score;
			} else {
				point_now = point_score;
				point_total = point_score;
			}
		}
		PointLogVo pointLogVo = new PointLogVo(user_no, point_content, point_now, point_score, point_total);
		session.insert(NAMESPACE+"insertPointLog", pointLogVo);
	}
	
	@Override
	public PointLogVo selectPreUserNo(int user_no) {
		// 가장 최근 포인트 가져오기
		PointLogVo pointLogVo = session.selectOne(NAMESPACE+"selectPreUserNo", user_no);
		return pointLogVo; 
	}

	@Override
	public List<PointLogVo> selectUserNo(int user_no) {
		// 유저 포인트 로그 조회
		return session.selectList(NAMESPACE+"selectUserNo", user_no);
	}

	

}
