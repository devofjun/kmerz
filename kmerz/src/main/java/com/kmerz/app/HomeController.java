package com.kmerz.app;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kmerz.app.service.CommunityService;
import com.kmerz.app.service.PostService;
import com.kmerz.app.vo.CommunityVo;
import com.kmerz.app.vo.PostsVo;
@Controller
public class HomeController {
	
	@Inject
	CommunityService commService;
	
	@Inject
	PostService postService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		List<CommunityVo> commList = commService.getCommunityList();
		List<PostsVo> postList = postService.selectAllPosts();
		model.addAttribute("commList", commList);
		model.addAttribute("postList", postList);
		return "MainPage";
	}
	
	
	
	
}
