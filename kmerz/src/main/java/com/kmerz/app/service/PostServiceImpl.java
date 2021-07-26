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
	public List<PostsVo> getCommunityPostList(String community_id) {
		List<PostsVo> list = postdao.selectCommunityPostList(community_id);
		return list;
	}

	@Override

	public void posting(PostsVo vo) {
		postdao.posting(vo);
	}

	public List<PostsVo> getCategoryPostList(String community_id, int category_no) {
		List<PostsVo> list = postdao.selectCategoryPostList(community_id, category_no);
		return list;
	}
	
	@Override
	public int getUserPostCount(int user_no) {
		int count = postdao.selectUserPostCount(user_no);
		return count;

	}

	@Override
	public int getNewPostSeq() {
		// 새로운 글 시퀀스 생성
		return postdao.selectSeqPostno();
	}

}
