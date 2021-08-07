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
	
	private static final String COMM_STATUS_REQUEST = "request";		// 신청됨
	private static final String COMM_STATUS_WAIT = "wait";				// 검수중
	private static final String COMM_STATUS_ACCEPT = "accept";			// 승인됨
	private static final String COMM_STATUS_DENY = "deny";				// 반려됨
	private static final String COMM_STATUS_STOP = "stop";				// 운영정지
	
	@Override
	public List<CategoryVo> getCategoryList(String community_id) {
		List<CategoryVo> list = categoryDao.selectCategoryList(community_id, COMM_STATUS_ACCEPT);
		return list;
	}

	@Override
	public void createCategory(CategoryVo categoryVo) {
		categoryVo.setCategory_status(COMM_STATUS_REQUEST);
		categoryDao.insertCategory(categoryVo);
	}

	@Override
	public CategoryVo getCategoryName(int category_no) {
		return categoryDao.selectNO(category_no);
	}

}
