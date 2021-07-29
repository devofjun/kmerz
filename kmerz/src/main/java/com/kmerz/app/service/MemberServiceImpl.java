package com.kmerz.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kmerz.app.dao.MemberDao;
import com.kmerz.app.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDao memberDao;
	
	// 회원 추가
	@Override
	public void joinMember(MemberVo memberVo) {
		memberDao.insertMember(memberVo);
	}

	// 모든 회원 검색
	@Override
	public List<MemberVo> getAllMembers() {
		List<MemberVo> list = memberDao.selectAll();
		return list;
	}

	// 로그인
	@Override
	public MemberVo login(String user_id, String user_pw) {
		MemberVo memberVo = memberDao.selectUser(user_id, user_pw);
		return memberVo;
	}

	@Override
	public MemberVo selectID(String user_id) {
		return memberDao.selectID(user_id);
	}

	@Override
	public int getUserNameCheckResult(String user_name) {
		int count = memberDao.selectUserCount(user_name);
		return count;
	}

	@Override
	public void changeUserName(int user_no, String user_name) {
		memberDao.updateUserName(user_no, user_name);
	}

	@Override
	public MemberVo selectNO(int user_no) {
		// TODO Auto-generated method stub
		return memberDao.selectNO(user_no);
	}

}
