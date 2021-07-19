package com.kmerz.app.Controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kmerz.app.service.CategoryService;
import com.kmerz.app.vo.CategoryVo;
import com.kmerz.app.vo.CommunityVo;

@Controller
@RequestMapping(value = "/c")
public class CategoryController {
	
	@Inject
	CategoryService categoryService;
	
	// 카테고리 생성 페이지로 이동
	@RequestMapping(value="/createCategoryForm", method = RequestMethod.GET)
	public String createCategoryForm() {
		return "/category/createCategoryForm";
	}
	
	// 카테고리 생성
	@RequestMapping(value = "/createCategoryRun", method=RequestMethod.POST)
	public String createCategoryRun(CategoryVo categoryVo) {
			categoryVo.setCommunity_id("star");
			categoryService.createCategory(categoryVo);
			System.out.println(categoryVo);
			return "redirect:/c";
	}
}
