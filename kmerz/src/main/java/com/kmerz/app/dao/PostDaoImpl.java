package com.kmerz.app.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kmerz.app.dto.PostPagingDto;
import com.kmerz.app.vo.PostsVo;

@Repository
public class PostDaoImpl implements PostDao {

	private static final String NAMESPACE = "com.kmerz.app.posts.";

	@Inject
	SqlSession session;
	
	
	@Override
	public int countAllPosts() {
		// 게시글 수
		return session.selectOne(NAMESPACE+"countAllPosts");
	}

	
	@Override
	public List<PostsVo> selectAllPosts(PostPagingDto postPagingDto) {
		// 모든 게시글 가져오기
		List<PostsVo> PostsList = session.selectList(NAMESPACE + "selectAllPosts", postPagingDto);
		// System.out.println(PostsList);
		return PostsList;
	}
	
	@Override
	public List<PostsVo> selectAllowPosts(int status) {
		// 허용된 모든 게시글 읽기
		List<PostsVo> postsList = session.selectList(NAMESPACE + "selectAllowPosts", status);
		return postsList;
	}

	// test
	@Override
	public PostsVo selectPost(int post_no) {
		PostsVo Post = session.selectOne(NAMESPACE + "selectPost", post_no);
		return Post;
	}
	
	@Override
	public void updateReadCount(int post_no) {
		// 조회수 증가
		session.update(NAMESPACE+"updateReadCount", post_no);
	}

	// 커뮤니티 페이지 이동시 이동한 커뮤니티 포스트 리스트 가져오기
	@Override
	public List<PostsVo> selectCommunityPostList(String community_id, int status) {
		Map<String, Object> map = new HashMap<>();
		map.put("community_id", community_id);
		map.put("post_status", status);
		List<PostsVo> list = session.selectList(NAMESPACE + "selectCommunityPostList", map);
		return list;
	}

	@Override
	public void posting(PostsVo vo) {
		session.insert(NAMESPACE + "postingDetail", vo);
		//System.out.println("포스팅븨오"+vo);
	}
	
	@Override
	public List<PostsVo> selectCategoryPostList(String community_id, int category_no, int status) {
		Map<String, Object> map = new HashMap<>();
		map.put("community_id", community_id);
		map.put("category_no", category_no);
		map.put("post_status", status);
		List<PostsVo> list = session.selectList(NAMESPACE + "selectCategoryPostList", map);
		return list;
	}

	@Override
	public int selectUserPostCount(int user_no) {
		int count = session.selectOne(NAMESPACE + "selectUserPostCount", user_no);
		return count;
	}

	@Override
	public int selectSeqPostno() {
		// 글번호 시퀀스 생성
		return session.selectOne(NAMESPACE+"selectSeqPostno");
	}

	@Override
	public PostsVo selectLoadPost(int init_post) {
		// TODO Auto-generated method stub
		return session.selectOne(NAMESPACE + "selectLoadPost" , init_post);
	}
	
	@Override
	public void updatePost(PostsVo postsVo) {
		// 글 수정
		session.update(NAMESPACE+"updatePost", postsVo);
	}
	
	@Override
	public void updateStatus(int target, int status) {
		// 게시글 상태 변경
		PostsVo postsVo = new PostsVo(target, status);
		session.update(NAMESPACE+"updateStatus", postsVo);
	}

	
}
