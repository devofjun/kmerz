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
import com.kmerz.app.service.PostService;
import com.kmerz.app.vo.CategoryVo;
import com.kmerz.app.vo.CommunityVo;
import com.kmerz.app.vo.PostsVo;

@Controller
@RequestMapping(value = "/c")
public class CommunityController {
	
	@Inject
	CommunityService commService;
	
	@Inject
	CategoryService categoryService;
	
	@Inject
	PostService postService;
	
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
	
	
	@RequestMapping(value="/{community_id}", method=RequestMethod.GET)
	public String testCommunityForm(@PathVariable("community_id") String community_id, String community_name,
			Model model) {
		System.out.println("community_id: " + community_id);
		String category_status = null; // 서비스 임플에서 넣어주는 값
		List<CategoryVo> categoryList = categoryService.getCategoryList(community_id, category_status);
		model.addAttribute("categoryList", categoryList);
		
		// 커뮤니티 이동시 고것에 맞는 포스트만 리스트 가져오기
		List<PostsVo> postList = postService.getCommunityPostList(community_id);
		System.out.println("postList: " + postList);
		model.addAttribute("postList", postList);
		return "community/CommunityPage";
	}
	
}
