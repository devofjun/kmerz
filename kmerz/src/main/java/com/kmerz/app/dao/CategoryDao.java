package com.kmerz.app.dao;

import java.util.List;

import com.kmerz.app.vo.CategoryVo;

public interface CategoryDao {
	public List<CategoryVo> selectCategoryList(String community_id, String category_status);
	public void insertCategory(CategoryVo categoryVo);
	public CategoryVo selectNO(int category_no);
}
