package com.kmerz.app.service;

import java.util.List;

import com.kmerz.app.vo.PostsVo;

public interface PostService {
	public List<PostsVo> selectAllPosts();
	public PostsVo selectPost(int post_no);
	public List<PostsVo> getCommunityPostList(String community_name);
}
