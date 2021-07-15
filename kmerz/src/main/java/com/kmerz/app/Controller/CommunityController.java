package com.kmerz.app.Controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kmerz.app.dao.CategoryDao;
import com.kmerz.app.service.CategoryService;
import com.kmerz.app.service.CommunityService;
import com.kmerz.app.vo.CategoryVo;
import com.kmerz.app.vo.CommunityVo;

@Controller
@RequestMapping(value = "/c")
public class CommunityController {
	
	@Inject
	CommunityService commService;
	
	@Inject
	CategoryService categoryService;
	
	// 커뮤니티 생성 신청 화면
	@RequestMapping(value = "/createForm", method = RequestMethod.GET)
	public String createCommunityForm() {
		return "community/createCommunityForm";
	}
	
	// 커뮤니티 생성
	@RequestMapping(value = "/createRun", method=RequestMethod.POST)
	public String createCommunityRun(CommunityVo communityVo) {
		commService.createCommunity(communityVo);
		return "redirect:/";
	}
	
	// 요청 커뮤니티 페이지
	@RequestMapping(value="/{community_tag}", method=RequestMethod.GET)
	public String testCommunityForm(@PathVariable("community_tag") String community_tag,
			Model model) {
		int community_id = 1;
		List<CategoryVo> categoryList = categoryService.getCategoryList(community_id);
		model.addAttribute("categoryList", categoryList);
		return null;
	}
	
}
