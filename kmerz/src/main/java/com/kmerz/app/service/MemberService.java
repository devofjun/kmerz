package com.kmerz.app.service;

import java.util.List;

import com.kmerz.app.vo.MemberVo;

public interface MemberService {
	public void joinMember(MemberVo memberVo);
	public List<MemberVo> getAllMembers();
	public MemberVo login(String user_id, String user_pw);
	public MemberVo selectID(String user_id);
	public MemberVo selectNO(int user_no);
	public int getUserNameCheckResult(String user_name);
	public void changeUserName(int user_no, String user_name);
}
