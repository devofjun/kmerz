package com.kmerz.app.dao;

import java.util.List;

import com.kmerz.app.dto.MemberPagingDto;
import com.kmerz.app.vo.MemberVo;

public interface MemberDao {
	public int selectSeqUserNO();
	public void insertMember(MemberVo memberVo);
	public List<MemberVo> selectAll(MemberPagingDto memberPagingDto);
	public int selectAllCount(MemberPagingDto memberPagingDto);
	public MemberVo selectUser(String user_id, String user_pw);
	public void updateCurrentLogin(int user_no);
	public MemberVo selectID(String user_id);
	public MemberVo selectNO(int user_no);
	public int selectUserIdCount(String user_id);
	public int selectUserNameCount(String user_name);
	public void updateUserName(int user_no, String user_name);
	public void updateUserPw(int user_no, String newPw);
	public void updateUserProfileImage(int user_no, String filePath);
	public void updateUserStatus(int user_no, int user_status);
	public void updateUserPoint(int user_no, int user_point, int user_totalpoint);
}
