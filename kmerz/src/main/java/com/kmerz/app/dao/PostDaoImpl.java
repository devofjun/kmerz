package com.kmerz.app.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kmerz.app.vo.PostsVo;

@Repository
public class PostDaoImpl implements PostDao{
	
	private static final String NAMESPACE = "com.kmerz.app.posts.";
	
	@Inject
	SqlSession session;
	
	@Override
	public List<PostsVo> selectAllPosts() {
		List<PostsVo> PostsList = session.selectList(NAMESPACE + "selectAllPosts");
		//System.out.println(PostsList);
		return PostsList;
	}

	@Override
	public PostsVo selectPost(int post_no) {
		PostsVo Post = session.selectOne(NAMESPACE + "selectPost", post_no);
		return null;
	}
	
}
