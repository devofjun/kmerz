package com.kmerz.app.dao;

import java.util.List;

import com.kmerz.app.vo.MemberVo;

public interface MemberDao {
	public void insertMember(MemberVo memberVo);
	public List<MemberVo> selectAll();
	public MemberVo selectUser(String user_id, String user_pw);
	public MemberVo selectID(String user_id);
	public MemberVo selectNO(int user_no);
	public int selectUserCount(String user_name);
	public void updateUserName(int user_no, String user_name);
}
