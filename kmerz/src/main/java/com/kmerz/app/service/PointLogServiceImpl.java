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
	public void dailyPoint(int user_no) {
		// 매일 첫 로그인 포인트
		final int DAILYPT = 10; 
		PointLogVo logVo = new PointLogVo();
		logVo.setUser_no(user_no);
		logVo.setPoint_content("매일 첫 로그인 포인트");
		logVo.setPoint_score(DAILYPT);
		int preTotal = pointlogDao.selectPreTotal(user_no);
		logVo.setPoint_total(preTotal+DAILYPT);
	}
	
	@Override
	public void addPointLog(PointLogVo pointlogVo) {
		// 새로운 포인트 변경사항 입력
		int preTotal = pointlogDao.selectPreTotal(pointlogVo.getUser_no());
		int pt = pointlogVo.getPoint_score();
		if(pt > 0) {
			pointlogVo.setPoint_total(preTotal + pt);
		} else {
			pointlogVo.setPoint_total(preTotal);
		}
		pointlogDao.insertPointLog(pointlogVo);
	}

	@Override
	public List<PointLogVo> getPointLogList(int user_no) {
		// 유저 포인트 로그 조회
		return pointlogDao.selectUserNo(user_no);
	}

}
