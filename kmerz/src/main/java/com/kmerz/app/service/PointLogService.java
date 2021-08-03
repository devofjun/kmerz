package com.kmerz.app.service;

import java.util.List;

import com.kmerz.app.vo.PointLogVo;

public interface PointLogService {
	public void addPointLog(int user_no, String point_content, int point_score);
	public List<PointLogVo> getPointLogList(int user_no);
}
