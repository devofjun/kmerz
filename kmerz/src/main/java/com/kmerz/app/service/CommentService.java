package com.kmerz.app.service;

import java.util.List;

import com.kmerz.app.vo.CommentVo;

public interface CommentService {
	public List<CommentVo> selectCommentOnPost(int post_no);
	public int getUserCommentCount(String user_name);
}
