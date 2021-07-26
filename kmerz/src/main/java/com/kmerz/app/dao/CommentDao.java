package com.kmerz.app.dao;

import java.util.List;

import com.kmerz.app.vo.CommentVo;

public interface CommentDao {
	public List<CommentVo> selectCommentOnPost(int post_no);
	public void insertComment(CommentVo commentVo);
	public int selectuserCommentCount(int user_no);
}
