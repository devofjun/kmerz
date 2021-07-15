package com.kmerz.app.dao;

import java.util.List;

import com.kmerz.app.vo.CategoryVo;

public interface CategoryDao {
	public List<CategoryVo> selectCategoryList(int community_id);
}
