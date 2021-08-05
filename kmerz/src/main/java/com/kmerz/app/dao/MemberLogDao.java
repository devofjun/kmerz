package com.kmerz.app.dao;

import java.util.List;

import com.kmerz.app.vo.MemberLogVo;

public interface MemberLogDao {
	public void insertMemberLog(MemberLogVo memberLogVo);
	public List<MemberLogVo> selectDailyList(int member_logtype);
}
