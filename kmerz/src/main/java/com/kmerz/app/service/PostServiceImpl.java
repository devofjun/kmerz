package com.kmerz.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kmerz.app.dao.CategoryDao;
import com.kmerz.app.dao.CommunityDao;
import com.kmerz.app.dao.DeclaredDao;
import com.kmerz.app.dao.MemberDao;
import com.kmerz.app.dao.PostDao;
import com.kmerz.app.dto.PostPagingDto;
import com.kmerz.app.vo.CategoryVo;
import com.kmerz.app.vo.CommunityVo;
import com.kmerz.app.vo.MemberVo;
import com.kmerz.app.vo.PostsVo;
@Service
public class PostServiceImpl implements PostService{

	// 읽을수 있는 게시글 양수, 읽을 수 없는 게시글 음수
	private static final int POST_LOCK = -2;
	private static final int POST_DELETE = -1;
	private static final int POST_CREATE = 0;
	private static final int POST_UPDATE = 1;
	
	@Inject
	PostDao postdao;
	@Inject
	MemberDao memberDao;
	@Inject
	CommunityDao communityDao;
	@Inject
	CategoryDao categoryDao;
	@Inject
	DeclaredDao declaredDao;
	
	
	@Override
	public int getCountPosts(PostPagingDto postPagingDto) {
		return postdao.countPosts(postPagingDto);
	}

	// 게시글Vo에 추가적으로 필요한 데이터들
	private void settingPostsVo(List<PostsVo> postsList) {
		if(postsList != null) {
			for(PostsVo postVo : postsList) {
				// 유저 이름
				MemberVo memberVo = memberDao.selectNO(postVo.getUser_no());
				postVo.setUser_name(memberVo.getUser_name());
				// 커뮤니티 이름
				CommunityVo commVo = communityDao.getOneCommunity(postVo.getCommunity_id());
				postVo.setCommunity_name(commVo.getCommunity_name());
				// 카테고리 이름
				CategoryVo categoryVo = categoryDao.selectNO(postVo.getCategory_no()); 
				postVo.setCategory_name(categoryVo.getCategory_name());
				// 신고수
				int declared_count = declaredDao.selectTargetIDCount(postVo.getPost_no(), DeclaredServiceImpl.TYPE_POST);
				postVo.setDeclared_count(declared_count);
				// 글 상태
				switch(postVo.getPost_status()) {
					case POST_LOCK:
						postVo.setStr_post_status("잠김");
						break;
					case POST_DELETE:
						postVo.setStr_post_status("삭제됨");
						break;
					case POST_CREATE:
						postVo.setStr_post_status("작성됨");
						break;
					case POST_UPDATE:
						postVo.setStr_post_status("수정됨");
						break;
				}
			}
		}
	}
	
	@Transactional
	@Override
	public List<PostsVo> selectAllPosts(PostPagingDto postPagingDto) {
		// 모든 게시글(관리자 페이지에서 필요함)
		List<PostsVo> postsList = postdao.selectAllPosts(postPagingDto);
		settingPostsVo(postsList);
		return postsList;
	}
	
	@Transactional
	@Override
	public List<PostsVo> selectAllowPosts() {
		// 승인된 모든 게시글 
		List<PostsVo> postsList = postdao.selectAllowPosts(POST_CREATE);
		settingPostsVo(postsList);
		return postsList;
	}

	@Transactional
	@Override
	public PostsVo selectPost(int post_no) {
		// 관리자용 게시글 보기 (조회수 증가 x)
		PostsVo postVo = postdao.selectPostNo(post_no);
		//System.out.println("포스트노:" + post_no);
		//System.out.println("포스트븨오:" + postVo);
		if(postVo != null) {
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
		return postVo;
	}
	
	
	@Transactional
	@Override
	public PostsVo viewPost(int post_no) {
		PostsVo postVo = postdao.selectPostNo(post_no);
		//System.out.println("포스트노:" + post_no);
		//System.out.println("포스트븨오:" + postVo);
		if(postVo != null) {
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
		postdao.updateReadCount(post_no);
		return postVo;
	}

	
	
	
	@Override
	public List<PostsVo> getCommunityPostList(String community_id) {
		// 커뮤니티 전체글 보기
		List<PostsVo> list = postdao.selectCommunityPostList(community_id, POST_CREATE);
		return list;
	}

	@Override
	public List<PostsVo> getCategoryPostList(String community_id, int category_no) {
		// 커뮤니티-카테고리 글 보기
		List<PostsVo> list = postdao.selectCategoryPostList(community_id, category_no, POST_CREATE);
		return list;
	}
	
	@Override
	public void posting(PostsVo vo) {
		// 새로운 게시글 작성
		postdao.posting(vo);
	}

	
	@Override
	public int getUserPostCount(int user_no) {
		// 유저의 게시글 수 세기
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
	
	@Override
	public void updatePost(PostsVo postsVo) {
		// 게시글 수정하기
		postdao.updatePost(postsVo);
	}
	
	@Override
	public void deletePost(int post_no) {
		// 게시글 삭제하기
		postdao.updateStatus(post_no, POST_DELETE);
	}
	
	@Override
	public void lockPost(int post_no) {
		// 포스트 잠그기
		postdao.updateStatus(post_no, POST_LOCK);
	}
	
	@Override
	public void unlockPost(int post_no) {
		// 포스트 잠금 풀기 
		PostsVo postVo = postdao.selectPostNo(post_no);
		if(postVo.getPost_updatetime() != null) {
			postdao.updateStatus(post_no, POST_UPDATE);
		} else {
			postdao.updateStatus(post_no, POST_CREATE);	
		}
	}

	
	

	
}
