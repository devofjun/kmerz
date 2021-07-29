package com.kmerz.app.service;

import java.util.List;

import com.kmerz.app.vo.DeclaredVo;

public interface DeclaredService {
	public void addPostDeclared(DeclaredVo declaredVo);
	public void addCommentDeclared(DeclaredVo declaredVo);
	public List<DeclaredVo> getDeclared(int target_id, int target_type);
	public int getDeclaredCount(int target_id, int target_type);
}
