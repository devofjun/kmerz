package com.kmerz.app.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kmerz.app.vo.PostsVo;

@Repository
public class PostDaoImpl implements PostDao {

	private static final String NAMESPACE = "com.kmerz.app.posts.";

	@Inject
	SqlSession session;

	@Override
	public List<PostsVo> selectAllPosts() {
		List<PostsVo> PostsList = session.selectList(NAMESPACE + "selectAllPosts");
		// System.out.println(PostsList);
		return PostsList;
	}

	@Override
	public PostsVo selectPost(int post_no) {
		PostsVo Post = session.selectOne(NAMESPACE + "selectPost", post_no);
		return Post;
	}

	// 커뮤니티 페이지 이동시 이동한 커뮤니티 포스트 리스트 가져오기
	@Override
	public List<PostsVo> selectCommunityPostList(String community_id) {
		List<PostsVo> list = session.selectList(NAMESPACE + "selectCommunityPostList", community_id);
		return list;
	}

	@Override
	public List<PostsVo> selectCategoryPostList(String community_id, int category_no) {
		Map<String, Object> map = new HashMap<>();
		map.put("community_id", community_id);
		map.put("category_no", category_no);
		List<PostsVo> list = session.selectList(NAMESPACE + "selectCategoryPostList", map);
		return list;
	}

	@Override
	public int selectUserPostCount(String user_name) {
		int count = session.selectOne(NAMESPACE + "selectUserPostCount", user_name);
		return count;
	}

}
