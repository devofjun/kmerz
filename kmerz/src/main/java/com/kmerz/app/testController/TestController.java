package com.kmerz.app.testController;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kmerz.app.service.CategoryService;
import com.kmerz.app.service.CommunityService;
import com.kmerz.app.vo.CategoryVo;

@Controller
public class TestController {
	
	@Inject
	CommunityService commService;
	
	@Inject
	CategoryService categoryService;
	
	@RequestMapping(value="/c")
	public String headerTest(Model model) {
		int community_id = 1;
		List<CategoryVo> categoryList = categoryService.getCategoryList(community_id);
		System.out.println("categoryList: " + categoryList);
		model.addAttribute("categoryList", categoryList);
		return "community/CommunityPage";
	}
	
	@RequestMapping(value="/f")
	public String findPassword() {
		return "member/findPasswordForm";
	}
}
