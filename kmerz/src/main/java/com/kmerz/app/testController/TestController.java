package com.kmerz.app.testController;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kmerz.app.service.CategoryService;
import com.kmerz.app.service.CommunityService;
import com.kmerz.app.util.ContentReadAndWrite;
import com.kmerz.app.vo.CategoryVo;

@Controller
public class TestController {
	
	@Inject
	CommunityService commService;
	
	@Inject
	CategoryService categoryService;
	
	@RequestMapping(value="/c")
	public String headerTest(Model model, CategoryVo categoryVo) {
		String community_id = "star";
		String category_status = null;
		List<CategoryVo> categoryList = categoryService.getCategoryList(community_id, category_status);
		System.out.println("categoryList: " + categoryList);
		model.addAttribute("categoryList", categoryList);
		return "community/CommunityPage";
	}
	
	@RequestMapping(value="/f")
	public String findPassword() {
		return "member/findPasswordForm";
	}
	
	// 게시물 내용 가져오기
	@ResponseBody
	@RequestMapping(value = "/g", method = RequestMethod.GET)
	public String getPostContent(String post_content_file) throws Exception {
		return ContentReadAndWrite.ReadContent(post_content_file);
	}
	
}
