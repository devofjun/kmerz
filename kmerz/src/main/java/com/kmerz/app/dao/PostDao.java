package com.kmerz.app.dao;

import java.util.List;

import com.kmerz.app.dto.PostPagingDto;
import com.kmerz.app.vo.PostsVo;

public interface PostDao {
	public int countPosts(PostPagingDto postPagingDto);
	public List<PostsVo> selectAllPosts(PostPagingDto postPagingDto);
	public List<PostsVo> selectAllowPosts(int status);
	public PostsVo selectPost(int post_no);
	public void updateReadCount(int post_no);
	public List<PostsVo> selectCommunityPostList(String community_id, int status);
	public void posting(PostsVo vo);
	public List<PostsVo> selectCategoryPostList(String community_id, int category_no, int status);
	public int selectUserPostCount(int user_no);
	public int selectSeqPostno();
	public PostsVo selectLoadPost(int init_post);
	public void updatePost(PostsVo postsVo);
	// 게시글 상태 변경
	public void updateStatus(int target, int status);
}
