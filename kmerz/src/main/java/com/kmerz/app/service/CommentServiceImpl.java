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
	public int getUserCommentCount(String user_name) {
		int count = CommentDao.selectuserCommentCount(user_name);
		return count;
	}
	@Override
	public void insertComment(CommentVo commentVo) {
		CommentDao.insertComment(commentVo);
	}

}
