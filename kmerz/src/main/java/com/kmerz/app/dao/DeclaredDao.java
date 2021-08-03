package com.kmerz.app.dao;

import java.util.List;

import com.kmerz.app.vo.DeclaredVo;

public interface DeclaredDao {
	public void insertDeclared(DeclaredVo declaredVo);
	public List<DeclaredVo> selectTargetID(int target_id, int target_type);
	public int selectTargetIDCount(int target_id, int target_type);
	public int selectTargetUserCount(int target_user_no);
}
