package com.kmerz.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kmerz.app.dao.CommentDao;
import com.kmerz.app.vo.CommentVo;
@Service
public class CommentServiceImpl implements CommentService {
	@Inject
	CommentDao CommentDao;
	@Override
	public List<CommentVo> selectCommentOnPost(int post_no) {
		List<CommentVo> list = CommentDao.selectCommentOnPost(post_no);
		return list;
	}
	@Override
	public int getUserCommentCount(int user_no) {
		int count = CommentDao.selectuserCommentCount(user_no);
		return count;
	}
	@Override
	public void insertComment(CommentVo commentVo) {
		CommentDao.insertComment(commentVo);
	}

}
