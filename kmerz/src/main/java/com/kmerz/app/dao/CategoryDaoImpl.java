package com.kmerz.app.dao;

import java.util.List;

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
	public List<CategoryVo> selectCategoryList(int community_id) {
		List<CategoryVo> list = sqlsession.selectList(NAMESPACE + "selectCategoryList", community_id);
		return list;
	}

}
