package com.kmerz.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kmerz.app.dao.CategoryDao;
import com.kmerz.app.dao.CommunityDao;
import com.kmerz.app.dao.MemberDao;
import com.kmerz.app.dao.PostDao;
import com.kmerz.app.vo.CategoryVo;
import com.kmerz.app.vo.CommunityVo;
import com.kmerz.app.vo.MemberVo;
import com.kmerz.app.vo.PostsVo;
@Service
public class PostServiceImpl implements PostService{

	@Inject
	PostDao postdao;
	@Inject
	MemberDao memberDao;
	@Inject
	CommunityDao communityDao;
	@Inject
	CategoryDao categoryDao;
	
	@Transactional
	@Override
	public List<PostsVo> selectAllPosts() {
		// 모든 게시글 
		List<PostsVo> PostsList = postdao.selectAllPosts();
		for(PostsVo postVo : PostsList) {
			// 유저 이름
			MemberVo memberVo = memberDao.selectNO(postVo.getUser_no());
			postVo.setUser_name(memberVo.getUser_name());
			// 커뮤니티 이름
			CommunityVo commVo = communityDao.getOneCommunity(postVo.getCommunity_id());
			postVo.setCommunity_name(commVo.getCommunity_name());
			// 카테고리 이름
			CategoryVo categoryVo = categoryDao.selectNO(postVo.getCategory_no()); 
			postVo.setCategory_name(categoryVo.getCategory_name());
		}
		return PostsList;
	}

	@Override
	public PostsVo selectPost(int post_no) {
		PostsVo postVo = postdao.selectPost(post_no);
		// 유저 이름
		System.out.println("포스트노:" + post_no);
		System.out.println("포스트븨오:" + postVo);
		MemberVo memberVo = memberDao.selectNO(postVo.getUser_no());
		postVo.setUser_name(memberVo.getUser_name());
		// 커뮤니티 이름
		CommunityVo commVo = communityDao.getOneCommunity(postVo.getCommunity_id());
		postVo.setCommunity_name(commVo.getCommunity_name());
		// 카테고리 이름
		CategoryVo categoryVo = categoryDao.selectNO(postVo.getCategory_no()); 
		postVo.setCategory_name(categoryVo.getCategory_name());		
		return postVo;
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

	@Override
	public PostsVo selectLoadPost(int init_post){
		// TODO Auto-generated method stub
		return postdao.selectLoadPost(init_post);
	}

}
