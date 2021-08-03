package com.kmerz.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kmerz.app.dao.DeclaredDao;
import com.kmerz.app.dao.PostDao;
import com.kmerz.app.vo.DeclaredVo;

@Service
public class DeclaredServiceImpl implements DeclaredService {

	public static final int TYPE_POST = 1;
	public static final int TYPE_COMMENT = 2;
	
	@Inject
	DeclaredDao declaredDao;
	@Inject
	PostDao postDao;
	
	@Override
	public void addPostDeclared(DeclaredVo declaredVo) {
		// 게시글 신고 추가하기
		declaredVo.setTarget_type(TYPE_POST);
		declaredDao.insertDeclared(declaredVo);
	}
	
	@Override
	public void addCommentDeclared(DeclaredVo declaredVo) {
		// 댓글 신고 추가하기
		declaredVo.setTarget_type(TYPE_COMMENT);
		declaredDao.insertDeclared(declaredVo);
	}
	
	@Override
	public List<DeclaredVo> getDeclared(int target_id, int target_type) {
		// 신고한 타겟의 ID와 타입으로 신고 정보 리스트로 가져오기
		return declaredDao.selectTargetID(target_id, target_type);
	}

	@Override
	public int getDeclaredCount(int target_id, int target_type) {
		// 글의 신고수
		return declaredDao.selectTargetIDCount(target_id, target_type);
	}

	@Override
	public List<DeclaredVo> getTargetUserNOList(int target_user_no) {
		// 유저의 신고당한 건들
		return declaredDao.selectTargetUser(target_user_no);
	}

	
	
	
}
