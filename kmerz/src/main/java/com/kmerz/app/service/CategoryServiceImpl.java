package com.kmerz.app.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kmerz.app.dao.CategoryDao;
import com.kmerz.app.vo.CategoryVo;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Inject
	CategoryDao categoryDao;
	
	@Override
	public List<CategoryVo> getCategoryList(int community_id) {
		List<CategoryVo> list = categoryDao.selectCategoryList(community_id);
		return list;
	}

}
