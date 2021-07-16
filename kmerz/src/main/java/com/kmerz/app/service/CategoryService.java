package com.kmerz.app.service;

import java.util.List;

import com.kmerz.app.vo.CategoryVo;

public interface CategoryService {
	public List<CategoryVo> getCategoryList(String community_id, String category_status);
	public void createCategory(CategoryVo categoryVo);
}
