package com.kmerz.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kmerz.app.dao.DeclaredDao;
import com.kmerz.app.dao.PostDao;
import com.kmerz.app.vo.DeclaredVo;
import com.kmerz.app.vo.PostsVo;

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

	@Transactional
	@Override
	public List<DeclaredVo> getTargetUserNOList(int target_user_no) {
		// 유저의 신고당한 건들
		List<DeclaredVo> list = declaredDao.selectTargetUser(target_user_no);
		for(DeclaredVo vo : list) {
			if(vo.getTarget_type() == TYPE_POST) {
				vo.setStr_target_type("게시글");
				
				PostsVo post = postDao.selectPostNo(vo.getTarget_id());
				String post_title = post.getPost_title();
				vo.setPost_title(post_title);
			} else if(vo.getTarget_type() == TYPE_COMMENT) {
				vo.setStr_target_type("댓글");
			}
			
		}
		return list;
	}

	
	
	
}
