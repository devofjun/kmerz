package com.kmerz.app.service;

import java.util.List;

import com.kmerz.app.vo.PostsVo;

public interface PostService {
	public List<PostsVo> selectAllPosts();
	public List<PostsVo> selectAdmitPosts();
	public PostsVo selectPost(int post_no);
	public List<PostsVo> getCommunityPostList(String community_id);
	public void posting(PostsVo vo);
	public List<PostsVo> getCategoryPostList(String community_id, int category_no);
	public int getUserPostCount(int user_no);
	public int getNewPostSeq();
	public void denyPost(int postNo);
	public void admitPost(int postNo);
}
