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
	public int countAllPosts(PostPagingDto postPagingDto) {
		// 게시글 수
		return session.selectOne(NAMESPACE+"countAllPosts", postPagingDto);
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

	// 글번호로 게시글 가져오기
	@Override
	public PostsVo selectPostNo(int post_no) {
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
	public List<PostsVo> selectUserNoList(int user_no) {
		// 유저의 게시글
		return session.selectList(NAMESPACE+"selectUserNoList", user_no);
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
	public PostsVo selectLoadCommunityPost(int init_post, String community_id) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("init_post", init_post);
		map.put("community_id", community_id);
		PostsVo postVo = session.selectOne(NAMESPACE + "selectLoadCommunityPost" , map);
		System.out.println("DAO::"+postVo);
		return postVo;
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


	@Override
	public void updateListStatus(List<Integer> list, int status) {
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("post_status", status);
		session.update(NAMESPACE+"updateListStatus", map);
	}


	@Override
	public List<PostsVo> selectListStatus(List<Integer> list) {
		// 여러 게시글 상태 보기
		return session.selectList(NAMESPACE+"selectListStatus", list);
	}
	
	public int countPosts() {
		return session.selectOne(NAMESPACE + "countPosts");
	}


	@Override
	public int selectCurrentSeq() {
		return session.selectOne(NAMESPACE + "selectCurrentSeq");
	}


	@Override
	public List<PostsVo> selectDailyPost() {
		// 오늘 만들어진 게시글 조회
		return session.selectList(NAMESPACE+"selectDailyPost");
	}


	@Override
	public int countCommPosts(String community_id) {
		
		return session.selectOne(NAMESPACE+"countCommPosts", community_id);
	}


	
	

	
}
