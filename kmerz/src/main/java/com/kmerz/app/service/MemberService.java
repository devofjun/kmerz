package com.kmerz.app.service;

import java.util.List;

import com.kmerz.app.vo.MemberVo;

public interface MemberService {
	public void joinMember(MemberVo memberVo);
	public List<MemberVo> getAllMembers();
}
