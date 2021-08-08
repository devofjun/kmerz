package com.kmerz.app.service;

import java.util.List;

import com.kmerz.app.vo.MemberLogVo;

public interface MemberLogService {
	public void insertMemberLog(MemberLogVo memberLogVo);
	public List<MemberLogVo> dailyLoginList();
	public List<MemberLogVo> dailySignUpList();
}
