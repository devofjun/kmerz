package com.kmerz.app.dao;

import java.util.List;

import com.kmerz.app.vo.CommentVo;

public interface CommentDao {
	public List<CommentVo> selectCommentOnPost(int post_no);
	public int selectuserCommentCount(String user_name);
	public void insertComment(CommentVo commentVo);
}
