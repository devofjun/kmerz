package com.kmerz.app.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kmerz.app.vo.CategoryVo;

@Repository
public class CategoryDaoImpl implements CategoryDao {
	
	private static final String NAMESPACE = "com.kmerz.app.category.";

	@Inject
	SqlSession sqlsession;
	
	@Override
	public List<CategoryVo> selectCategoryList(String community_id, String category_status) {
		Map<String, String> map = new HashMap<>();
		map.put("community_id", community_id);
		map.put("category_status", category_status);
		List<CategoryVo> list = sqlsession.selectList(NAMESPACE + "selectCategoryList", map);
		return list;
	}

	@Override
	public void insertCategory(CategoryVo categoryVo) {
		sqlsession.insert(NAMESPACE + "insertCategory", categoryVo);
	}

	@Override
	public CategoryVo selectNO(int category_no) {
		// 카테로기 번호로 카테고리 정보 가져오기
		return sqlsession.selectOne(NAMESPACE+"selectNO", category_no);
	}

}
