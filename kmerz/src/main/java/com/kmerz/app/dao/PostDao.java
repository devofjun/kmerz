package com.kmerz.app.dao;

import java.util.List;

import com.kmerz.app.dto.PostPagingDto;
import com.kmerz.app.vo.PostsVo;

public interface PostDao {
	public int countAllPosts(PostPagingDto postPagingDto);
	public List<PostsVo> selectAllPosts(PostPagingDto postPagingDto);
	public List<PostsVo> selectAllowPosts(int status);
	public PostsVo selectPostNo(int post_no);
	public void updateReadCount(int post_no);
	public List<PostsVo> selectCommunityPostList(String community_id, int status);
	public void posting(PostsVo vo);
	public List<PostsVo> selectCategoryPostList(String community_id, int category_no, int status);
	public List<PostsVo> selectUserNoList(int user_no);
	public int selectUserPostCount(int user_no);
	public int selectSeqPostno();
	public PostsVo selectLoadPost(int init_post);
	public PostsVo selectLoadCommunityPost(int init_post, String community_id);
	// 게시글 상태 변경
	public void updateStatus(int target, int status);
	public void updateListStatus(List<Integer> list, int status);
	public List<PostsVo> selectListStatus(List<Integer> list);
	public void updatePost(PostsVo vo);
	public int countPosts();
	public int selectCurrentSeq();
	public List<PostsVo> selectDailyPost();
	public int countCommPosts(String community_id);
}
