package com.kmerz.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kmerz.app.dao.MemberDao;
import com.kmerz.app.dao.PointLogDao;
import com.kmerz.app.vo.PointLogVo;

@Service
public class PointLogServiceImpl implements PointLogService {

	@Inject
	MemberDao memberDao;
	@Inject
	PointLogDao pointlogDao;
	
	@Transactional
	@Override
	public void addPointLog(int user_no, String point_content, int point_score) {
		// 새로운 포인트 변경사항 입력
		pointlogDao.insertPointLog(user_no, point_content, point_score);
		// 유저 포인트 적용
		PointLogVo pointLogVo = pointlogDao.selectPreUserNo(user_no);
		memberDao.updateUserPoint(user_no, pointLogVo.getPoint_now(), pointLogVo.getPoint_total());
	}
	
	@Override
	public List<PointLogVo> getPointLogList(int user_no) {
		// 유저 포인트 로그 조회
		return pointlogDao.selectUserNo(user_no);
	}

	@Override
	public void addPointLog(PointLogVo pointLogVo) {
		int user_no = pointLogVo.getUser_no();
		String point_content = pointLogVo.getPoint_content();
		int point_score = pointLogVo.getPoint_score();
		// 새로운 포인트 변경사항 입력
		pointlogDao.insertPointLog(user_no, point_content, point_score);
		// 유저 포인트 적용
		PointLogVo prePointLogVo = pointlogDao.selectPreUserNo(user_no);
		memberDao.updateUserPoint(user_no, prePointLogVo.getPoint_now(), prePointLogVo.getPoint_total());
	}

}
