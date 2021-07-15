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
	public List<CategoryVo> getCategoryList() {
		List<CategoryVo> list = categoryDao.selectCategoryList();
		return list;
	}

}
