package com.kmerz.app.dao;

import java.util.List;

import com.kmerz.app.vo.MemberVo;

public interface MemberDao {
	public void insertMember(MemberVo memberVo);
	public List<MemberVo> selectAll();
}