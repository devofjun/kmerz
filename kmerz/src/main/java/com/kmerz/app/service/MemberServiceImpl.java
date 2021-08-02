package com.kmerz.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kmerz.app.dao.MemberDao;
import com.kmerz.app.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService {

	public static final int STATUS_DENY = -2; // 로그인 불가능
	public static final int STATUS_CLOSE = -1; // 탈퇴
	public static final int STATUS_ALLOW = 0; // 로그인 가능
	public static final int STATUS_WRITE_LOCK = 1; // 로그인 가능, 게시글 쓰기 불가능
	
	
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
	@Transactional
	@Override
	public MemberVo login(String user_id, String user_pw) {
		MemberVo memberVo = memberDao.selectUser(user_id, user_pw);
		if(memberVo != null) {
			memberDao.updateCurrentLogin(memberVo.getUser_no());
		}
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
	public void changeUserPw(int user_no, String newPw) {
		memberDao.updateUserPw(user_no, newPw);
	}

	@Override
	public void changeProfileImage(int user_no, String filePath) {
		memberDao.updateUserProfileImage(user_no, filePath);
	}

	@Override
	public void setStatusDeny(int user_no) {
		// 사용자 차단
		memberDao.updateUserStatus(user_no, STATUS_DENY);
	}
	
	@Override
	public void setStatusClose(int user_no) {
		// 회원 탈퇴
		memberDao.updateUserStatus(user_no, STATUS_CLOSE);
	}

	@Override
	public void setStatusAllow(int user_no) {
		// 사용자 허용
		memberDao.updateUserStatus(user_no, STATUS_ALLOW);
	}

	@Override
	public void setStatusWriteLock(int user_no) {
		// 사용자 쓰기 차단
		memberDao.updateUserStatus(user_no, STATUS_WRITE_LOCK);
	}

}
