package com.kmerz.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kmerz.app.dao.PostDao;
import com.kmerz.app.vo.PostsVo;
@Service
public class PostServiceImpl implements PostService{

	@Inject
	PostDao postdao;
	
	@Override
	public List<PostsVo> selectAllPosts() {
		List<PostsVo> PostsList = postdao.selectAllPosts();
		return PostsList;
	}

	@Override
	public PostsVo selectPost(int post_no) {
		PostsVo post = postdao.selectPost(post_no);
		return post;
	}

	@Override
	public List<PostsVo> getCommunityPostList(String community_name) {
		List<PostsVo> list = postdao.selectCommunityPostList(community_name);
		return list;
	}

}
