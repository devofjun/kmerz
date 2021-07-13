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
		System.out.println("서비스_모든회원검색");
		List<MemberVo> list = memberDao.selectAll();
		System.out.println("모든회원검색결과:"+list);
		return list;
	}

}
