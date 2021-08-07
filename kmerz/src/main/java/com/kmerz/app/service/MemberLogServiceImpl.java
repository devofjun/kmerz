package com.kmerz.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kmerz.app.dao.MemberLogDao;
import com.kmerz.app.vo.MemberLogVo;

@Service
public class MemberLogServiceImpl implements MemberLogService {

	@Inject
	MemberLogDao memberLogDao;
	
	public static final int TYPE_SIGNUP = 1; // 회원가입
	public static final int TYPE_SIGNOUT = 2; // 회원탈퇴
	public static final int TYPE_LOGIN_SUCCESS = 3; // 로그인 성공
	public static final int TYPE_LOGIN_FAIL = 4; // 로그인 실패
	public static final int TYPE_LOGOUT = 5; // 로그인 실패
	
	@Override
	public void insertMemberLog(MemberLogVo memberLogVo) {
		// 회원 로그 입력
		memberLogDao.insertMemberLog(memberLogVo);
	}

	@Override
	public List<MemberLogVo> dailyLoginList() {
		// 일일 로그인 
		return memberLogDao.selectDailyList(TYPE_LOGIN_SUCCESS);
	}

	@Override
	public List<MemberLogVo> dailySignUpList() {
		// 일일 회원가입
		return memberLogDao.selectDailyList(TYPE_SIGNUP);
	}

}
