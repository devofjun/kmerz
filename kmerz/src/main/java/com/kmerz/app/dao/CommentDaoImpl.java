package com.kmerz.app.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kmerz.app.vo.CommentVo;
@Repository
public class CommentDaoImpl implements CommentDao {
	private static final String NAMESPACE = "com.kmerz.app.comment.";
	@Inject
	SqlSession session;
	@Override
	public List<CommentVo> selectCommentOnPost(int post_no) {
		List<CommentVo> list = session.selectList(NAMESPACE + "selectCommentOnPost", post_no);
		return list;
	}
	@Override
	public int selectuserCommentCount(int user_no) {
		int count = session.selectOne(NAMESPACE + "selectuserCommentCount", user_no);
		return count;
	}

}
