package com.kmerz.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kmerz.app.dao.PointLogDao;
import com.kmerz.app.vo.PointLogVo;

@Service
public class PointLogServiceImpl implements PointLogService {

	@Inject
	PointLogDao pointlogDao;
	
	
	@Override
	public void addPointLog(PointLogVo pointlogVo) {
		// 새로운 포인트 변경사항 입력
		pointlogDao.insertPointLog(pointlogVo);
	}

	@Override
	public List<PointLogVo> getPointLogList(int user_no) {
		// 유저 포인트 로그 조회
		return pointlogDao.selectUserNo(user_no);
	}

}
